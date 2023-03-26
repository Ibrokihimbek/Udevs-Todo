import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconContainerWidget extends StatelessWidget {
  final String iconName;
  final Color colorBackground;
  const IconContainerWidget({
    super.key,
    required this.iconName,
    required this.colorBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorBackground,
      ),
      width: 85.w,
      height: 85.h,
      child: Center(
        child: SvgPicture.asset(
          iconName,
          width: 30.w,
        ),
      ),
    );
  }
}
