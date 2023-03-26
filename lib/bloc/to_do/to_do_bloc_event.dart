import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

abstract class ToDoEvent {}

class AddToDo extends ToDoEvent {
  TodoModel task;
  AddToDo({required this.task});
}

class UpdateTask extends ToDoEvent {
  TodoModel task;
  UpdateTask({required this.task});
}

class DeleteTask extends ToDoEvent {
  int id;
  DeleteTask({required this.id});
}

class FetchAllTasks extends ToDoEvent {}
