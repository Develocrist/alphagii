import 'dart:math';

import 'package:agii_alpha/screens/graph_screen.dart';
import 'package:agii_alpha/widgets/formula_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => Calculadora();
}

class Calculadora extends State<MyCalculator> {
  //controladores para despues asignarles un campo de texto
  final controllerDemanda = TextEditingController();
  final controllerOrden = TextEditingController();
  final controllerCostoUnitario = TextEditingController();
  final controllerMantencion = TextEditingController();
  final controllerDias = TextEditingController();
  final controllerLead = TextEditingController();
  bool cbFlag = false;
  //grflag es para habilitar el boton de graficos unicamente cuando se hayan generado los resultados
  bool grFlag = true;

  //blflag es para activar o no la casilla de lead time
  bool blFlag = false;
  //final my_form_key = GlobalKey<FormState>();

  String mostrarCantidadOptima = "";
  // String mostrarLeadtime = "";
  String mostrarNumOrdenes = "";
  String tiempoReorden = "";
  String campoPuntoReorden = "";
  String tiempoentrePedidos = "";

  String costoOrden = "";
  String costMantencion = "";
  String costoTotal = "";

  //formula para realizar la operacion aritmetica
  void operacionMatematica() {
    double demanda = 0;
    double orden = 0;
    double costoUnitario = 0;
    double costoMantencion = 0;
    double diasTrabajados = 0;
    double leadTime = 0;

    if (isNumericUsingtryParse(controllerDemanda.text) &&
        isNumericUsingtryParse(controllerOrden.text) &&
        isNumericUsingtryParse(controllerMantencion.text) &&
        isNumericUsingtryParse(controllerCostoUnitario.text) &&
        isNumericUsingtryParse(controllerDias.text) &&
        isNumericUsingtryParse(controllerLead.text)) {
      FocusScope.of(context)
          .unfocus(); // linea para ocultar el teclado al presionar el botón de calculo
      costoUnitario = double.parse(controllerCostoUnitario.text);
      costoMantencion = double.parse(controllerMantencion.text);
      diasTrabajados = double.parse(controllerDias.text);
      demanda = double.parse(controllerDemanda.text);
      orden = double.parse(controllerOrden.text);
      costoMantencion = double.parse(controllerMantencion.text);
      leadTime = double.parse(controllerLead.text);

      //formula cantidad optima
      double cantidadOptima = sqrt((2 * demanda * orden) / costoMantencion);
      String r = cantidadOptima.toStringAsFixed(1);

      //formula numero esperado de ordenes
      double numOrdenes = demanda / cantidadOptima;
      String ordenes = numOrdenes.toStringAsFixed(0);

      //formula tiempo de reorden
      double reOrden = diasTrabajados / numOrdenes;
      String ord = reOrden.toStringAsFixed(1);

      //formula punto de reorden
      double puntoReorden = ((demanda / diasTrabajados) * leadTime);
      String ptoReorden = puntoReorden.toStringAsFixed(0);

      //formula costos
      double totalCostoOrden = ((demanda / cantidadOptima) * orden);
      String tcostoOrden = totalCostoOrden.toStringAsFixed(0);

      //formula costo total de mantencion
      double totalCostoMantener = ((cantidadOptima / 2) * costoMantencion);
      String tcostoMantener = totalCostoMantener.toStringAsFixed(0);

      //formula costo total de todo
      double totalCostoTotal = (demanda * costoUnitario) +
          ((demanda / cantidadOptima) * orden) +
          ((cantidadOptima / 2) * costoMantencion);
      String tcostoTotal = totalCostoTotal.toStringAsFixed(0);

      //tiempo entre pedidos
      // double tentrePedidos = ((cantidadOptima / demanda) * diasTrabajados);
      // String t = tentrePedidos.toStringAsFixed(1);

      setState(() {
        mostrarCantidadOptima = "Cantidad óptima de pedido: \n $r unidades.";
        tiempoentrePedidos = "Tiempo entre pedidos: \n $ord días.";
        //tiempoReorden = "Tiempo entre pedidos : \n $ord días";
        mostrarNumOrdenes =
            "Número de ordenes anual esperado: \n $ordenes pedidos.";
        campoPuntoReorden = "Punto de reorden: \n $ptoReorden unidades.";
        costoOrden = "Costo total anual orden: \n \$$tcostoOrden CLP.";
        costMantencion =
            "Costo total anual mantención: \n \$$tcostoMantener CLP.";
        costoTotal = "Costo total anual: \n \$$tcostoTotal CLP.";
        if (cantidadOptima > 0) {
          grFlag = false;
        } else {
          grFlag = true;
        }
      });
    } else if (isNumericUsingtryParse(controllerDemanda.text) &&
        isNumericUsingtryParse(controllerOrden.text) &&
        isNumericUsingtryParse(controllerMantencion.text) &&
        isNumericUsingtryParse(controllerCostoUnitario.text) &&
        isNumericUsingtryParse(controllerLead.text)) {
      FocusScope.of(context)
          .unfocus(); // linea para ocultar el teclado al presionar el botón de calculo
      costoUnitario = double.parse(controllerCostoUnitario.text);
      costoMantencion = double.parse(controllerMantencion.text);
      diasTrabajados = 365;
      demanda = double.parse(controllerDemanda.text);
      orden = double.parse(controllerOrden.text);
      costoMantencion = double.parse(controllerMantencion.text);
      leadTime = double.parse(controllerLead.text);

      //formula cantidad optima
      double cantidadOptima = sqrt((2 * demanda * orden) / costoMantencion);
      String r = cantidadOptima.toStringAsFixed(1);

      //formula numero esperado de ordenes
      double numOrdenes = demanda / cantidadOptima;
      String ordenes = numOrdenes.toStringAsFixed(0);

      //formula tiempo de reorden
      double reOrden = diasTrabajados / numOrdenes;
      String ord = reOrden.toStringAsFixed(1);

      //formula punto de reorden
      double puntoReorden = ((demanda / diasTrabajados) * leadTime);
      String ptoReorden = puntoReorden.toStringAsFixed(0);

      //formula costos
      double totalCostoOrden = ((demanda / cantidadOptima) * orden);
      String tcostoOrden = totalCostoOrden.toStringAsFixed(0);

      //formula costo total de mantencion
      double totalCostoMantener = ((cantidadOptima / 2) * costoMantencion);
      String tcostoMantener = totalCostoMantener.toStringAsFixed(0);

      //formula costo total de todo
      double totalCostoTotal = (demanda * costoUnitario) +
          ((demanda / cantidadOptima) * orden) +
          ((cantidadOptima / 2) * costoMantencion);
      String tcostoTotal = totalCostoTotal.toStringAsFixed(0);

      //tiempo entre pedidos
      // double tentrePedidos = ((cantidadOptima / demanda) * diasTrabajados);
      // String t = tentrePedidos.toStringAsFixed(1);

      setState(() {
        mostrarCantidadOptima = "Cantidad óptima de pedido: \n $r unidades.";
        tiempoentrePedidos = "Tiempo entre pedidos: \n $ord días.";
        //tiempoReorden = "Tiempo entre pedidos : \n $ord días";
        mostrarNumOrdenes =
            "Número de ordenes anual esperado: \n $ordenes pedidos.";
        campoPuntoReorden = "Punto de reorden: \n $ptoReorden unidades.";
        costoOrden = "Costo total anual orden: \n \$$tcostoOrden CLP.";
        costMantencion =
            "Costo total anual mantención: \n \$$tcostoMantener CLP.";
        costoTotal = "Costo total anual: \n \$$tcostoTotal CLP.";
        if (cantidadOptima > 0) {
          grFlag = false;
        } else {
          grFlag = true;
        }
      });
    } else if (isNumericUsingtryParse(controllerDemanda.text) &&
        isNumericUsingtryParse(controllerOrden.text) &&
        isNumericUsingtryParse(controllerMantencion.text) &&
        isNumericUsingtryParse(controllerCostoUnitario.text) &&
        isNumericUsingtryParse(controllerDias.text)) {
      FocusScope.of(context)
          .unfocus(); // linea para ocultar el teclado al presionar el botón de calculo
      costoUnitario = double.parse(controllerCostoUnitario.text);
      costoMantencion = double.parse(controllerMantencion.text);
      diasTrabajados = double.parse(controllerDias.text);
      demanda = double.parse(controllerDemanda.text);
      orden = double.parse(controllerOrden.text);
      costoMantencion = double.parse(controllerMantencion.text);

      //formula cantidad optima
      double cantidadOptima = sqrt((2 * demanda * orden) / costoMantencion);
      String r = cantidadOptima.toStringAsFixed(1);

      //formula numero esperado de ordenes
      double numOrdenes = demanda / cantidadOptima;
      String ordenes = numOrdenes.toStringAsFixed(0);

      //formula tiempo de reorden
      double reOrden = diasTrabajados / numOrdenes;
      String ord = reOrden.toStringAsFixed(1);

      //formula punto de reorden
      //double puntoReorden = ((demanda / diasTrabajados) * reOrden);
      //String ptoReorden = puntoReorden.toStringAsFixed(0);

      //formula costos
      double totalCostoOrden = ((demanda / cantidadOptima) * orden);
      String tcostoOrden = totalCostoOrden.toStringAsFixed(0);

      //formula costo total de mantencion
      double totalCostoMantener = ((cantidadOptima / 2) * costoMantencion);
      String tcostoMantener = totalCostoMantener.toStringAsFixed(0);

      //formula costo total de todo
      double totalCostoTotal = (demanda * costoUnitario) +
          ((demanda / cantidadOptima) * orden) +
          ((cantidadOptima / 2) * costoMantencion);
      String tcostoTotal = totalCostoTotal.toStringAsFixed(0);

      //tiempo entre pedidos
      // double tentrePedidos = ((cantidadOptima / demanda) * diasTrabajados);
      // String t = tentrePedidos.toStringAsFixed(1);

      setState(() {
        mostrarCantidadOptima = "Cantidad óptima de pedido: \n $r unidades.";
        tiempoentrePedidos = "Tiempo entre pedidos: \n $ord días.";
        //tiempoReorden = "Tiempo entre pedidos : \n $ord días";
        mostrarNumOrdenes =
            "Número de ordenes anual esperado: \n $ordenes pedidos.";
        //campoPuntoReorden = "Punto de reorden: \n $ptoReorden unidades";
        costoOrden = "Costo total anual orden: \n \$$tcostoOrden CLP.";
        costMantencion =
            "Costo total anual mantención: \n \$$tcostoMantener CLP.";
        costoTotal = "Costo total anual: \n \$$tcostoTotal CLP.";
        if (cantidadOptima > 0) {
          grFlag = false;
        } else {
          grFlag = true;
        }
      });
    } else if (isNumericUsingtryParse(controllerDemanda.text) &&
        isNumericUsingtryParse(controllerOrden.text) &&
        isNumericUsingtryParse(controllerMantencion.text) &&
        isNumericUsingtryParse(controllerCostoUnitario.text)) {
      FocusScope.of(context)
          .unfocus(); // linea para ocultar el teclado al presionar el botón de calculo
      demanda = double.parse(controllerDemanda.text);
      orden = double.parse(controllerOrden.text);
      costoMantencion = double.parse(controllerMantencion.text);
      costoUnitario = double.parse(controllerCostoUnitario.text);
      costoMantencion = double.parse(controllerMantencion.text);
      diasTrabajados = 365;

      double cantidadOptima = sqrt((2 * demanda * orden) / costoMantencion);
      String r = cantidadOptima.toStringAsFixed(1);

      // double tentrePedidos = ((cantidadOptima / demanda) * 365);
      // String t = tentrePedidos.toStringAsFixed(0);

      //formula numero esperado de ordenes
      double numOrdenes = demanda / cantidadOptima;
      String ordenes = numOrdenes.toStringAsFixed(0);

      //formula tiempo de reorden
      double reOrden = diasTrabajados / numOrdenes;
      String ord = reOrden.toStringAsFixed(1);

      //formula punto de reorden
      //double puntoReorden = ((demanda / diasTrabajados) * reOrden);
      //String ptoReorden = puntoReorden.toStringAsFixed(0);

      //formula costos
      double totalCostoOrden = ((demanda / cantidadOptima) * orden);
      String tcostoOrden = totalCostoOrden.toStringAsFixed(0);

      //formula costo total de mantencion
      double totalCostoMantener = ((cantidadOptima / 2) * costoMantencion);
      String tcostoMantener = totalCostoMantener.toStringAsFixed(0);

      double totalCostoTotal = (demanda * costoUnitario) +
          ((demanda / cantidadOptima) * orden) +
          ((cantidadOptima / 2) * costoMantencion);
      String tcostoTotal = totalCostoTotal.toStringAsFixed(0);

      setState(() {
        mostrarCantidadOptima = "Cantidad óptima de pedido: \n $r unidades.";
        tiempoentrePedidos = "Tiempo entre pedidos: \n $ord días.";
        //tiempoReorden = "Tiempo entre pedidos: \n $ord días";
        mostrarNumOrdenes =
            "Número de ordenes anual esperado: \n $ordenes pedidos.";
        //campoPuntoReorden = "Punto de reorden: \n $ptoReorden unidades";
        costoOrden = "Costo total anual de orden: \n \$$tcostoOrden CLP.";
        costMantencion =
            "Costo total anual de mantención: \n \$$tcostoMantener CLP.";
        costoTotal = "Costo total anual: \n \$$tcostoTotal CLP.";
        if (cantidadOptima > 0) {
          grFlag = false;
        } else {
          grFlag = true;
        }
      });
    } else if (isNumericUsingtryParse(controllerDemanda.text) &&
        isNumericUsingtryParse(controllerOrden.text) &&
        isNumericUsingtryParse(controllerMantencion.text)) {
      FocusScope.of(context)
          .unfocus(); // linea para ocultar el teclado al presionar el botón de calculo
      demanda = double.parse(controllerDemanda.text);
      orden = double.parse(controllerOrden.text);
      costoMantencion = double.parse(controllerMantencion.text);

      double cantidadOptima = sqrt((2 * demanda * orden) / costoMantencion);
      String r = cantidadOptima.toStringAsFixed(1);

      double tentrePedidos = ((cantidadOptima / demanda) * 365);
      String t = tentrePedidos.toStringAsFixed(1);

      setState(() {
        limpiaCampoRespuestas();
        mostrarCantidadOptima = "Cantidad óptima de pedido: \n $r unidades.";
        tiempoentrePedidos = "Tiempo entre pedidos: \n $t días.";

        if (cantidadOptima > 0) {
          grFlag = false;
        } else {
          grFlag = true;
        }
      });
    } else {
      mostrarDialogo();
    }
  }

//limpiar campos
  void limpiaCampos() {
    setState(() {
      controllerCostoUnitario.text = "";
      controllerOrden.text = "";
      controllerDemanda.text = "";
      controllerMantencion.text = "";
      controllerDias.text = "";
      mostrarCantidadOptima = "";
      mostrarNumOrdenes = "";
      tiempoReorden = "";
      controllerLead.text = "";
      campoPuntoReorden = "";
      costoOrden = "";
      costoTotal = "";
      costMantencion = "";
      tiempoentrePedidos = "";
      FocusScope.of(context).unfocus();
      grFlag = true;
    });
  }

  //limpiar campos
  void limpiaCampoRespuestas() {
    setState(() {
      controllerCostoUnitario.text = "";

      controllerDias.text = "";
      mostrarCantidadOptima = "";
      mostrarNumOrdenes = "";
      tiempoReorden = "";
      campoPuntoReorden = "";
      costoOrden = "";
      costoTotal = "";
      costMantencion = "";
      tiempoentrePedidos = "";
      FocusScope.of(context).unfocus();
      grFlag = true;
    });
  }

//------------------------------------------

// Comprobar si es numero
  bool isNumericUsingtryParse(String string) {
    if (string.isEmpty) {
      return false;
    }
    final number = num.tryParse(string);
    if (number == null) {
      return false;
    }
    return true;
  }

//---------------------------------------------------------------------
  void mostrarDialogo() {
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

//parte visual
  @override
  Widget build(BuildContext context) {
    ScrollController controladorScroll = ScrollController();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          elevation: 5,
          backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
          title: const Text('Modelo EOQ'),
          actions: [
            IconButton(
                onPressed: () {
                  Alertas().descripcionCalculadora(context);
                },
                icon: const Icon(Icons.info)),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            controller: controladorScroll,
            child: Column(

                //key: my_form_key,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Campos principales:',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    //parte visual de los campos de texto, a los cuales se les asignan los controladores declarados mas arriba
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 70,
                        child: TextFormField(
                          controller: controllerDemanda,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                          ],
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, bottom: 1),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color.fromRGBO(8, 75, 129, 10),
                              )),
                              labelText: '(D) Demanda :'),
                        ),
                      ),
                      const VerticalDivider(),
                      SizedBox(
                        width: 150,
                        height: 70,
                        child: TextFormField(
                          controller: controllerOrden,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                          ],
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, bottom: 1),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(8, 75, 129, 10))),
                              labelText: ' (K) Costo orden \$:'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: controllerMantencion,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                          LengthLimitingTextInputFormatter(8),
                        ],
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 1),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(8, 75, 129, 10))),
                            labelText: '(H) Mantención \$:'),
                      ),
                    ),
                    const VerticalDivider(),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: controllerCostoUnitario,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                          LengthLimitingTextInputFormatter(8),
                        ],
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, bottom: 1),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(8, 75, 129, 10))),
                            labelText: '(C) Costo unitario \$:'),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Divider(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text('Campos opcionales:',
                          style: TextStyle(fontSize: 14)),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                          width: 250,
                          height: 50,
                          child: TextFormField(
                            //readOnly: !cbFlag,
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            controller: controllerDias,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, bottom: 1),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(8, 75, 129, 10))),
                              labelText: 'Días trabajados al año:',
                              // prefixIcon: Checkbox(
                              //   value: cbFlag,
                              //   onChanged: (bool? value) {
                              //     setState(() {
                              //       cbFlag = value!;
                              //     });
                              //   },
                              // )
                            ),
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SizedBox(
                          width: 250,
                          height: 50,
                          child: TextFormField(
                            //readOnly: !blFlag,
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                              //FilteringTextInputFormatter.digitsOnly,

                              LengthLimitingTextInputFormatter(2),
                            ],
                            controller: controllerLead,
                            validator: (controllerLead) {
                              final intNumber =
                                  double.tryParse(controllerLead!);
                              if (intNumber != null && intNumber <= 10) {
                                return null;
                              }
                              return 'Ingrese el numero';
                            },
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, bottom: 1),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(8, 75, 129, 10))),
                              labelText: '(L) Lead Time del proveedor (días):',
                              //prefixIcon:
                              // Checkbox(
                              //   value: blFlag,
                              //   onChanged: (bool? value) {
                              //     setState(() {
                              //       blFlag = value!;
                              //     });
                              //   },
                              // )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 15),
                  //   child: SizedBox(
                  //     width: 250,
                  //     height: 50,
                  //     child: TextFormField(
                  //       // onChanged: (String value) {
                  //       //   value = controllerDias.text;
                  //       //   try {
                  //       //     if (int.parse(value) >= 0 &&
                  //       //         int.parse(value) <= 366) {
                  //       //       controllerDias.text = value;
                  //       //     }
                  //       //   } catch (e) {}
                  //       // },
                  //       readOnly: !blFlag,
                  //       keyboardType: TextInputType.phone,
                  //       // validator: (numero) {
                  //       //   final doubleNumber = double.tryParse(numero!);
                  //       //   if (doubleNumber != null && doubleNumber <= 365) {
                  //       //     return null;
                  //       //   }
                  //       //   return 'Ingrese el numero';
                  //       // },
                  //       inputFormatters: <TextInputFormatter>[
                  //         FilteringTextInputFormatter.digitsOnly,
                  //         LengthLimitingTextInputFormatter(3),
                  //       ],
                  //       controller: controllerLead,
                  //       decoration: InputDecoration(
                  //           contentPadding:
                  //               const EdgeInsets.only(left: 10, bottom: 1),
                  //           focusedBorder: const OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                   color: Color.fromRGBO(8, 75, 129, 10))),
                  //           labelText: 'Lead Time del proveedor (Opcional)',
                  //           prefixIcon: Checkbox(
                  //             value: blFlag,
                  //             onChanged: (bool? value) {
                  //               setState(() {
                  //                 blFlag = value!;
                  //               });
                  //             },
                  //           )),
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(
                    height: 20,
                  ),
                  //codigo que incluye la inserción de los botones con sus respectivos colores
                  ElevatedButton.icon(
                    onPressed: () {
                      operacionMatematica();
                      controladorScroll.animateTo(
                          controladorScroll.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOut);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fixedSize: const Size(280, 40)),
                    label: const Text(
                      'Calcular',
                      style: TextStyle(fontSize: 16),
                    ),
                    icon: const Icon(Icons.calculate_outlined),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          limpiaCampos();
                          controladorScroll.animateTo(
                              controladorScroll.position.minScrollExtent,
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeInOut);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.transparent.withOpacity(0.1),
                            side: const BorderSide(
                              width: 2,
                              color: Color.fromRGBO(8, 75, 129, 1),
                            ),
                            fixedSize: const Size(120, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        label: const Text(
                          'Limpiar',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(8, 75, 129, 1)),
                        ),
                        icon: const Icon(
                          Icons.cleaning_services_outlined,
                          color: Color.fromRGBO(8, 75, 129, 1),
                        ),
                      ),
                      const VerticalDivider(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Alertas().infoFormulas(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(8, 75, 129, 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fixedSize: const Size(150, 40)),
                        label: const Text(
                          'Fórmulario',
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: const Icon(Icons.class_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: grFlag
                            ? null
                            : () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GraphScreen(
                                          dem: controllerDemanda.text,
                                          ord: controllerOrden.text,
                                          man: controllerMantencion.text,
                                        ))),
                        // onPressed: () {
                        //   Navigator.push(
                        //       context,
                        // MaterialPageRoute(
                        //     builder: (context) => GraphScreen(
                        //         dem: controllerDemanda.text,
                        //         ord: controllerOrden.text,
                        //         man: controllerMantencion.text))

                        //       // PageRouteBuilder(
                        //       //     transitionDuration:
                        //       //         const Duration(milliseconds: 700),
                        //       //     transitionsBuilder: (context, animation,
                        //       //         secondaryAnimation, child) {
                        //       //       return FadeTransition(
                        //       //         opacity: animation,
                        //       //         child: child,
                        //       //       );
                        //       //     },
                        //       //     pageBuilder:
                        //       //         ((context, animation, secondaryAnimation) {
                        //       //       return GraphScreen(
                        //       //         ,
                        //       //       );
                        //       //     }
                        //       //     )
                        //       //     )
                        //       );
                        // },

                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(8, 75, 129, 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fixedSize: const Size(220, 40)),
                        label: const Text(
                          'Gráfico',
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: const Icon(Icons.auto_graph_outlined),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controladorScroll.animateTo(
                              controladorScroll.position.minScrollExtent,
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeInOut);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(5),
                          backgroundColor: const Color.fromRGBO(
                              8, 75, 129, 10), // <-- Button color
                        ),
                        child: const Icon(Icons.arrow_upward),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //contenedores donde se insertan los resultados definidos en el metodo setState ubicado en la funcion
                  //donde estan las operaciones de cálculo
                  Container(
                    height: 400,
                    width: 400,
                    padding: const EdgeInsets.only(top: 10),
                    color: const Color.fromRGBO(28, 49, 108, 1),
                    child: SingleChildScrollView(
                      child: Text(
                        //aquí se inserta el resultado del textformfield
                        '$mostrarCantidadOptima \n $tiempoentrePedidos \n $campoPuntoReorden \n $mostrarNumOrdenes  \n $costoOrden \n $costMantencion \n $costoTotal',
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                ]),
          ),
        ));
  }
}
