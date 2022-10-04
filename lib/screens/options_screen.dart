import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opciones"),
        elevation: 5,
        backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
      ),
      body: const Center(
        child: Text('OptionScreen'),
      ),
    );
  }
}
