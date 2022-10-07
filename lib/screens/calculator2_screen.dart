import 'package:flutter/material.dart';

class Calculator2Screen extends StatelessWidget {
  const Calculator2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora EOQ"),
          elevation: 5,
          backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
        ),
        body: Column(
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
        ));
  }
}
