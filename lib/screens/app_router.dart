import 'package:flutter/material.dart';
import 'package:udevs_to_do/screens/splash/splash_page.dart';
import 'package:udevs_to_do/screens/tab_box/tab_box_page.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const tabBox = 'tabBox';
  static const onBoarding = 'on_boarding';
  static const register = 'register';
  static const logIn = 'log_in';
  static const welcome = 'welcome';
  static const main = 'main';
  static const description = 'description';
  static const profile = 'profile';
  static const updateWidget = 'updateWidget';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
        case RouteName.tabBox:
        return MaterialPageRoute(builder: (_) => TabBoxPage());
      // case RouteName.onBoarding:
      //   return MaterialPageRoute(builder: (_) => OnboardinPage());
      // case RouteName.welcome:
      //   return MaterialPageRoute(builder: (_) => WelcomePage());
      // case RouteName.logIn:
      //   return MaterialPageRoute(builder: (_) => LoginPage());
      // case RouteName.register:
      //   return MaterialPageRoute(builder: (_) => RegisterPage());
      // case RouteName.main:
      //   return MaterialPageRoute(builder: (_) => MainPage());
      // case RouteName.description:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => DescriptionPage(
      //       model: args['toDoModel'],
      //     ),
      //   );
      // case RouteName.profile:
      //   return MaterialPageRoute(builder: (_) => ProfilePage());
      // case RouteName.updateWidget:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => UpdateWidget(
      //       todo: args['toDoModel'],
      //       onDeleted: args['onDeleted'],
      //     ),
      //   );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
