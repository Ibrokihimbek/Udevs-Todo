import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/utils/date_formatter/date_format.dart';

class TimeItemsWidget extends StatelessWidget {
  final String time;
  const TimeItemsWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TimeUtils.formatToWeekMonthDay(
            DateTime.parse(time),
          ),
          style: fontRubikW400(appcolor: AppColors.c_A1A1A1)
              .copyWith(fontSize: 11.sp),
        ),
        Text(
          TimeUtils.formatToHour(
            DateTime.parse(time),
          ),
          style: fontRubikW400(appcolor: AppColors.c_A1A1A1)
              .copyWith(fontSize: 11.sp),
        ),
      ],
    );
  }
}
