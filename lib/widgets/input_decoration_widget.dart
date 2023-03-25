import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';

InputDecoration getInputDecoration({required String label}) {
  return InputDecoration(
    labelText: label,
    labelStyle:
        fontRubikW400(appcolor: AppColors.grey).copyWith(fontSize: 16.sp),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.r),
      ),
      borderSide: const BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.c_5F87E7),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.c_5F87E7),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.c_5F87E7),
    ),
  );
}
