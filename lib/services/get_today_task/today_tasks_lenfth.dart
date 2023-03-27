import 'package:udevs_to_do/data/models/to_do/to_do_model.dart';

class GetTodayTasksLength {
  static int getTasksLength(List<TodoModel> tasks) {
    List<String> todayTasksLength = [];
    for (var element in tasks) {
      // ignore: unrelated_type_equality_checks
      if (element.date.substring(0, 10) ==
          DateTime.now().toString().substring(0, 10)) {
        todayTasksLength.add(element.date);
      }
    }
    return todayTasksLength.length;
  }
}
