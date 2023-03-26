import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_bloc.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_event.dart';
import 'package:udevs_to_do/cubit/get_to_do/get_to_do_cubit.dart';
import 'package:udevs_to_do/cubit/get_to_do/get_to_do_state.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/data/models/innerlist/innerlist_model.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/screens/tab_box/home/widgets/no_task_widget.dart';
import 'package:udevs_to_do/services/get_innerlist/get_innerlist.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_icons/app_icons.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/utils/date_formatter/date_format.dart';
import 'package:udevs_to_do/widgets/global_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetToDoCubit, GetToDoState>(
      builder: (context, state) {
        if (state is GetToDoInLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetToDoInSuccess) {
          List<InnerList> innerList = GetInnerList.getInnerList(state.tsks);
          return Scaffold(
            appBar: GlobalAppBar(numberOfTasks: state.tsks.length),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w).r,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ...List.generate(
                    innerList.length,
                    (index) {
                      InnerList userTask = innerList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          Text(
                            TimeUtils.formatToWeekMonthDay(
                              DateTime.parse(userTask.craetedAt),
                            ),
                            style: fontRubikW500(appcolor: AppColors.c_8B87B3)
                                .copyWith(fontSize: 13.sp),
                          ),
                          ...List.generate(
                            userTask.taks.length,
                            (index) {
                              TodoModel task = userTask.taks[index];
                              CategoryToDo category =
                                  CategoryToDo.cotegories[task.categoryId - 1];
                              return

                                  /// EIDGETGA CHIQAZISH KERAK

                                  Container(
                                margin: EdgeInsets.only(top: 12.h).r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                height: 55.h,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: category.colorBackground,
                                      ),
                                      width: 4.w,
                                    ),
                                    SizedBox(width: 11.w),
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<ToDosBloc>(context).add(
                                          UpdateToDo(
                                            toDo: TodoModel(
                                              id: task.id,
                                              createdAt: task.createdAt,
                                              title: task.title,
                                              description: task.description,
                                              date: task.date,
                                              categoryId: task.categoryId,
                                              isCompleted:
                                                  task.isCompleted == 1 ? 0 : 1,
                                            ),
                                          ),
                                        );

                                        BlocProvider.of<GetToDoCubit>(context)
                                            .fetchAllTasks();
                                      },
                                      child: SvgPicture.asset(
                                        task.isCompleted == 0
                                            ? AppIcons.iconCircular
                                            : AppIcons.iconSuccess,
                                        width: 22.w,
                                      ),
                                    ),
                                    SizedBox(width: 11.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          TimeUtils.formatToWeekMonthDay(
                                            DateTime.parse(task.date),
                                          ),
                                          style: fontRubikW400(
                                                  appcolor: AppColors.c_A1A1A1)
                                              .copyWith(fontSize: 11.sp),
                                        ),
                                        Text(
                                          TimeUtils.formatToHour(
                                            DateTime.parse(task.date),
                                          ),
                                          style: fontRubikW400(
                                                  appcolor: AppColors.c_A1A1A1)
                                              .copyWith(fontSize: 11.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 11.w),
                                    Text(
                                      task.title,
                                      style: fontRubikW500(
                                              appcolor: AppColors.c_554E8F)
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(AppIcons.iconEdit),
                                    SizedBox(width: 9.w),
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<ToDosBloc>(context).add(
                                          DeleteToDo(toDoId: task.id!),
                                        );
                                        BlocProvider.of<GetToDoCubit>(context)
                                            .fetchAllTasks();
                                      },
                                      child:
                                          SvgPicture.asset(AppIcons.iconDelete),
                                    ),
                                    SizedBox(width: 11.w),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const NoTasksWidget();
      },
    );
  }
}
