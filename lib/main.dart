import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_to_do/data/storage_repository/storage_repository.dart';
import 'package:udevs_to_do/services/get_it/get_it.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  StorageRepository.getInstance();
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
