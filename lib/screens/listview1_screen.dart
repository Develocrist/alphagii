import 'package:agii_alpha/widgets/formula_alert.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'calculator1_screen.dart';

class Listview1Screen extends StatefulWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  State<Listview1Screen> createState() => _Listview1ScreenState();
}

class _Listview1ScreenState extends State<Listview1Screen> {
  final Uri _url = Uri.parse('https://sibuls.userena.cl/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AGII"),
        centerTitle: true,
        elevation: 5,
        backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
        actions: [
          IconButton(
              onPressed: () {
                Alertas().descripcionApp(context);
              },
              icon: const Icon(Icons.info))
        ],
      ),
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

          const Divider(
            height: 1,
          ),

          ElevatedButton(
              onPressed: () {
                Alertas().infoModelos(context);
              },
              child: const Text('Información sobre modelos')),

          const SizedBox(
            height: 10,
          ),

          ElevatedButton(onPressed: _launchUrl, child: const Text('SIBULS')),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.indigo,
      //   child: const Icon(
      //     Icons.info_outline,
      //     size: 30,
      //   ),
      //   onPressed: () {
      //     Alertas().infoModelos(context);
      //   },
      // ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'No se puede lanzar $_url';
    }
  }
}
