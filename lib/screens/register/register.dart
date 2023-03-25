import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:udevs_to_do/screens/app_router.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_lotties/app_lotties.dart';
import 'package:udevs_to_do/widgets/global_button.dart';
import 'package:udevs_to_do/widgets/input_decoration_widget.dart';

import '../../data/storage_repository/storage_repository.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final nameController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h).r,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w).r,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppLotties.toDo, width: 287.w),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: getInputDecoration(
                        label: 'Enter your Name',
                      ),
                    ),
                    SizedBox(height: 100.h),
                    GlobalButton(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          StorageRepository.putString(
                            "name",
                            nameController.text,
                          );
                          saveLogin(context);
                        }
                      },
                      colorShadow: AppColors.c_6894EE,
                      gradientFirst: AppColors.c_7EB6FF,
                      gradientSekond: AppColors.c_5F87E7,
                      buttonName: 'Get Started',
                      height: 56,
                      width: double.infinity,
                      sizeFont: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveLogin(context) {
    StorageRepository.putBool("first_time", true);
    Navigator.pushReplacementNamed(context, RouteName.tabBox);
  }
}
