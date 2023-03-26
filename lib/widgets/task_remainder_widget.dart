import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udevs_to_do/data/storage_repository/storage_repository.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  const GlobalAppBar({super.key});

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
          'Today you have 9 tasks',
          style: fontRubikW400(
            appcolor: AppColors.white,
          ),
        ),
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
