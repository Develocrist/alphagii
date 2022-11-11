import 'package:flutter/material.dart';

class Alertas {
  void infoFormulas(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              scrollable: true,
              alignment: Alignment.center,
              elevation: 5,
              title: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Fórmulario',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(8, 75, 129, 10),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: ClipRRect(
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                const Text(
                  'Cantidad óptima de pedido:',
                  style: TextStyle(fontSize: 20),
                ),
                Image.asset(
                  'assets/formulacantidadeconomica.png',
                  fit: BoxFit.fill,
                ),
                const Divider(),
                const Text(
                  'Tiempo entre pedidos:',
                  style: TextStyle(fontSize: 20),
                ),
                Image.asset(
                  'assets/formulaleadtime.png',
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
                const Divider(),
                const Text(
                  'Punto de reorden:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/formulareorden.png',
                  fit: BoxFit.cover,
                  // alignment: Alignment.center,
                ),
                const Divider(),
                const Text(
                  'Costos:',
                  style: TextStyle(fontSize: 20),
                ),
                Image.asset(
                  'assets/formulascostos.png',
                  fit: BoxFit.fill,
                  // alignment: Alignment.center,
                ),
                const Divider(
                  height: 30,
                  color: Colors.deepOrange,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: 'Variables',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'Q* ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: '= Representa la cantidad óptima de pedido.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'D ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Tasa de demanda (unidades, lotes, paquetes por año)',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'K ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Costo de orden o preparación, dado en unidades monetarias por unidad.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'C ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text:
                                '= Costo del ítem, dado en unidades monetarias por unidad.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'H ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Costo anual de Mantención, dado en unidades monetarias. Este es el resultado de la multiplicación entre el costo unitario y la tasa de mantenimiento (H = i * C).',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'i ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Tasa anual de mantenimiento, esta se da en unidades porcentuales.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'L ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Tiempo de espera del proveedor, representa el tiempo que demora en llegar el pedido.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'N ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Número de pedidos a realizar en base a los días trabajados, generalmente es anual.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'R ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Punto de Reorden (unidades), representa el punto en que se debería hacer el siguiente pedido.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18))
                      ]),
                ),
                const Divider(),
              ])),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cerrar'))
              ],
            ),
          );
        }); //builder es un codigo que regresa un widget
  }

  //--------------------------------------------------------------------------

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
              "Información",
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Divider(
                  height: 10,
                ),
                Text(
                  "Modelos de Inventario: \n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Son técnicas de administración de inventarios que proporcionan no solo las cantidades de pedidos y puntos de nuevos pedidos, sino también un calendario de cuando se necesita cada articulo y en que cantidades durante un proceso de producción.',
                  style: TextStyle(fontSize: 18),
                ),
                Divider(
                  height: 10,
                ),
                // Text(
                //   'Modelo EOQ: \n',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       color: Color.fromARGB(255, 115, 10, 207)),
                // ),
                // Text(
                //     'El Módelo de Wilson, también denominado Sistema EOQ (Economic Order Quantity) es una de las herramientas que se utilizan para determinar el monto óptimo de pedido para un articulo de inventario. Este, tiene en cuenta los diferentes costos financieros, de operación y determina el monto de pedido que minimice los costos de inventario de la empresa. \n',
                //     // textAlign: TextAlign.justify,
                //     style: TextStyle(fontSize: 18)),
                // Text(
                //     'Para poder desarrollar el método EOQ se deben cumplir las siguientes condiciones o supuestos básicos en la empresa, de lo contrario los cálculos no se podrán llevar a cabo de forma precisa: \n',
                //     style: TextStyle(fontSize: 18)),
                // Text(
                //     '1.- La demanda es conocida, independiente y sin grandes fluctuaciones a lo largo del año, por lo tanto, constante. \n',
                //     // textAlign: TextAlign.justify,
                //     style: TextStyle(fontSize: 18)),
                // Text(
                //     '2.- El coste unitario de cada producto o compra tambien debe ser conocido y fijo.\n',
                //     // textAlign: TextAlign.justify,
                //     style: TextStyle(fontSize: 18)),
                // Text(
                //     '3.- Los costes de almacenamiento tambien son conocidos y dependen del nivel de existencias. \n',
                //     // textAlign: TextAlign.justify,
                //     style: TextStyle(fontSize: 18)),
                // Text(
                //     '4.- No se consideran (al menos en el módelo básico) potenciales descuentos por volumen de compra o pedido. \n',
                //     // textAlign: TextAlign.justify,
                //     style: TextStyle(fontSize: 18)),
                // Text(
                //     '5.- Los tiempos de abastecimiento y carga del proveedor se consideran tambien constantes y conocidos. \n',
                //     // textAlign: TextAlign.justify,
                //     style: TextStyle(fontSize: 18)),
                // Text(
                //     '6.- Se toma el supuesto de que no hay roturas de stock y de que en cualquier momento se puede solicitar cualquier cantidad de producto al proveedor.',
                //     // textAlign: TextAlign.justify,
                //     style: TextStyle(fontSize: 18)),
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

  //-----------------------------------------------------

  void mostrarDialogo(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: const Text("Error de Ingreso"),
              iconColor: Colors.red,
              icon: const Icon(
                Icons.error_outline_outlined,
                size: 50,
              ),
              content: const Text(
                "Ingrese valores númericos en al menos las siguientes casillas: \n - Demanda. \n - Costo orden. \n - Mantención.",
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
                    child: const Text("Entendido.",
                        style: TextStyle(fontSize: 20))),
              ],
            ),
          );
        });
  }

  //-----------------------------------------------------------

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

  //----------------------------------------------------------

  void descripcionCalculadora(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
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
                  leading: Icon(Icons.info),
                  tilePadding: EdgeInsets.only(top: 10, bottom: 10),
                  title: Text(
                    'Información sobre el modelo.',
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [
                    Text(
                        'El Módelo de Wilson, también denominado Sistema EOQ (Economic Order Quantity) es una de las herramientas que se utilizan para determinar el monto óptimo de pedido para un artículo de inventario. Este, tiene en cuenta los diferentes costos financieros, de operación y determina el monto de pedido que minimice los costos de inventario de la empresa. \n',
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
                  leading: Icon(Icons.calculate),
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
                      'Los resultados entregados por la Aplicación se entregan en las siguientes unidades: \n\n - Cantidad óptima de pedido se entrega en Unidades (stock). \n \n- Tiempo entre pedidos se entrega en la unidad de tiempo Días. \n \n - Punto de reorden se entrega en Unidades (stock). \n \n - Número de ordenes esperado se entrega en Pedidos. \n \n - Los costos anuales se entregan en la unidad monetaria Pesos Chilenos (CLP)',
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
                  leading: Icon(Icons.info),
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
                      '- El Campo (L) correspondiente al "Tiempo de espera del proveedor" nos ayudará a obtener el resultado "Punto de reorden", este tiene un mínimo de 1 día y un máximo de 9 días. \n',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '- La unidad trabajada en el campo Demanda son "Unidades" \n \n - La unidad monetaría trabajada en los campos Costo orden, Costo unitario y Mantención corresponden a Pesos chilenos (CLP). \n \n  - La unidad de tiempo utilizada en los campos Tiempo de espera del proveedor y Días trabajados, se expresan como Días. \n \n',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ]),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Entendido.",
                        style: TextStyle(fontSize: 18))),
              ],
            ),
          );
        });
  }

  //----------------------------------------------------------

  void descripcionApp(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "AGII \n Apoyo a la Gestión de Ingeniería en los Inventarios. ",
              textAlign: TextAlign.center,
            ),
            iconColor: Colors.blue,
            icon: const Icon(
              Icons.info,
              size: 40,
            ),
            content: const Text(
              "Aplicación de Apoyo a la gestión de los Inventarios. \n Creada gracias a la gestión de la Unidad de Mejoramiento Docente para los estudiantes de Ingenieria de la Universidad de La Serena. \n \n Desarrolladores: \n - Cristofer Torrejón. \n - Cristian Araya. ",
              // textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Entendido.",
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          );
        });
  }
}
