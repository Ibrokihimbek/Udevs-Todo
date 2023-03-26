import 'package:equatable/equatable.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

class ToDoState extends Equatable {
  final ToDoStatus status;
  final String statusText;
  final List<TodoModel> tasks;

  const ToDoState({
    required this.status,
    required this.statusText,
    required this.tasks,
  });

  ToDoState copyWith({
    ToDoStatus? status,
    List<TodoModel>? tasks,
    String? statusText,
  }) =>
      ToDoState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        tasks: tasks ?? this.tasks,
      );

  @override
  List<Object?> get props => [
        status,
        statusText,
        tasks,
      ];
}

enum ToDoStatus {
  loading,
  pure,
  taskAdded,
  taskUpdated,
  taskDeleted,
}