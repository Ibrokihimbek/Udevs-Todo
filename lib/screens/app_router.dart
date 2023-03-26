import 'package:flutter/material.dart';
import 'package:udevs_to_do/screens/register/register.dart';
import 'package:udevs_to_do/screens/splash/splash_page.dart';
import 'package:udevs_to_do/screens/tab_box/add_task/add_task.dart';
import 'package:udevs_to_do/screens/tab_box/home/home_page.dart';
import 'package:udevs_to_do/screens/tab_box/tab_box_page.dart';
import 'package:udevs_to_do/screens/tab_box/tasks/tasks.dart';
import 'package:udevs_to_do/screens/task_by_category/task_by_category.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const tabBox = 'tabBox';
  static const tasks = 'tasks';
  static const register = 'register';
  static const addTask = 'addTaska';
  static const home = 'home';
  static const taskByCategory = 'taskByCategory';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RouteName.tabBox:
        return MaterialPageRoute(builder: (_) => TabBoxPage());
      case RouteName.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case RouteName.tasks:
        return MaterialPageRoute(builder: (_) => TaskPage());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteName.addTask:
        return MaterialPageRoute(builder: (_) => AddTask());
      case RouteName.taskByCategory:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => TaskByCategory(
            tasks: args['taskByCategory'],
          ),
        );
      // case RouteName.description:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => DescriptionPage(
      //       model: args['toDoModel'],
      //     ),
      //   );

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
