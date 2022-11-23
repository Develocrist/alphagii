import 'package:agii_alpha/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'screens.dart';

class Listview1Screen extends StatefulWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  State<Listview1Screen> createState() => Listview1ScreenState();
}

class Listview1ScreenState extends State<Listview1Screen> {
  final Uri _url = Uri.parse('https://sibuls.userena.cl/');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AGII"),
          centerTitle: true,
          elevation: 5,
          backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Alertas().descripcionApp(context);
          //       },
          //       icon: const Icon(Icons.info))
          // ],
        ),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        children: [
                          //probando ideas para futuro diseño
                          // Stack(
                          //   children: [
                          //     Container(
                          //       width: 290,
                          //       height: 80,
                          //       color: const Color.fromRGBO(76, 134, 255, 1),
                          //     ),
                          //     Container(
                          //         width: 80, height: 80, color: Colors.red),
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: Image(
                                  image: AssetImage('assets/botoneoq.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Modelo EOQ Básico.',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(76, 134, 255, 1),
                                  ))
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 800),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                      pageBuilder: ((context, animation,
                                          secondaryAnimation) {
                                        return const MyCalculator();
                                      })));
                            },
                            icon: const Icon(Icons.calculate),
                            iconSize: 60,
                            color: const Color.fromRGBO(8, 75, 129, 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 800),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                      pageBuilder: ((context, animation,
                                          secondaryAnimation) {
                                        return const MyCalculator();
                                      })));
                            },
                            child: const Text(
                              'Modelo EOQ Básico',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(8, 75, 129, 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              AlertaInformacionModelos().infoModelos(context);
                            },
                            icon: const Icon(Icons.info),
                            iconSize: 60,
                            color: const Color.fromRGBO(8, 75, 129, 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              AlertaInformacionModelos().infoModelos(context);
                            },
                            child: const Text(
                              'Información sobre modelos',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(8, 75, 129, 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          IconButton(
                            onPressed: _launchUrl,
                            icon: const Icon(Icons.book_online),
                            iconSize: 60,
                            color: const Color.fromRGBO(8, 75, 129, 10),
                          ),
                          GestureDetector(
                            onTap: _launchUrl,
                            child: const Text(
                              'SIBULS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(8, 75, 129, 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 800),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                      pageBuilder: ((context, animation,
                                          secondaryAnimation) {
                                        return const AppDetails();
                                      })));
                            },
                            icon: const Icon(Icons.build),
                            iconSize: 60,
                            color: const Color.fromRGBO(8, 75, 129, 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 800),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                      pageBuilder: ((context, animation,
                                          secondaryAnimation) {
                                        return const AppDetails();
                                      })));
                            },
                            child: const Text(
                              'Acerca de',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(8, 75, 129, 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 800),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: ((context, animation,
                                      secondaryAnimation) {
                                    return const MyCalculator();
                                  })));
                        },
                        icon: const Icon(Icons.calculate),
                        iconSize: 60,
                        color: const Color.fromRGBO(8, 75, 129, 10),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 800),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: ((context, animation,
                                      secondaryAnimation) {
                                    return const MyCalculator();
                                  })));
                        },
                        child: const Text(
                          'Modelo EOQ Básico',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(8, 75, 129, 10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        onPressed: () {
                          AlertaInformacionModelos().infoModelos(context);
                        },
                        icon: const Icon(Icons.info),
                        iconSize: 60,
                        color: const Color.fromRGBO(8, 75, 129, 10),
                      ),
                      const Text(
                        'Información sobre modelos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(8, 75, 129, 10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _launchUrl,
                        icon: const Icon(Icons.book_online),
                        iconSize: 60,
                        color: const Color.fromRGBO(8, 75, 129, 10),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchUrl;
                        },
                        child: const Text(
                          'SIBULS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(8, 75, 129, 10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 800),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: ((context, animation,
                                      secondaryAnimation) {
                                    return const AppDetails();
                                  })));
                        },
                        icon: const Icon(Icons.build),
                        iconSize: 60,
                        color: const Color.fromRGBO(8, 75, 129, 10),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 800),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: ((context, animation,
                                      secondaryAnimation) {
                                    return const AppDetails();
                                  })));
                        },
                        child: const Text(
                          'Acerca de',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(8, 75, 129, 10),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ));
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'No se puede lanzar $_url';
    }
  }
}
