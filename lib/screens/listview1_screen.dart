import 'package:agii_alpha/widgets/formula_alert.dart';

import 'package:flutter/material.dart';

import 'calculator1_screen.dart';

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
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 700),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      pageBuilder: ((context, animation, secondaryAnimation) {
                        return const MyCalculator();
                      })));
            },
            icon: const Icon(Icons.calculate_outlined),
            iconSize: 100,
            color: const Color.fromRGBO(8, 75, 129, 10),
          ),
          const Text(
            'Modelo EOQ Básico',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(8, 75, 129, 10),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          //container se adapta al list view, por eso ocupa la totalidad de la pantalla
          // SingleChildScrollView(
          //   child: Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(5), color: Colors.indigo),
          //     padding:
          //         const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
          //     height: 200,
          //     width: 300,
          //     child: Column(
          //       children: const <Widget>[
          //         ExpansionTile(
          //           title: Text(
          //             'Proposito de la App',
          //             textAlign: TextAlign.center,
          //             style: TextStyle(fontSize: 18),
          //           ),
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(8.0),
          //               child: Text(
          //                   'La aplicación que estan a punto de utilizar fue desarrollada para los estudiantes de ingenieria, con la finalidad de reforzar el tópico de modelos de inventario'),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 5,
          ),

          // ListTile(
          //   iconColor: const Color.fromRGBO(8, 75, 129, 10),
          //   leading: const Icon(Icons.calculate_outlined),
          //   title: const Text('Modelo EOQ Básico'),
          //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         PageRouteBuilder(
          //             transitionDuration: const Duration(milliseconds: 700),
          //             transitionsBuilder:
          //                 (context, animation, secondaryAnimation, child) {
          //               return FadeTransition(
          //                 opacity: animation,
          //                 child: child,
          //               );
          //             },
          //             pageBuilder: ((context, animation, secondaryAnimation) {
          //               return const MyCalculator();
          //             })));
          //     // final route = MaterialPageRoute(
          //     //   builder: (context) => const MyCalculator(),
          //     // );
          //     // Navigator.push(context, route);
          //   },
          // ),
          // const Divider(
          //   height: 1,
          // ),
          // ListTile(
          //   iconColor: const Color.fromRGBO(8, 75, 129, 10),
          //   leading: const Icon(Icons.calculate_outlined),
          //   title: const Text('Modelo EOQ con Faltante'),
          //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         PageRouteBuilder(
          //             transitionDuration: const Duration(milliseconds: 700),
          //             transitionsBuilder:
          //                 (context, animation, secondaryAnimation, child) {
          //               return FadeTransition(
          //                 opacity: animation,
          //                 child: child,
          //               );
          //             },
          //             pageBuilder: ((context, animation, secondaryAnimation) {
          //               return const Calculator2Screen();
          //             })));

          //     // final route = MaterialPageRoute(
          //     //   builder: (context) => const Calculator2Screen(),
          //     // );
          //     // Navigator.push(context, route);
          //   },
          // ),
          // const Divider(
          //   height: 1,
          // ),
          // ListTile(
          //   iconColor: const Color.fromRGBO(8, 75, 129, 10),
          //   leading: const Icon(Icons.engineering_outlined),
          //   title: const Text('Opciones'),
          //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         PageRouteBuilder(
          //             transitionDuration: const Duration(milliseconds: 700),
          //             transitionsBuilder:
          //                 (context, animation, secondaryAnimation, child) {
          //               return FadeTransition(
          //                 opacity: animation,
          //                 child: child,
          //               );
          //             },
          //             pageBuilder: ((context, animation, secondaryAnimation) {
          //               return const OptionScreen();
          //             })));
          //     // final route = MaterialPageRoute(
          //     //   builder: (context) => const OptionScreen(),
          //     // );
          //     // Navigator.push(context, route);
          //   },
          // ),
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
          Alertas().infoModelos(context);
        },
      ),
    );
  }
}
