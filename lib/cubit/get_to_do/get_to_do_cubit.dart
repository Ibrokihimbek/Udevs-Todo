import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_to_do/cubit/get_to_do/get_to_do_state.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/data/repository/to_do_repo.dart';
import 'package:udevs_to_do/services/get_it/get_it.dart';

class GetContactCubit extends Cubit<GetToDoState> {
  GetContactCubit() : super(GetToDoInitial());

  List<TodoModel> cachedUserContact = [];

  fetchAllTasks() async {
    emit(GetToDoInLoading());
    cachedUserContact = await getIt<ToDoRepository>().getAllTasks();
    emit(GetToDoInSuccess(tsks: cachedUserContact));
  }
}
