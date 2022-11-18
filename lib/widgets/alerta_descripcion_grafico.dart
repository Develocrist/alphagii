import 'package:flutter/material.dart';

class AlertaDescripcionGrafico {
  void descripcionGrafico(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: const Text("Modelo Gráfico EOQ"),
              iconColor: Colors.blue,
              icon: const Icon(
                Icons.error_outline_outlined,
                size: 30,
              ),
              content: const Text(
                "El modelo gráfico en pantalla permite observar el comportamiento de la demanda en base a la cantidad óptima de pedido obtenida anteriormente. \n Además de incorporar gráficamente el inventario medio e incluir el tiempo transcurrido entre pedidos, a fin de analizar como se visualizan y comportan estas variables.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Entendido.",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          );
        });
  }
}
