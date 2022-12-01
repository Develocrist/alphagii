import 'package:flutter/material.dart';

class AlertaFormulario {
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
                  text: 'Formulas',
                  style: TextStyle(
                    fontFamily: 'MuseoSans',
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
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'MuseoSans',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/formulacantidadeconomica.png',
                  fit: BoxFit.fill,
                ),
                const Divider(),
                const Text(
                  'Tiempo entre pedidos:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MuseoSans',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/formulaleadtime.png',
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
                const Divider(),
                const Text(
                  'Punto de reorden:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MuseoSans',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/formulareorden.png',
                  fit: BoxFit.cover,
                  // alignment: Alignment.center,
                ),
                const Divider(),
                const Text(
                  'Costos:',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MuseoSans',
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                          fontFamily: 'MuseoSans',
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
                                fontFamily: 'MuseoSans',
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
                                '= Tasa de demanda (unidades, lotes y paquetes por año).',
                            style: TextStyle(
                                fontFamily: 'MuseoSans',
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
                          fontFamily: 'MuseoSans',
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Costo de orden o preparación, dado en unidades monetarias por unidad.',
                            style: TextStyle(
                                fontFamily: 'MuseoSans',
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
                        fontFamily: 'MuseoSans',
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                            text:
                                '= Costo del ítem, dado en unidades monetarias por unidad.',
                            style: TextStyle(
                                fontFamily: 'MuseoSans',
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
                          fontFamily: 'MuseoSans',
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Costo anual de Mantención, dado en unidades monetarias. Este es el resultado de la multiplicación entre el costo unitario y la tasa de mantenimiento (H = i * C).',
                            style: TextStyle(
                                fontFamily: 'MuseoSans',
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
                          fontFamily: 'MuseoSans',
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Tasa anual de mantenimiento, esta se da en unidades porcentuales.',
                            style: TextStyle(
                                fontFamily: 'MuseoSans',
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
                          fontFamily: 'MuseoSans',
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Tiempo de espera del proveedor, representa el tiempo que demora en llegar el pedido.',
                            style: TextStyle(
                                fontFamily: 'MuseoSans',
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
                          fontFamily: 'MuseoSans',
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Número de pedidos a realizar en base a los días trabajados, generalmente es anual.',
                            style: TextStyle(
                                fontFamily: 'MuseoSans',
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
                          fontFamily: 'MuseoSans',
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text:
                                '= Punto de reorden (unidades), representa el punto en que se debería hacer el siguiente pedido.',
                            style: TextStyle(
                                fontFamily: 'MuseoSans',
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
                    child: const Text(
                      'Cerrar',
                      style: TextStyle(
                        fontFamily: 'MuseoSans',
                      ),
                    ))
              ],
            ),
          );
        }); //builder es un codigo que regresa un widget
  }
}
