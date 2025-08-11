import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_cubit/cubit/auth_cubit/auth_cubit.dart';
import 'package:login_cubit/cubit/auth_cubit/auth_states.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reEnterPaswword = TextEditingController();
  void dispose() {
    userName.dispose();
    password.dispose();
    reEnterPaswword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: userName,
            decoration: const InputDecoration(
              hintText: 'enter your username',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            controller: password,
            decoration: const InputDecoration(
              hintText: 'enter your password',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            controller: reEnterPaswword,
            decoration: const InputDecoration(
              hintText: 're enter your password',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocListener<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is FailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('user already exists')));
              }
            },
            child: TextButton(
              onPressed: () {
                if (reEnterPaswword.text == password.text) {
                  context.read<AuthCubit>().signUp(
                        userName: userName.text,
                        passWord: password.text,
                      );
                } else {
                  password.clear();
                  reEnterPaswword.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('passwords is not matching'),
                      duration: Duration(seconds: 5),
                    ),
                  );
                }
              },
              child: const Text(
                'sign up',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
