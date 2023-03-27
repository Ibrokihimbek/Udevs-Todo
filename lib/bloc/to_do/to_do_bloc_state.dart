import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

abstract class ToDoState {}

/// GET TASKS
class InitialStateGet extends ToDoState {}

class LoadInProgressGet extends ToDoState {}

class LoadInSuccessGet extends ToDoState {
  List<TodoModel> tasks;
  LoadInSuccessGet({required this.tasks});
}

class LoadInFailureGet extends ToDoState {
  String errorText;
  LoadInFailureGet({required this.errorText});
}

/// ADD TASKS
class LoadInProgressAdd extends ToDoState {}

class LoadInSuccessAdd extends ToDoState {}

class LoadInFailureAdd extends ToDoState {}

/// UPDATE TASKS
class LoadInProgressUpdate extends ToDoState {}

class LoadInSuccessUpdate extends ToDoState {}

class LoadInFailureUpdate extends ToDoState {}

/// DELETE TASKS
class LoadInProgressDelete extends ToDoState {}

class LoadInSuccessDelete extends ToDoState {}

class LoadInFailureDelete extends ToDoState {}
