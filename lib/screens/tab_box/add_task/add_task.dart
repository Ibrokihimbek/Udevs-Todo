import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_bloc.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_event.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_state.dart';
import 'package:udevs_to_do/cubit/get_to_do/get_to_do_cubit.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/screens/tab_box/add_task/widgets/add_category_widget.dart';
import 'package:udevs_to_do/screens/tab_box/add_task/widgets/divider_widget.dart';
import 'package:udevs_to_do/services/get_it/get_it.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_icons/app_icons.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/utils/date_formatter/date_format.dart';
import 'package:udevs_to_do/utils/toast/flutter_toast.dart';
import 'package:udevs_to_do/widgets/global_button.dart';
import 'package:udevs_to_do/widgets/input_decoration_widget.dart';

// ignore: must_be_immutable
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController addTitleController = TextEditingController();

  TextEditingController addDescriptioneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  DateTime? taskDay;

  TimeOfDay? taskTime;
  int categoryId = -1;
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDosBloc, ToDoState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
              color: AppColors.white,
            ),
            height: 450.h,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 26.w,
                      vertical: 16.h,
                    ).r,
                    child: TextFormField(
                      controller: addTitleController,
                      textInputAction: TextInputAction.newline,
                      maxLength: 30,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter title';
                        }
                      },
                      style: fontRubikW400(appcolor: AppColors.c_373737)
                          .copyWith(fontSize: 14.sp),
                      decoration: getInputDecoration(label: 'Title'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w).r,
                    child: TextFormField(
                      controller: addDescriptioneController,
                      textInputAction: TextInputAction.newline,
                      maxLines: 2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                      },
                      style: fontRubikW400(appcolor: AppColors.c_373737)
                          .copyWith(fontSize: 14.sp),
                      decoration: getInputDecoration(label: 'Description'),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  const DividerWidget(),
                  SizedBox(height: 12.h),
                  AddCategoryWidget(
                      onTap: (value) {
                        categoryId = value;
                        setState(() {
                          currentIndex = value - 1;
                        });
                      },
                      currentIndex: currentIndex),
                  SizedBox(height: 12.h),
                  const DividerWidget(),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w).r,
                    child: Row(
                      children: [
                        GlobalButton(
                          onTap: () async {
                            taskDay = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2300),
                            );
                            // ignore: use_build_context_synchronously
                            taskTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            taskDay = DateTime(
                              taskDay?.year ?? 0000,
                              taskDay?.month ?? 00,
                              taskDay?.day ?? 00,
                              taskTime?.hour ?? 00,
                              taskTime?.minute ?? 00,
                            );
                          },
                          gradientFirst: AppColors.c_7EB6FF,
                          gradientSekond: AppColors.c_5F87E7,
                          buttonName: 'Add time',
                          height: 30,
                          width: 100,
                          sizeFont: 16,
                          colorShadow: AppColors.c_6894EE,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          TimeUtils.formatToWeekMonthDay(
                              taskDay ?? DateTime.now()),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          TimeUtils.formatToHour(taskDay ?? DateTime.now()),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 26.w,
                      vertical: 16.h,
                    ).r,
                    child: GlobalButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState?.save();
                          if (addDescriptioneController.text.isNotEmpty &&
                              addDescriptioneController.text.isNotEmpty &&
                              taskDay != null &&
                              categoryId != -1) {
                            FocusManager.instance.primaryFocus?.unfocus();
                              BlocProvider.of<ToDosBloc>(context).add(
                                AddToDo(
                                  toDo: TodoModel(
                                    createdAt: DateTime.now().toString(),
                                    title: addTitleController.text,
                                    description: addDescriptioneController.text,
                                    date: taskDay.toString(),
                                    categoryId: categoryId,
                                    isCompleted: 0,
                                  ),
                                ),
                              );
                            debugPrint('''
                                  createdAt: ${DateTime.now()},
                                  title: ${addTitleController.text},
                                  description: ${addDescriptioneController.text},
                                  date: ${taskDay.toString()},
                                  categoryId: $categoryId,


''');
                            Navigator.pop(context);
                          } else {
                            getMyToast(
                                message:
                                    'Complete the other sections below as well');
                          }
                        }
                      },
                      gradientFirst: AppColors.c_7EB6FF,
                      gradientSekond: AppColors.c_5F87E7,
                      buttonName: 'Add task',
                      height: 53,
                      width: double.infinity,
                      sizeFont: 18,
                      colorShadow: AppColors.c_6894EE,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.status == ToDoStatus.taskAdded ||
            state.status == ToDoStatus.taskUpdated ||
            state.status == ToDoStatus.taskDeleted) {
          BlocProvider.of<GetToDoCubit>(context).fetchAllTasks();
        }
      },
    );
  }
}
