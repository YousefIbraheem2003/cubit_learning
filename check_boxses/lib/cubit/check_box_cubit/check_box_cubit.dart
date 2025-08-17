import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxCubit extends Cubit<Map<int, bool>> {
  CheckBoxCubit() : super({});
  void check({required int index, required bool value}) {
    final Map<int, bool> newState = Map<int, bool>.from(state);
    newState[index] = value;
    emit(newState);
  }
}
