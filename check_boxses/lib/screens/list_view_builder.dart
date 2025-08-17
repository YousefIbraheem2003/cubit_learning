import 'package:check_boxses/cubit/check_box_cubit/check_box_cubit.dart';
import 'package:check_boxses/widgets/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => CheckBoxCubit(),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return BlocBuilder<CheckBoxCubit, Map<int, bool>>(
                builder: (context, state) {
                  return HomeView(
                    value: state[index] ?? false,
                    onChanged: (value) {
                      context
                          .read<CheckBoxCubit>()
                          .check(index: index, value: value!);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
