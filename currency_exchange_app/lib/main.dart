import 'package:currency_exchange/cubit/get_rate_cubit.dart';
import 'package:currency_exchange/screens/home_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MoneyExchangeApp());
}

class MoneyExchangeApp extends StatelessWidget {
  const MoneyExchangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetRateCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeViewScreen(),
      ),
    );
  }
}
