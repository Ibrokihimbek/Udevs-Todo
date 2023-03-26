import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_to_do/bloc/to_do/to_do_bloc_bloc.dart';
import 'package:udevs_to_do/cubit/get_to_do/get_to_do_cubit.dart';
import 'package:udevs_to_do/cubit/tab_box/tab_box_cubit.dart';
import 'package:udevs_to_do/screens/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TabBoxCubit(),
        ),
        BlocProvider(
          create: (context) => ToDosBloc(),
        ),
        BlocProvider(
          create: (context) => GetToDoCubit()..fetchAllTasks(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Rubik',
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.splash,
          onGenerateRoute: AppRoutes.generateRoute,
          title: 'My tasks',
        );
      },
    );
  }
}
