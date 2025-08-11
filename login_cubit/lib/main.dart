import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_cubit/cubit/auth_cubit/auth_cubit.dart';
import 'package:login_cubit/cubit/auth_cubit/auth_states.dart';
import 'package:login_cubit/screens/home_screen.dart';
import 'package:login_cubit/screens/signin_screen.dart';
import 'package:login_cubit/screens/signup_screen.dart';

void main() {
  runApp(const LogIn());
}

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        home: BlocBuilder<AuthCubit, AuthStates>(
          builder: (context, state) {
            if (state is LogInScreenState) {
              return const SignIn();
            } else if (state is HomeScreenState) {
              return const HomeScreen();
            } else if (state is SignUpScreenState || state is FailureState) {
              return const SignupScreen();
            } else {
              return const Text('hello');
            }
          },
        ),
      ),
    );
  }
}
