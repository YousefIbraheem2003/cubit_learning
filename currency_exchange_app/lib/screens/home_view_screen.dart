import 'package:currency_exchange/cubit/get_rate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  double amount = 0.0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRateCubit, double>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Money Exchange app')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: fromController,
                        decoration: const InputDecoration(hintText: 'from'),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      '->',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: toController,
                        decoration: const InputDecoration(hintText: 'to'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: amountController,
                  onSubmitted: (value) {
                    context.read<GetRateCubit>().getRate(
                          from: fromController.text,
                          to: toController.text,
                        );
                  },
                  decoration: const InputDecoration(
                    hintText: 'amount',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'conversion rate',
                        ),
                        Container(
                          height: 80,
                          width: 150,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              state.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'amount converted',
                        ),
                        Container(
                          height: 80,
                          width: 150,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              '${state * (double.tryParse(amountController.text) ?? 0)}',
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
