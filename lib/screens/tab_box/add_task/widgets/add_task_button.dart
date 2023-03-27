import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/widgets/global_button.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onTap;
  final String nameButton;
  const AddTaskButton({
    super.key,
    required this.onTap,
    required this.nameButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 26.w,
        vertical: 12.h,
      ).r,
      child: GlobalButton(
        onTap: onTap,
        gradientFirst: AppColors.c_7EB6FF,
        gradientSekond: AppColors.c_5F87E7,
        buttonName: nameButton,
        height: 53,
        width: double.infinity,
        sizeFont: 18,
        colorShadow: AppColors.c_6894EE,
      ),
    );
  }
}
