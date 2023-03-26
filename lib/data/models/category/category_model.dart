import 'package:flutter/material.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_icons/app_icons.dart';

class CategoryToDo {
  int id;
  String iconName;
  String cotegoryName;
  Color colorBackground;

  CategoryToDo({
    required this.id,
    required this.iconName,
    required this.cotegoryName,
    required this.colorBackground,
  });

  static List<CategoryToDo> cotegories = [
    CategoryToDo(
      id: 1,
      colorBackground: AppColors.c_FFFE9B,
      iconName: AppIcons.iconPerson,
      cotegoryName: 'Personal',
    ),
    CategoryToDo(
      id: 2,
      colorBackground: AppColors.c_E4FFDB,
      iconName: AppIcons.iconBriefcase,
      cotegoryName: 'Work',
    ),
    CategoryToDo(
      id: 3,
      colorBackground: AppColors.c_FFDBED,
      iconName: AppIcons.iconPresentation,
      cotegoryName: 'Meeting',
    ),
    CategoryToDo(
      id: 4,
      colorBackground: AppColors.c_FFEEDB,
      iconName: AppIcons.iconShoppingBasket,
      cotegoryName: 'Shopping',
    ),
    CategoryToDo(
      id: 5,
      colorBackground: AppColors.c_DBFFFC,
      iconName: AppIcons.iconConfetti,
      cotegoryName: 'Party',
    ),
    CategoryToDo(
      id: 6,
      colorBackground: AppColors.c_FBDBFF,
      iconName: AppIcons.iconMolecule,
      cotegoryName: 'Study',
    ),
  ];
}
