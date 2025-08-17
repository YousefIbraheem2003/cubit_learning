import 'package:check_boxses/screens/list_view_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckBoxses());
}

class CheckBoxses extends StatelessWidget {
  const CheckBoxses({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewBuilder(),
    );
  }
}
