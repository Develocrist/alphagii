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
                const Text('Cantidad óptima de pedido:'),
                Image.asset(
                  'assets/formulacantidadeconomica.png',
                  fit: BoxFit.cover,
                ),
                const Divider(),
                const Text('Lead Time:'),
                Image.asset(
                  'assets/formulaleadtime.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                const Divider(),
                const Text('Punto de reorden:'),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/formulareorden.png',
                  fit: BoxFit.cover,
                  // alignment: Alignment.center,
                ),
                const Divider(),
                const Text('Costos:'),
                Image.asset(
                  'assets/formulascostos.png',
                  fit: BoxFit.cover,
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
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: '= Representa la cantidad óptima de pedido.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'D ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Tasa de demanda (unidades, lotes, paquetes por año)',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'K ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Costo de orden o preparación, dado en unidades monetarias por unidad.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'C ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Costo del ítem, dado en unidades monetarias por unidad.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'H ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Costo anual de Mantención, dado en unidades monetarias. Este es el resultado de la multiplicación entre el costo unitario y la tasa de mantenimiento (H = i * C).',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'i ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Tasa anual de mantenimiento, esta se da en unidades porcentuales.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'L ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= (Lead Time) Representa el tiempo de espera en que llega el pedido, se relaciona con el proveedor.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'N ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Número de pedidos a realizar en base a los días trabajados, generalmente es anual.',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
                      ]),
                ),
                const Divider(),
                RichText(
                  text: const TextSpan(
                      text: 'R ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: '= Punto de Reorden (unidades).',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal))
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

  void infoModelos(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            elevation: 5,
            icon: const Icon(
              Icons.info_outlined,
              size: 50,
              color: Colors.green,
            ),
            title: const Text(
              "Información",
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Divider(
                  height: 10,
                ),
                Text(
                  "Modelos de Inventario: ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Text(
                  'Son técnicas de administración de inventarios que proporcionan no solo las cantidades de pedidos y puntos de nuevos pedidos, sino también un calendario de cuando se necesita cada articulo y en que cantidades durante un proceso de producción.',
                  textAlign: TextAlign.justify,
                ),
                Divider(
                  height: 10,
                ),
                Text(
                  'Modelo EOQ: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  'El Módelo de Wilson, también denominado Sistema EOQ (Economic Order Quantity) es una de las herramientas que se utilizan para determinar el monto óptimo de pedido para un articulo de inventario. Este, tiene en cuenta los diferentes costos financieros, de operación y determina el monto de pedido que minimice los costos de inventario de la empresa.',
                  textAlign: TextAlign.justify,
                ),
                Text(''),
                Text(
                    'Para poder desarrollar el método EOQ se deben cumplir las siguientes condiciones o supuestos básicos en la empresa, de lo contrario los cálculos no se podrán llevar a cabo de forma precisa :'),
                Text(''),
                Text(
                    '1.- La demanda es conocida, independiente y sin grandes fluctuaciones a lo largo del año, por lo tanto, constante.',
                    textAlign: TextAlign.justify),
                Text(
                    '2.- El coste unitario de cada producto o compra tambien debe ser conocido y fijo.',
                    textAlign: TextAlign.justify),
                Text(
                    '3.- Los costes de almacenamiento tambien son conocidos y dependen del nivel de existencias',
                    textAlign: TextAlign.justify),
                Text(
                    '4.- No se consideran (al menos en el módelo básico) potenciales descuentos por volumen de compra o pedido.',
                    textAlign: TextAlign.justify),
                Text(
                    '5.- Los tiempos de abastecimiento y carga del proveedor se consideran tambien constantes y conocidos.',
                    textAlign: TextAlign.justify),
                Text(
                    '6.- Se toma el supuesto de que no hay roturas de stock y de que en cualquier momento se puede solicitar cualquier cantidad de producto al proveedor.',
                    textAlign: TextAlign.justify),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cerrar'))
            ],
          );
        });
  }

  //-------------------------------------
  void mostrarDialogo(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error de Ingreso"),
            iconColor: Colors.red,
            icon: const Icon(
              Icons.error_outline_outlined,
              size: 50,
            ),
            content: const Text(
              "Ingrese valores númericos en al menos las siguientes casillas: Demanda, Costo orden, Mantención.",
              textAlign: TextAlign.center,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Entendido.")),
            ],
          );
        });
  }
}
