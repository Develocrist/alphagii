import 'package:flutter/material.dart';

class AlertaDescripcionCalculadora {
  void descripcionCalculadora(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        // return ResponsiveBuilder(
        //   builder: (context, sizingInformation) {
        //     if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text("Modelo EOQ Básico"),
            iconColor: Colors.blue,
            icon: const Icon(
              Icons.info,
              size: 50,
            ),
            content: Column(children: const <Widget>[
              ExpansionTile(
                leading: Icon(Icons.info, size: 40),
                tilePadding: EdgeInsets.only(top: 10, bottom: 10),
                title: Text(
                  'Información sobre el modelo.',
                  style: TextStyle(fontSize: 18),
                ),
                children: [
                  Text(
                      'El Módelo de Wilson, también denominado Sistema EOQ (Economic Order Quantity) es una de las herramientas que se utilizan para determinar el monto óptimo de pedido para un artículo de inventario.\n\nEste, tiene en cuenta los diferentes costos financieros, de operación y determina el monto de pedido que minimice los costos de inventario de la empresa. \n',
                      style: TextStyle(fontSize: 18)),
                  Text(
                      'Para poder desarrollar el método EOQ se deben cumplir las siguientes condiciones o supuestos básicos en la empresa, de lo contrario, los cálculos no se podrán llevar a cabo de forma precisa: \n',
                      style: TextStyle(fontSize: 18)),
                  Text(
                      '1.- La demanda es conocida, independiente y sin grandes fluctuaciones a lo largo del año, por lo tanto, constante. \n \n 2.- El coste unitario de cada producto o compra tambien debe ser conocido y fijo. \n \n 3.- Los costes de almacenamiento también son conocidos y dependen del nivel de existencias. \n \n 4.- No se consideran (al menos en el módelo básico) potenciales descuentos por volumen de compra o pedido. \n \n 5.- Los tiempos de abastecimiento y carga del proveedor se consideran tambien constantes y conocidos. \n \n 6.- Se toma el supuesto de que no hay roturas de stock y de que en cualquier momento se puede solicitar cualquier cantidad de producto al proveedor. \n \n',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
              ExpansionTile(
                tilePadding: EdgeInsets.only(top: 10, bottom: 10),
                leading: Icon(Icons.calculate, size: 40),
                title: Text('Modelo matemático y resultados.',
                    style: TextStyle(fontSize: 18)),
                children: [
                  Text(
                    "El método EOQ como modelo matemático permite obtener los siguientes resultados: \n",
                    // textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    ' - Cantidad óptima de pedido. \n - Tiempo entre pedidos. \n - Punto de reorden. \n - Número de ordenes esperado. \n - Costo anual orden. \n - Costo anual de mantención. \n - Costo total anual. \n',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Los resultados entregados por la aplicación se entregan en las siguientes unidades: \n\n - Cantidad óptima de pedido se entrega en unidades (stock). \n \n- Tiempo entre pedidos se entrega en la unidad de tiempo días. \n \n - Punto de reorden se entrega en unidades (stock). \n \n - Número de ordenes esperado se entrega en pedidos. \n \n - Los costos anuales se entregan en la unidad monetaria pesos chilenos (CLP).',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
              ExpansionTile(
                tilePadding: EdgeInsets.only(top: 10, bottom: 10),
                leading: Icon(Icons.lightbulb, size: 40),
                title: Text(
                  'Información adicional.',
                  style: TextStyle(fontSize: 18),
                ),
                children: [
                  Text(
                    '- Solo se necesita ingresar y validar los campos de Demanda, Costo de orden y Mantención para poder generar el gráfico. \n',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '- Los resultados que se entregan tienen como base un año de días trabajados (365). Si se necesita ingresar un valor distinto, existe el campo opcional llamado "Días trabajados", esto modificara el resultado "Tiempo entre pedidos". \n',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '- El campo (L) correspondiente al "Tiempo de espera del proveedor" nos ayudará a obtener el resultado "Punto de reorden", este tiene un mínimo de 1 día y un máximo de 9 días. \n',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '- La unidad trabajada en el campo Demanda son "Unidades" \n \n - La unidad monetaria trabajada en los campos Costo orden, Costo unitario y Mantención corresponden a pesos chilenos (CLP). \n \n  - La unidad de tiempo utilizada en los campos Tiempo de espera del proveedor y días trabajados, se expresan como días. \n \n',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ]),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text("Entendido", style: TextStyle(fontSize: 18))),
            ],
          ),
        );
        // }
        // if (sizingInformation.deviceScreenType ==
        //     DeviceScreenType.tablet) {}
        // return SingleChildScrollView(
        //   child: AlertDialog(
        //     title: const Text(
        //       "Modelo EOQ Básico",
        //       style: TextStyle(fontSize: 20),
        //     ),
        //     iconColor: Colors.blue,
        //     icon: const Icon(
        //       Icons.info,
        //       size: 50,
        //     ),
        //     content: Column(children: const <Widget>[
        //       ExpansionTile(
        //         leading: Icon(Icons.info, size: 40),
        //         tilePadding: EdgeInsets.only(top: 10, bottom: 10),
        //         title: Text(
        //           'Información sobre el modelo.',
        //           style: TextStyle(fontSize: 24),
        //         ),
        //         children: [
        //           Text(
        //               'El Módelo de Wilson, también denominado Sistema EOQ (Economic Order Quantity) es una de las herramientas que se utilizan para determinar el monto óptimo de pedido para un artículo de inventario. Este, tiene en cuenta los diferentes costos financieros, de operación y determina el monto de pedido que minimice los costos de inventario de la empresa. \n',
        //               style: TextStyle(fontSize: 22)),
        //           Text(
        //               'Para poder desarrollar el método EOQ se deben cumplir las siguientes condiciones o supuestos básicos en la empresa, de lo contrario, los cálculos no se podrán llevar a cabo de forma precisa: \n',
        //               style: TextStyle(fontSize: 22)),
        //           Text(
        //               '1.- La demanda es conocida, independiente y sin grandes fluctuaciones a lo largo del año, por lo tanto, constante. \n \n 2.- El coste unitario de cada producto o compra tambien debe ser conocido y fijo. \n \n 3.- Los costes de almacenamiento también son conocidos y dependen del nivel de existencias. \n \n 4.- No se consideran (al menos en el módelo básico) potenciales descuentos por volumen de compra o pedido. \n \n 5.- Los tiempos de abastecimiento y carga del proveedor se consideran tambien constantes y conocidos. \n \n 6.- Se toma el supuesto de que no hay roturas de stock y de que en cualquier momento se puede solicitar cualquier cantidad de producto al proveedor. \n \n',
        //               style: TextStyle(fontSize: 22)),
        //         ],
        //       ),
        //       ExpansionTile(
        //         tilePadding: EdgeInsets.only(top: 10, bottom: 10),
        //         leading: Icon(Icons.calculate, size: 40),
        //         title: Text('Modelo matemático y resultados.',
        //             style: TextStyle(fontSize: 24)),
        //         children: [
        //           Text(
        //             "El método EOQ como modelo matemático permite obtener los siguientes resultados: \n",
        //             // textAlign: TextAlign.justify,
        //             style: TextStyle(fontSize: 22),
        //           ),
        //           Text(
        //             ' - Cantidad óptima de pedido. \n - Tiempo entre pedidos. \n - Punto de reorden. \n - Número de ordenes esperado. \n - Costo anual orden. \n - Costo anual de mantención. \n - Costo total anual. \n',
        //             textAlign: TextAlign.left,
        //             style: TextStyle(fontSize: 22),
        //           ),
        //           Text(
        //             'Los resultados entregados por la Aplicación se entregan en las siguientes unidades: \n\n - Cantidad óptima de pedido se entrega en Unidades (stock). \n \n- Tiempo entre pedidos se entrega en la unidad de tiempo Días. \n \n - Punto de reorden se entrega en Unidades (stock). \n \n - Número de ordenes esperado se entrega en Pedidos. \n \n - Los costos anuales se entregan en la unidad monetaria Pesos Chilenos (CLP)',
        //             textAlign: TextAlign.left,
        //             style: TextStyle(fontSize: 22),
        //           ),
        //           SizedBox(
        //             height: 5,
        //           )
        //         ],
        //       ),
        //       ExpansionTile(
        //         tilePadding: EdgeInsets.only(top: 10, bottom: 10),
        //         leading: Icon(Icons.lightbulb, size: 40),
        //         title: Text(
        //           'Información adicional.',
        //           style: TextStyle(fontSize: 24),
        //         ),
        //         children: [
        //           Text(
        //             '- Solo se necesita ingresar y validar los campos de Demanda, Costo de orden y Mantención para poder generar el gráfico. \n',
        //             style: TextStyle(fontSize: 22),
        //           ),
        //           Text(
        //             '- Los resultados que se entregan tienen como base un año de días trabajados (365). Si se necesita ingresar un valor distinto, existe el campo opcional llamado "Días trabajados", esto modificara el resultado "Tiempo entre pedidos". \n',
        //             style: TextStyle(fontSize: 22),
        //           ),
        //           Text(
        //             '- El Campo (L) correspondiente al "Tiempo de espera del proveedor" nos ayudará a obtener el resultado "Punto de reorden", este tiene un mínimo de 1 día y un máximo de 9 días. \n',
        //             style: TextStyle(fontSize: 22),
        //           ),
        //           Text(
        //             '- La unidad trabajada en el campo Demanda son "Unidades" \n \n - La unidad monetaría trabajada en los campos Costo orden, Costo unitario y Mantención corresponden a Pesos chilenos (CLP). \n \n  - La unidad de tiempo utilizada en los campos Tiempo de espera del proveedor y Días trabajados, se expresan como Días. \n \n',
        //             style: TextStyle(fontSize: 22),
        //           ),
        //           SizedBox(
        //             height: 5,
        //           )
        //         ],
        //       ),
        //     ]),
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10)),
        //     actions: <Widget>[
        //       TextButton(
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           child: const Text("Entendido.",
        //               style: TextStyle(fontSize: 24))),
        //     ],
        //   ),
        // );
        //},
        //);
      },
    );
  }
}
