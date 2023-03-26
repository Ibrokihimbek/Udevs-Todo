import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

abstract class ToDoEvent {}

class UpdateToDo extends ToDoEvent {
  UpdateToDo({required this.toDo});

  final TodoModel toDo;
}

class AddToDo extends ToDoEvent{
  AddToDo({required this.toDo});

  final TodoModel toDo;
}

class DeleteToDo extends ToDoEvent{
  DeleteToDo({required this.toDoId});

  final int toDoId;
}