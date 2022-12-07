import 'package:agii_alpha/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'screens.dart';

//ARCHIVO CORRESPONDIENTE AL MENU PRINCIPAL
class Listview1Screen extends StatefulWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  State<Listview1Screen> createState() => Listview1ScreenState();
}

class Listview1ScreenState extends State<Listview1Screen> {
  //LINK DEFINIDO PARA USARLO EN LA OPCIÓN COMPLEMENTAR CON SIBULS
  final Uri _url = Uri.parse('https://sibuls.userena.cl/');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //APPBAR ES LA BARRA SUPERIOR DE LA PANTALLA
        appBar: AppBar(
          title: const Text(
            "AGII",
            style: TextStyle(
              fontFamily: 'MuseoSans',
            ),
          ),
          leading: IconButton(
            icon: Image.asset('assets/logoulsoficial2.png'),
            onPressed: () {},
          ),
          centerTitle: true,
          elevation: 5,
          backgroundColor: const Color.fromRGBO(2, 102, 255, 1),
        ),
        //INSTRUCCION MEDIAQUERY USA LA ORIENTACION DEL DISPOSITIVO PARA MOSTRAR DIFERENTES DISPOSICIONES
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
                          //GESTURE DETECTOR ES PARA DARLE LA PROPIEDAD ONTAP A CUALQUIER WIDGET
                          //EN ESTE CASO EN EL ICONO Y EN EL TEXTO, ADEMAS SE INSERTÓ UN
                          //PAGE ROUTE BUILDER PARA AÑADIR UNA ANIMACION EN EL CAMBIO DE VENTANAS.
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
                                  }),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image(
                                    image: AssetImage('assets/botoneoq.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Usa el\nModelo EOQ Básico',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'MuseoSans',
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(76, 134, 255, 1),
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              AlertaInformacionModelos().infoModelos(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Aprender\nsobre Modelos',
                                  style: TextStyle(
                                    fontFamily: 'MuseoSans',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(76, 134, 255, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image(
                                    image:
                                        AssetImage('assets/iconopregunta.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: _launchUrl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 115,
                                  height: 120,
                                  child: Image(
                                    image: AssetImage('assets/sibuls1.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  'Complementar\ncon SIBULS',
                                  style: TextStyle(
                                    fontFamily: 'MuseoSans',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(76, 134, 255, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Acerca de',
                                  style: TextStyle(
                                    fontFamily: 'MuseoSans',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(76, 134, 255, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image(
                                    image:
                                        AssetImage('assets/botonengrane.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //--------------------------------

                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            //----------------------------------------------- DESDE ACÁ HACIA ABAJO SE CONFIGURA LA VISTA HORIZONTAL
            : Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                              pageBuilder:
                                  ((context, animation, secondaryAnimation) {
                                return const MyCalculator();
                              }),
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 90,
                              height: 90,
                              child: Image(
                                image: AssetImage('assets/botoneoq.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Modelo EOQ Básico.',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(76, 134, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          AlertaInformacionModelos().infoModelos(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Aprende sobre \n Modelos',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(76, 134, 255, 1),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 90,
                              height: 90,
                              child: Image(
                                image: AssetImage('assets/iconopregunta.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchUrl;
                        },
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 100,
                              height: 110,
                              child: Image(
                                image: AssetImage('assets/sibuls1.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Biblioteca Digital SIBULS.',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(76, 134, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 80,
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
                              pageBuilder:
                                  ((context, animation, secondaryAnimation) {
                                return const AppDetails();
                              }),
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            Text(
                              'Acerca de...',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(76, 134, 255, 1),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 90,
                              height: 90,
                              child: Image(
                                image: AssetImage('assets/botonengrane.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
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
