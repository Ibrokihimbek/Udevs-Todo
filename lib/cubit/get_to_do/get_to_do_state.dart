import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

abstract class GetToDoState {}

class GetToDoInitial extends GetToDoState {}

class GetToDoInLoading extends GetToDoState {}

class GetToDoInSuccess extends GetToDoState {
  GetToDoInSuccess({required this.tsks});

  final List<TodoModel> tsks;
}