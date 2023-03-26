// import 'package:equatable/equatable.dart';
// import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

// class ToDoState extends Equatable {
//   final ToDoStatus status;
//   final String statusText;
//   final List<TodoModel> tasks;

//   const ToDoState({
//     required this.status,
//     required this.statusText,
//     required this.tasks,
//   });

//   ToDoState copyWith({
//     ToDoStatus? status,
//     List<TodoModel>? tasks,
//     String? statusText,
//   }) =>
//       ToDoState(
//         status: status ?? this.status,
//         statusText: statusText ?? this.statusText,
//         tasks: tasks ?? this.tasks,
//       );

//   @override
//   List<Object?> get props => [
//         status,
//         statusText,
//         tasks,
//       ];
// }

// enum ToDoStatus {
//   loading,
//   getTask,
//   pure,
//   taskAdded,
//   taskUpdated,
//   taskDeleted,
// }

import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

abstract class ToDoState {}

///get qilish uchun
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

///add qilish uchun
class LoadInProgressAdd extends ToDoState {}

class LoadInSuccessAdd extends ToDoState {}

class LoadInFailureAdd extends ToDoState {}

///update qilish uchun
class LoadInProgressUpdate extends ToDoState {}

class LoadInSuccessUpdate extends ToDoState {}

class LoadInFailureUpdate extends ToDoState {}

///delete qilish uchun
class LoadInProgressDelete extends ToDoState {}

class LoadInSuccessDelete extends ToDoState {}

class LoadInFailureDelete extends ToDoState {}
