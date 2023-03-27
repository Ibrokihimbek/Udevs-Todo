import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/data/models/innerlist/innerlist_model.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/screens/task_by_category/widgets/time_items.dart';
import 'package:udevs_to_do/services/get_innerlist/get_innerlist.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/utils/date_formatter/date_format.dart';
import 'package:udevs_to_do/widgets/category_appbar.dart';

class TaskByCategory extends StatelessWidget {
  final List<TodoModel> tasks;
  const TaskByCategory({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    List<InnerList> innerList = GetInnerList.getInnerList(tasks);
    return Scaffold(
      appBar: const CategoryAppBar(),
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
                        return Container(
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
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: category.colorBackground,
                                ),
                                width: 4.w,
                              ),
                              SizedBox(width: 11.w),
                              TimeItemsWidget(time: task.date),
                              SizedBox(width: 11.w),
                              Text(
                                task.title,
                                style:
                                    fontRubikW500(appcolor: AppColors.c_554E8F)
                                        .copyWith(fontSize: 16.sp),
                              ),
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
}
