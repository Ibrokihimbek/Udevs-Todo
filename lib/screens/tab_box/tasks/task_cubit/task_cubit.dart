import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/data/repository/to_do_repo.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/task_cubit/task_state.dart';
import 'package:udevs_to_do/services/get_it/get_it.dart';

class GetToDoByCategoryCubit extends Cubit<GetToDoByCategoryState> {
  GetToDoByCategoryCubit() : super(GetToDoByCategoryInitial());

  List<TodoModel> tasksByCategory = [];

  fetchAllTasks(int id) async {
    emit(GetToDoByCategoryInLoading());
    tasksByCategory = await getIt<ToDoRepository>().getTaskByCategoryId(id);
    emit(GetToDoByCategoryInSuccess(tsksByCategory: tasksByCategory));
  }
}
