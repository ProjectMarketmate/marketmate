import 'package:bloc/bloc.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
