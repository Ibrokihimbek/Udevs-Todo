import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_images/app_images.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/utils/date_formatter/date_format.dart';

class ReminderTasksWidget extends StatefulWidget {
  final List<TodoModel> firstReminder;
  const ReminderTasksWidget({super.key, required this.firstReminder});

  @override
  State<ReminderTasksWidget> createState() => _ReminderTasksWidgetState();
}

class _ReminderTasksWidgetState extends State<ReminderTasksWidget> {
  bool isRemaind = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.firstReminder.isNotEmpty ? isRemaind : false,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.c_A1A1A1.withOpacity(0.45),
        ),
        width: double.infinity,
        // height: 106.h,
        child: Padding(
          padding: const EdgeInsets.all(16).r,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today Reminder',
                    style: fontRubikW500(appcolor: AppColors.white)
                        .copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      widget.firstReminder.isEmpty
                          ? ''
                          : widget.firstReminder.first.title,
                      style: fontRubikW400(appcolor: AppColors.white)
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                  Text(
                    widget.firstReminder.isEmpty
                        ? ''
                        : TimeUtils.formatToHour(
                            DateTime.parse(widget.firstReminder.first.date),
                          ),
                    style: fontRubikW400(appcolor: AppColors.white)
                        .copyWith(fontSize: 16.sp),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                AppImages.bell,
                width: 60.w,
              ),
              GestureDetector(
                onTap: () {
                  isRemaind = false;
                  setState(() {});
                },
                child: Icon(
                  Icons.cancel_outlined,
                  color: AppColors.white,
                  size: 25.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
