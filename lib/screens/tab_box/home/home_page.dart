import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/cubit/get_to_do/get_to_do_cubit.dart';
import 'package:udevs_to_do/cubit/get_to_do/get_to_do_state.dart';
import 'package:udevs_to_do/data/models/innerlist/innerlist_model.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/screens/tab_box/home/widgets/no_task_widget.dart';
import 'package:udevs_to_do/services/get_innerlist/get_innerlist.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_text_style/text_style.dart';
import 'package:udevs_to_do/utils/date_formatter/date_format.dart';
import 'package:udevs_to_do/widgets/global_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetToDoCubit, GetToDoState>(
      builder: (context, state) {
        if (state is GetToDoInLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetToDoInSuccess) {
          List<InnerList> innerList = GetInnerList.getInnerList(state.tsks);
          Scaffold(
            appBar: GlobalAppBar(numberOfTasks: innerList.length),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w).r,
              child: ListView(
                children: [
                  ...List.generate(
                    innerList.length,
                    (index) {
                      InnerList userTask = innerList[index];
                      return Column(
                        children: [
                          Text(
                            TimeUtils.formatToWeekMonthDay(
                              DateTime.parse(userTask.craetedAt),
                            ),
                            style: fontRubikW500(appcolor: AppColors.c_8B87B3)
                                .copyWith(fontSize: 13.sp),
                          ),
                          ...List.generate(
                            userTask.taks.length,
                            (index) {
                              TodoModel task = userTask.taks[index];
                              return Container(
                                width: double.infinity,
                                height: 55.h,
                                color: Colors.amber,
                                child: Text(task.title),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const NoTasksWidget();
      },
    );
  }
}
