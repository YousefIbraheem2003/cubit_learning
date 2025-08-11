import 'package:login_cubit/cubit/auth_cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(LogInScreenState());
  Map<String, String> users = {
    'youssef': '1234',
    'ibrahem': '1232',
  };
  void emitSignUpScreen() {
    emit(SignUpScreenState());
  }

  void logIn({required String userName, required String passWord}) {
    if (users[userName] == passWord) {
      emit(HomeScreenState(userName));
    } else {
      emit(LogInScreenState());
    }
  }

  void signUp({
    required String userName,
    required String passWord,
  }) {
    if (users.containsKey(userName)) {
      emit(FailureState());
      print('hi');
    } else {
      users[userName] = passWord;
      emit(LogInScreenState());
    }
  }
}
