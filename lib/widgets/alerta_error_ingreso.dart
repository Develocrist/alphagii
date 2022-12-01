import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AlertaErrorIngreso {
  void mostrarDialogo(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ResponsiveBuilder(builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
              return SingleChildScrollView(
                child: AlertDialog(
                  title: const Text(
                    "Faltan datos",
                    style: TextStyle(
                      fontFamily: 'MuseoSans',
                    ),
                  ),
                  iconColor: Colors.red,
                  icon: const Icon(
                    Icons.error_outline_outlined,
                    size: 50,
                  ),
                  content: const Text(
                    "Ingrese valores númericos en al menos las siguientes casillas: \n - Demanda. \n - Costo orden. \n - Mantención.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'MuseoSans',
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Intenta otra vez",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'MuseoSans',
                            ))),
                  ],
                ),
              );
            }
            if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
              return SingleChildScrollView(
                child: AlertDialog(
                  title: const Text(
                    "Faltan datos",
                    style: TextStyle(
                      fontFamily: 'MuseoSans',
                    ),
                  ),
                  iconColor: Colors.red,
                  icon: const Icon(
                    Icons.error_outline_outlined,
                    size: 50,
                  ),
                  content: const Text(
                    "Ingrese valores númericos en al menos las siguientes casillas: \n - Demanda. \n - Costo orden. \n - Mantención.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'MuseoSans',
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Intenta otra vez.",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'MuseoSans',
                            ))),
                  ],
                ),
              );
            }
            return Container(
              width: 100,
              height: 100,
              color: Colors.white,
            );
          });
        });
  }
}
