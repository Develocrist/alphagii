import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora EOQ"),
        elevation: 5,
        backgroundColor: Color.fromRGBO(8, 75, 129, 10),
      ),
      body: const Center(
        child: Text('CalculatorScreen'),
      ),
    );
  }
}
