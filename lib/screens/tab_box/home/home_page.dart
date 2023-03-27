import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_bloc.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_event.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_state.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/data/models/innerlist/innerlist_model.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/screens/app_router.dart';
import 'package:udevs_to_do/screens/tab_box/home/widgets/line_color.dart';
import 'package:udevs_to_do/screens/tab_box/home/widgets/no_task_widget.dart';
import 'package:udevs_to_do/screens/tab_box/home/widgets/task_title.dart';
import 'package:udevs_to_do/screens/tab_box/home/widgets/update_task.dart';
import 'package:udevs_to_do/screens/task_by_category/widgets/time_items.dart';
import 'package:udevs_to_do/services/get_innerlist/get_innerlist.dart';
import 'package:udevs_to_do/services/get_today_task/today_tasks_lenfth.dart';
import 'package:udevs_to_do/services/local_notification/local_notification_service.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_icons/app_icons.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/utils/date_formatter/date_format.dart';
import 'package:udevs_to_do/widgets/global_appbar.dart';
import 'package:udevs_to_do/widgets/reminder_task.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, ToDoState>(
      builder: (context, state) {
        if (state is LoadInProgressGet) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadInSuccessGet) {
          int numberOfTasks = GetTodayTasksLength.getTasksLength(state.tasks);
          List<TodoModel> firstReminder =
              GetTodayTasksLength.getTaskFirst(state.tasks);
          List<InnerList> innerList = GetInnerList.getInnerList(state.tasks);
          return Scaffold(
            appBar: GlobalAppBar(numberOfTasks: numberOfTasks),
            body: ListView(
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w).r,
                          child:
                              ReminderTasksWidget(firstReminder: firstReminder),
                        ),
                        SizedBox(height: 12.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w).r,
                          child: Text(
                            TimeUtils.formatToWeekMonthDay(
                              DateTime.parse(userTask.craetedAt),
                            ),
                            style: fontRubikW500(appcolor: AppColors.c_8B87B3)
                                .copyWith(fontSize: 13.sp),
                          ),
                        ),
                        ...List.generate(
                          userTask.taks.length,
                          (index) {
                            TodoModel task = userTask.taks[index];
                            CategoryToDo category =
                                CategoryToDo.cotegories[task.categoryId - 1];
                            LocalNotificationService.localNotificationService
                                .scheduleNotification(
                              id: task.id ?? 0,
                              delayedTime: DateTime.parse(task.date),
                              title: task.title,
                            );
                            return ZoomTapAnimation(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.taskDetail,
                                    arguments: task);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                        top: 12.h, left: 18.w, right: 18.w)
                                    .r,
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
                                    LineColorWidget(
                                      lineColor: category.colorBackground,
                                    ),
                                    SizedBox(width: 11.w),
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<TodoBloc>(context).add(
                                          UpdateTask(
                                            task: TodoModel(
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

                                        BlocProvider.of<TodoBloc>(context)
                                            .add(FetchAllTasks());
                                        print('TIME ${task.date}');
                                      },
                                      child: SvgPicture.asset(
                                        task.isCompleted == 0
                                            ? AppIcons.iconCircular
                                            : AppIcons.iconSuccess,
                                        width: 22.w,
                                      ),
                                    ),
                                    SizedBox(width: 11.w),
                                    TimeItemsWidget(time: task.date),
                                    SizedBox(width: 11.w),
                                    TaskTitleWidget(title: task.title),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return UpdateTaskWidget(
                                              task: task,
                                            );
                                          },
                                        );
                                      },
                                      child:
                                          SvgPicture.asset(AppIcons.iconEdit),
                                    ),
                                    SizedBox(width: 9.w),
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<TodoBloc>(context).add(
                                          DeleteTask(id: task.id!),
                                        );
                                        BlocProvider.of<TodoBloc>(context)
                                            .add(FetchAllTasks());
                                      },
                                      child:
                                          SvgPicture.asset(AppIcons.iconDelete),
                                    ),
                                    SizedBox(width: 11.w),
                                  ],
                                ),
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
          );
        }
        return const NoTasksWidget();
      },
    );
  }
}
