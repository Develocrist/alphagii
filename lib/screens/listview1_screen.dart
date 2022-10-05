import 'package:agii_alpha/widgets/formula_alert.dart';
import 'package:flutter/material.dart';

import 'calculator1_screen.dart';
import 'package:agii_alpha/screens/options_screen.dart';
import 'package:agii_alpha/screens/calculator2_screen.dart';

class Listview1Screen extends StatelessWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("AGII"),
          centerTitle: true,
          elevation: 5,
          backgroundColor: const Color.fromRGBO(8, 75, 129, 10)),
      body: ListView(
        children: [
          ListTile(
            iconColor: const Color.fromRGBO(8, 75, 129, 10),
            leading: const Icon(Icons.calculate_outlined),
            title: const Text('Calculadora EOQ Básica'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => const MyCalculator(),
              );
              Navigator.push(context, route);
            },
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            iconColor: const Color.fromRGBO(8, 75, 129, 10),
            leading: const Icon(Icons.calculate_outlined),
            title: const Text('Calculadora EOQ con Faltante'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => const Calculator2Screen(),
              );
              Navigator.push(context, route);
            },
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            iconColor: const Color.fromRGBO(8, 75, 129, 10),
            leading: const Icon(Icons.engineering_outlined),
            title: const Text('Opciones'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => const OptionScreen(),
              );
              Navigator.push(context, route);
            },
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.info_outline,
          size: 30,
        ),
        onPressed: () {
          alertas().infoDialog(context);
        },
      ),
    );
  }
}
