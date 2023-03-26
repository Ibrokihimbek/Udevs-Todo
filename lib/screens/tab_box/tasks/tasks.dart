import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/widgets/category_item_widget.dart';
import 'package:udevs_to_do/widgets/global_appbar.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(numberOfTasks: 9),
      body: GridView(
        padding: EdgeInsets.only(
          left: 18.w,
          right: 18.w,
          top: 44.h,
          bottom: 12.h,
        ).r,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        children: List.generate(
          CategoryToDo.cotegories.length,
          (index) => CategoryItemWidget(
            category: CategoryToDo.cotegories[index],
          ),
        ),
      ),
    );
  }
}
