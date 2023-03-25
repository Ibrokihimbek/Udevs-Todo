import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/data/storage_repository/storage_repository.dart';
import 'package:udevs_to_do/screens/app_router.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_images/app_images.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/widgets/global_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100.h).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                width: 179.w,
              ),
              SizedBox(height: 113.h),
              Text(
                'Reminders made simple',
                style: fontRubikW500(appcolor: AppColors.c_554E8F)
                    .copyWith(fontSize: 22.sp),
              ),
              SizedBox(height: 171.h),
              GlobalButton(
                onTap: () {
                  bool firstTime =
                      StorageRepository.getBool("first_time", defValue: false);
                  if (firstTime == false) {
                    Navigator.pushReplacementNamed(context, RouteName.register);
                  } else {
                    Navigator.pushReplacementNamed(context, RouteName.tabBox);
                  }
                },
                colorShadow: AppColors.c_66C81C,
                gradientFirst: AppColors.c_5DE61A,
                gradientSekond: AppColors.c_39A801,
                buttonName: 'Get Started',
                height: 56,
                width: 258,
                sizeFont: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
