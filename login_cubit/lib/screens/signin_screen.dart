import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_cubit/cubit/auth_cubit/auth_cubit.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController textEdittingController1 = TextEditingController();
    TextEditingController textEdittingController2 = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textEdittingController1,
            decoration: const InputDecoration(hintText: 'username'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: textEdittingController2,
            decoration: const InputDecoration(
              hintText: 'password',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.read<AuthCubit>().logIn(
                      userName: textEdittingController1.text,
                      passWord: textEdittingController2.text);
                },
                child: const Text(
                  'login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  context.read<AuthCubit>().emitSignUpScreen();
                },
                child: const Text(
                  'signup',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
