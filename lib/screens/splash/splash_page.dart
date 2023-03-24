import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/screens/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(
          const Duration(seconds: 3),
        );
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, RouteName.tabBox);
      },
    );
    return Scaffold(
      body: Center(
        // child: Image.asset(
        //   AppImages.splashLogo,
        //   height: 334.w,
        // ),
      ),
    );
  }
}
