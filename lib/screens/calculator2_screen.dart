import 'package:flutter/material.dart';

class Calculator2Screen extends StatelessWidget {
  const Calculator2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora EOQ"),
        elevation: 5,
        backgroundColor: Color.fromRGBO(8, 75, 129, 10),
      ),
      body: const Center(
        child: Text('Calculator2Screen'),
      ),
    );
  }
}
