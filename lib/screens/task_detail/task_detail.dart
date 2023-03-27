import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/utils/date_formatter/date_format.dart';
import 'package:udevs_to_do/widgets/category_appbar.dart';

class TaskDetailPage extends StatelessWidget {
  final TodoModel task;
  const TaskDetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CategoryAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18).r,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  task.title,
                  style: fontRubikW600(appcolor: AppColors.c_554E8F)
                      .copyWith(fontSize: 22.sp),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    TimeUtils.formatToWeekMonthDay(
                      DateTime.parse(task.date),
                    ),
                    style: fontRubikW400(appcolor: AppColors.c_A1A1A1)
                        .copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    TimeUtils.formatToHour(
                      DateTime.parse(task.date),
                    ),
                    style: fontRubikW400(appcolor: AppColors.c_A1A1A1)
                        .copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              SizedBox(
                width: double.infinity,
                child: Text(
                  task.description,
                  style: fontRubikW600(appcolor: AppColors.c_686868)
                      .copyWith(fontSize: 18.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
