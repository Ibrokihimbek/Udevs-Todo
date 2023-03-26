import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/screens/app_router.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/task_cubit/task_cubit.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/task_cubit/task_state.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/widgets/icon_container.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/utils/toast/flutter_toast.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryToDo category;
  const CategoryItemWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetToDoByCategoryCubit()..fetchAllTasks(category.id),
      child: BlocBuilder<GetToDoByCategoryCubit, GetToDoByCategoryState>(
        builder: (context, state) {
          if (state is GetToDoByCategoryInLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetToDoByCategoryInSuccess) {
            return ZoomTapAnimation(
              onTap: () {
                if (state.tsksByCategory.isEmpty) {
                  getMyToast(message: 'Tasks are not available');
                } else {
                  Navigator.pushNamed(
                    context,
                    RouteName.taskByCategory,
                    arguments: {'taskByCategory': state.tsksByCategory},
                  );
                }
              },
              child: Container(
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
                      IconContainerWidget(
                        iconName: category.iconName,
                        colorBackground: category.colorBackground,
                      ),
                      Text(
                        category.cotegoryName,
                        style: fontRubikW500(appcolor: AppColors.c_686868)
                            .copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        '${state.tsksByCategory.length} Tasks',
                        style: fontRubikW400(appcolor: AppColors.c_A1A1A1)
                            .copyWith(fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return ZoomTapAnimation(
            onTap: () {
              getMyToast(message: 'Tasks are not available');
            },
            child: Container(
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
                    IconContainerWidget(
                      iconName: category.iconName,
                      colorBackground: category.colorBackground,
                    ),
                    Text(
                      category.cotegoryName,
                      style: fontRubikW500(appcolor: AppColors.c_686868)
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      '0 Tasks',
                      style: fontRubikW400(appcolor: AppColors.c_A1A1A1)
                          .copyWith(fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
