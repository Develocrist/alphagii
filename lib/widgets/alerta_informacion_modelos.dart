import 'package:flutter/material.dart';

class AlertaInformacionModelos {
  void infoModelos(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            elevation: 5,
            icon: const Icon(
              Icons.info,
              size: 40,
              color: Colors.blue,
            ),
            title: const Text(
              "Información general",
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ExpansionTile(
                  leading: Icon(Icons.calculate, size: 40),
                  tilePadding: EdgeInsets.only(top: 10, bottom: 10),
                  title: Text('Modelos de inventario. ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  children: [
                    Text(
                        'Son técnicas de administración de inventarios que, durante un proceso de producción, proporcionan las cantidades de pedidos, puntos de nuevos pedidos y un calendario respecto a cuándo se necesita cada pedido y en que cantidad.\n',
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.type_specimen, size: 40),
                  tilePadding: EdgeInsets.only(top: 10, bottom: 10),
                  title: Text(
                    'Tipos de modelos.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Text(
                      'Modelos Deterministicos: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Toman como supuesto que tenemos certeza de la demanda, la cual puede estar dada por pronósticos de demanda o pedidos reales de los clientes. \n',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Modelos Probabilisticos: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Cuando la demanda no es conocida, está sujeta a una cantidad significativa de incertidumbre y variabilidad.\n',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.book,
                    size: 40,
                  ),
                  tilePadding: EdgeInsets.only(top: 10, bottom: 10),
                  title: Text(
                    'Material de estudio recomendado.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Text(
                      '- Introducción a la Investigación de Operaciones, 9na Edición, Frederick S. Hillier y Gerald J. Lieberman. \n \n - Investigación de operaciones - Aplicaciones y algoritmos, Wayne L. Winston. \n \n - Investigación de operaciones, Décima edición, Hamdy A. Taha.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cerrar', style: TextStyle(fontSize: 18)))
            ],
          );
        });
  }
}
