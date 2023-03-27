import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 26.w,
      ).r,
      child: Text(
        'Add Task',
        style: fontRubikW500(appcolor: AppColors.black),
      ),
    );
  }
}
