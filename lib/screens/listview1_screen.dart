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
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

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
      body: SingleChildScrollView(
        child: Column(
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

            SizedBox(
              width: 300,
              height: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      shadowColor: Colors.transparent.withOpacity(0.1),
                      side: const BorderSide(
                          width: 2, color: Color.fromRGBO(8, 75, 129, 1)),
                      backgroundColor: Colors.white),
                  onPressed: () {
                    Alertas().infoModelos(context);
                  },
                  child: const Text(
                    'Información sobre modelos',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(8, 75, 129, 1)),
                    textAlign: TextAlign.center,
                  )),
            ),

            const SizedBox(
              height: 50,
            ),

            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 400,
                    height: 150,
                    color: const Color.fromRGBO(8, 75, 129, 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Para más información y material de apoyo, visita nuestra Biblioteca Digítal.',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    shadowColor:
                                        Colors.transparent.withOpacity(0.1),
                                    side: const BorderSide(
                                        width: 2, color: Colors.white),
                                    backgroundColor:
                                        const Color.fromRGBO(8, 75, 129, 1)),
                                onPressed: _launchUrl,
                                child: const Text(
                                  'SIBULS',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
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
