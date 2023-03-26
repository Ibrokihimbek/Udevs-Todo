import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_event.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_state.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';
import 'package:udevs_to_do/data/repository/to_do_repo.dart';
import 'package:udevs_to_do/services/get_it/get_it.dart';

class TodoBloc extends Bloc<ToDoEvent, ToDoState> {
  TodoBloc() : super(InitialStateGet()){
    on<UpdateTask>(updateTodo);
    on<DeleteTask>(deleteTodo);
    on<FetchAllTasks>(fetchAllTodos);
    on<AddToDo>(addTodo);
  }

   updateTodo(UpdateTask event, Emitter<ToDoState> emit) async {
    emit(LoadInProgressUpdate());
    await getIt.get<ToDoRepository>().updateTask(event.task);
    emit(LoadInSuccessUpdate());
  }

  fetchAllTodos(FetchAllTasks event, Emitter<ToDoState> emit) async {
    emit(LoadInProgressGet());
    List<TodoModel> todos = await getIt.get<ToDoRepository>().getAllTasks();
    if (todos.isNotEmpty) {
      emit(LoadInSuccessGet(tasks: todos));
    } else {
      emit(LoadInFailureGet(errorText: 'Hali Malumot yoq'));
    }
  }

  deleteTodo(DeleteTask event, Emitter<ToDoState> emit) async{
    emit(LoadInProgressDelete());
    await getIt.get<ToDoRepository>().deleteTask(event.id);
    emit(LoadInSuccessDelete());
  }

  addTodo(AddToDo event, Emitter<ToDoState> emit)async{
    emit(LoadInProgressAdd());
    await getIt.get<ToDoRepository>().insertTask(event.task);
    emit(LoadInSuccessAdd());
  }
}
