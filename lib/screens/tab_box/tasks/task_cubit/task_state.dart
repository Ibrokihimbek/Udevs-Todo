import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

abstract class GetToDoByCategoryState {}

class GetToDoByCategoryInitial extends GetToDoByCategoryState {}

class GetToDoByCategoryInLoading extends GetToDoByCategoryState {}

class GetToDoByCategoryInSuccess extends GetToDoByCategoryState {
  GetToDoByCategoryInSuccess({required this.tsksByCategory});

  final List<TodoModel> tsksByCategory;
}