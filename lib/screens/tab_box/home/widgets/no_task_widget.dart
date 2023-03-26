import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_images/app_images.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/widgets/global_appbar.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(numberOfTasks: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.noTask,
              width: 119.w,
            ),
            SizedBox(height: 70.h),
            Text(
              'No tasks',
              style: fontRubikW500(appcolor: AppColors.c_554E8F)
                  .copyWith(fontSize: 22.sp),
            )
          ],
        ),
      ),
    );
  }
}
