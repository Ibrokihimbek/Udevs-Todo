import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddCategoryWidget extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int currentIndex;
  const AddCategoryWidget({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 26.w).r,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          CategoryToDo.cotegories.length,
          (index) {
            CategoryToDo category = CategoryToDo.cotegories[index];
            return ZoomTapAnimation(
              onTap: () => onTap(category.id),
              child: Container(
                margin: EdgeInsets.only(right: 8.w).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    width: 1,
                    color: AppColors.c_7EB6FF,
                  ),
                  color: currentIndex == index
                      ? category.colorBackground
                      : Colors.transparent,
                ),
                width: 100.w,
                child: Center(
                  child: Text(
                    category.cotegoryName,
                    style: fontRubikW400(
                      appcolor: AppColors.c_8E8E8E,
                    ).copyWith(fontSize: 15.sp),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
