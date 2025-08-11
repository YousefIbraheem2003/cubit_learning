import 'package:cubit_practice/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(
              Icons.add,
            ),
          ),
          ElevatedButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
