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
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/nodisponible.jpg',
                fit: BoxFit.cover,
              ),
              const Divider(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: 'Próximamente en desarrollo.',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
