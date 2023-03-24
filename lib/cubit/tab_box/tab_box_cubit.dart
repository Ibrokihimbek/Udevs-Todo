import 'package:flutter_bloc/flutter_bloc.dart';

class TabBoxCubit extends Cubit<int> {
  TabBoxCubit() : super(0);
  int activePageIndex = 0;

  void changePageIndex(int newIndex) {
    emit(activePageIndex = newIndex);
  }
}