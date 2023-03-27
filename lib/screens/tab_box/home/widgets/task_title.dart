import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';

class TaskTitleWidget extends StatelessWidget {
  final String title;
  const TaskTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title.substring(0, title.length > 10 ? 7 : title.length),
            style: fontRubikW500(appcolor: AppColors.c_554E8F)
                .copyWith(fontSize: 20.sp),
          ),
          TextSpan(
            text: title.length > 10 ? "... more" : "",
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
