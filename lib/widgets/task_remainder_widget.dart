import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/data/storage_repository/storage_repository.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';

class TaskRemainderWidget extends StatelessWidget {
  const TaskRemainderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String name = StorageRepository.getString('name');
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.w).r,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.c_3867D5,
            AppColors.c_81C7F5,
          ],
        ),
      ),
      width: double.infinity,
      height: 106.h,
      child: ListTile(
        title: Text(
          'Hello $name!',
          style: fontRubikW400(
            appcolor: AppColors.white,
          ),
        ),
        subtitle: Text(
          'Today you have 9 tasks',
          style: fontRubikW400(
            appcolor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
