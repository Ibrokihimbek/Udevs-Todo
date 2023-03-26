import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/task_cubit/task_cubit.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/task_cubit/task_state.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryToDo category;
  const CategoryItemWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetToDoByCategoryCubit()..fetchAllTasks(category.id),
      child: BlocBuilder<GetToDoByCategoryCubit, GetToDoByCategoryState>(
        builder: (context, state) {
          if (state is GetToDoByCategoryInLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetToDoByCategoryInSuccess) {
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.c_BBBBBB,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            );
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.c_BBBBBB,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: category.colorBackground,
                    ),
                    width: 85.w,
                    height: 85.h,
                    child: Center(
                      child: SvgPicture.asset(
                        category.iconName,
                        width: 30.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
