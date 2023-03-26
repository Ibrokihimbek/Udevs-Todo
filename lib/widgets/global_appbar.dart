import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udevs_to_do/data/storage_repository/storage_repository.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_images/app_images.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  final int numberOfTasks;
  const GlobalAppBar({super.key, required this.numberOfTasks});

  @override
  Widget build(BuildContext context) {
    String name = StorageRepository.getString('name');
    return AppBar(
      backgroundColor: AppColors.c_5D97E5,
      title: ListTile(
        title: Text(
          'Hello $name!',
          style: fontRubikW400(
            appcolor: AppColors.white,
          ),
        ),
        subtitle: Text(
          'Today you have $numberOfTasks tasks',
          style: fontRubikW400(
            appcolor: AppColors.white,
          ),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImages.appBar,
              ),
              fit: BoxFit.cover),
        ),
        width: double.infinity,
      ),
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
