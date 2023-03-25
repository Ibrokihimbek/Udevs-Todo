import 'package:udevs_to_do/data/local_db/local_database.dart';
import 'package:udevs_to_do/data/models/to_do_model.dart';

class ToDoRepository {
  static final ToDoRepository _instance = ToDoRepository._();

  factory ToDoRepository() {
    return _instance;
  }

  ToDoRepository._();

  /// Add task
  Future<TodoModel> insertTask(TodoModel todoModel) =>
      LocalDatabase.insertToDatabase(todoModel);

  /// Delete task
  Future<int> deleteTask(int id) => LocalDatabase.deleteTaskById(id);

  /// Get all task
  Future<List<TodoModel>> getAllTasks() => LocalDatabase.getAllTasks();

  /// Get task by title
  Future<List<TodoModel>> getTaskByTitle({String title = ''}) =>
      LocalDatabase.getTaskByTitle(title: title);

  /// Get task by categoryId
  Future<List<TodoModel>> getTaskByCategoryId(int id) =>
      LocalDatabase.getTaskByCategoryId(id);

  /// Update task
  Future<TodoModel> updateTask(TodoModel todoModel) =>
      LocalDatabase.updateTaskById(todoModel);
}
