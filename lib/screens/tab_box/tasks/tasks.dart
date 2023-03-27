import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_bloc.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_state.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/widgets/category_item_widget.dart';
import 'package:udevs_to_do/services/get_today_task/today_tasks_lenfth.dart';
import 'package:udevs_to_do/widgets/global_appbar.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, ToDoState>(
      builder: (context, state) {
        if (state is LoadInProgressGet) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadInSuccessGet) {
          int numberOfTasks =
              GetTodayTasksLength.getTasksLength(state.tasks);

          return Scaffold(
            appBar: GlobalAppBar(numberOfTasks: numberOfTasks),
            body: GridView(
              padding: const EdgeInsets.all(18).r,
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
        return Scaffold(
          appBar: const GlobalAppBar(numberOfTasks: 0),
          body: GridView(
            padding: const EdgeInsets.all(18).r,
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
      },
    );
  }
}
