import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';

class GlobalButton extends StatelessWidget {
  final Color gradientFirst;
  final Color gradientSekond;
  final String buttonName;
  final double height;
  final double width;
  final double sizeFont;
  final Color colorShadow;
  final VoidCallback onTap;
  const GlobalButton({
    super.key,
    required this.onTap,
    required this.gradientFirst,
    required this.gradientSekond,
    required this.buttonName,
    required this.height,
    required this.width,
    required this.sizeFont,
    required this.colorShadow,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0).r,
          shadowColor: colorShadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                gradientFirst,
                gradientSekond,
              ],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              buttonName,
              style: fontRubikW400(appcolor: AppColors.white)
                  .copyWith(fontSize: sizeFont.sp),
            ),
          ),
        ),
      ),
    );
  }
}
