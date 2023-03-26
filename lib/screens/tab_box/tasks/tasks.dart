import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:udevs_to_do/cubit/get_to_do/get_to_do_cubit.dart';
// import 'package:udevs_to_do/cubit/get_to_do/get_to_do_state.dart';
import 'package:udevs_to_do/data/models/category/category_model.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/widgets/category_item_widget.dart';
import 'package:udevs_to_do/widgets/global_appbar.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();

    // BlocBuilder<GetToDoCubit, GetToDoState>(
    //   builder: (context, state) {
    //     if (state is GetToDoInLoading) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (state is GetToDoInSuccess) {
    //       return Scaffold(
    //         appBar: GlobalAppBar(numberOfTasks: state.tsks.length),
    //         body: GridView(
    //           padding: const EdgeInsets.all(18).r,
    //           physics: const BouncingScrollPhysics(),
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             childAspectRatio: 0.8,
    //             mainAxisSpacing: 12,
    //             crossAxisSpacing: 12,
    //           ),
    //           children: List.generate(
    //             CategoryToDo.cotegories.length,
    //             (index) => CategoryItemWidget(
    //               category: CategoryToDo.cotegories[index],
    //             ),
    //           ),
    //         ),
    //       );
    //     }
    //     return Scaffold(
    //       appBar: const GlobalAppBar(numberOfTasks: 0),
    //       body: GridView(
    //         padding: const EdgeInsets.all(18).r,
    //         physics: const BouncingScrollPhysics(),
    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           childAspectRatio: 0.8,
    //           mainAxisSpacing: 12,
    //           crossAxisSpacing: 12,
    //         ),
    //         children: List.generate(
    //           CategoryToDo.cotegories.length,
    //           (index) => CategoryItemWidget(
    //             category: CategoryToDo.cotegories[index],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
