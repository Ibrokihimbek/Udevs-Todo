import 'package:udevs_to_do/data/models/innerlist/innerlist_model.dart';
import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

class GetInnerList {
  static List<InnerList> getInnerList(List<TodoModel> tasks) {
    Set taskDate = {};

    for (var task in tasks) {
      taskDate.add(task.createdAt.substring(0,10));
    }

    List<InnerList> tasksByCreateAdd = [];
    for (var createdAt in taskDate) {
      List<TodoModel> userTasks = [];
      for (TodoModel task in tasks) {
        if (createdAt == task.createdAt.substring(0,10)) {
          userTasks.add(task);
        }
      }
      tasksByCreateAdd.add(
        InnerList(craetedAt: createdAt, taks: userTasks),
      );
    }

    return tasksByCreateAdd;
  }
}
