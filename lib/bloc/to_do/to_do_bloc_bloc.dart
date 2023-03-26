import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_event.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_state.dart';
import 'package:udevs_to_do/data/repository/to_do_repo.dart';
import 'package:udevs_to_do/services/get_it/get_it.dart';

class ToDosBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDosBloc()
      : super(const ToDoState(
          tasks: [],
          statusText: "",
          status: ToDoStatus.pure,
        )) {
    on<AddToDo>(_addToDo);
    on<UpdateToDo>(_updateToDo);
    on<DeleteToDo>(_deleteToDo);
  }

  _addToDo(AddToDo event, Emitter<ToDoState> emit) async {
    emit(state.copyWith(status: ToDoStatus.loading));

    var newToDo = await getIt<ToDoRepository>().insertTask(event.toDo);
    if (newToDo.id != null) {
      emit(state.copyWith(status: ToDoStatus.taskAdded));
    }
  }

  _updateToDo(UpdateToDo event, Emitter<ToDoState> emit) async {
    emit(state.copyWith(status: ToDoStatus.loading));
    await getIt<ToDoRepository>().updateTask(event.toDo);
    emit(state.copyWith(status: ToDoStatus.taskUpdated));
  }

  _deleteToDo(DeleteToDo event, Emitter<ToDoState> emit) async {
    emit(state.copyWith(status: ToDoStatus.loading));
    var deletedId = await getIt<ToDoRepository>().deleteTask(event.toDoId);
    if (deletedId != -1) {
      emit(state.copyWith(status: ToDoStatus.taskDeleted));
    }
  }
}
