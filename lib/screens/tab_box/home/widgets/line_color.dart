import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineColorWidget extends StatelessWidget {
  final Color lineColor;
  const LineColorWidget({super.key, required this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: lineColor
        
      ),
      width: 4.w,
    );
  }
}
