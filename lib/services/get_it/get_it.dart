import 'package:get_it/get_it.dart';
import 'package:udevs_to_do/data/repository/to_do_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ToDoRepository());
  
}