import 'dart:math';

import 'package:agii_alpha/screens/graph_screen.dart';
import 'package:agii_alpha/widgets/formula_alert.dart';
import 'package:flutter/material.dart';

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
  //final my_form_key = GlobalKey<FormState>();

  String mostrarCantidadOptima = "";
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

    if (isNumericUsingtryParse(controllerDemanda.text) &&
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

      double cantidadOptima = sqrt((2 * demanda * orden) / costoMantencion);
      String r = cantidadOptima.toStringAsFixed(0);

      // //formula numero esperado de ordenes
      double numOrdenes = demanda / cantidadOptima;
      String ordenes = numOrdenes.toStringAsFixed(0);

      //formula tiempo de reorden
      double reOrden = diasTrabajados / numOrdenes;
      String ord = reOrden.toStringAsFixed(0);

      //formula punto de reorden
      double puntoReorden = ((demanda / diasTrabajados) * reOrden);
      String ptoReorden = puntoReorden.toStringAsFixed(0);

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

      //tiempo entre pedidos
      double tentrePedidos = ((cantidadOptima / demanda) * diasTrabajados);
      String t = tentrePedidos.toStringAsFixed(0);

      setState(() {
        mostrarCantidadOptima = 'Cantidad óptima de pedido: $r unidades';
        tiempoentrePedidos = 'El tiempo entre pedidos es de: $t días';
        mostrarNumOrdenes = 'Numero de ordenes esperado: $ordenes pedidos  ';
        tiempoReorden = "Tiempo de reorden: $ord días";
        campoPuntoReorden = "Punto de reorden: $ptoReorden unidades";

        costoOrden = "Costo total orden:  $tcostoOrden";
        costMantencion = "Costo total mantención: $tcostoMantener";
        costoTotal = "El costo total es de :  $tcostoTotal";
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
      String r = cantidadOptima.toStringAsFixed(0);

      double tentrePedidos = ((cantidadOptima / demanda) * 365);
      String t = tentrePedidos.toStringAsFixed(0);
      setState(() {
        mostrarCantidadOptima = 'Cantidad óptima de pedido: $r unidades';
        tiempoentrePedidos = 'El tiempo entre pedidos es de: $t días';
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
      campoPuntoReorden = "";
      costoOrden = "";
      costoTotal = "";
      costMantencion = "";
      tiempoentrePedidos = "";
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

//-------------------------------------
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
              size: 60,
            ),
            content: const Text("Ingrese valores númericos en las casillas."),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cerrar')),
            ],
          );
        });
  }

//parte visual
  @override
  Widget build(BuildContext context) {
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
          title: const Text('Calculadora EOQ'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
                //key: my_form_key,
                children: [
                  Row(
                    //parte visual de los campos de texto, a los cuales se les asignan los controladores declarados mas arriba
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "  Demanda (D): ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: TextFormField(
                          controller: controllerDemanda,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      const Text(
                        "Costo Orden (K): ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: TextFormField(
                          controller: controllerOrden,
                          keyboardType: TextInputType.phone,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Mantención (H): ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: controllerMantencion,
                              decoration: InputDecoration(
                                  fillColor: Colors.blueAccent.shade100),
                            ),
                          ),
                          const Text(
                            "Costo unitario (C): ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: controllerCostoUnitario,
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dias trabajados (anual): ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: controllerDias,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //codigo que incluye la inserción de los botones con sus respectivos colores
                  ElevatedButton.icon(
                    onPressed: operacionMatematica,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fixedSize: const Size(280, 45)),
                    label: const Text(
                      'Calcular',
                      style: TextStyle(fontSize: 20),
                    ),
                    icon: const Icon(Icons.calculate_outlined),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: limpiaCampos,
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        label: const Text(
                          'Limpiar',
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: const Icon(Icons.cleaning_services_outlined),
                      ),
                      const VerticalDivider(
                        width: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Alertas().displayDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fixedSize: const Size(150, 45)),
                        label: const Text(
                          'Fórmulario',
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: const Icon(Icons.class_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 700),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  ((context, animation, secondaryAnimation) {
                                return const GraphScreen(
                                  title: 'Gráfico',
                                );
                              })));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fixedSize: const Size(280, 45)),
                    label: const Text(
                      'Gráfico',
                      style: TextStyle(fontSize: 20),
                    ),
                    icon: const Icon(Icons.auto_graph_outlined),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[

                  //     TextButton(
                  //       onPressed: operacionMatematica,
                  //       style: TextButton.styleFrom(
                  //         foregroundColor: Colors.amber,
                  //         shape: const BeveledRectangleBorder(
                  //             borderRadius: BorderRadius.all(Radius.circular(5))),
                  //       ),
                  //       child: Column(
                  //         children: const <Widget>[
                  //           Icon(Icons.calculate_outlined),
                  //           Text('Calcular')
                  //         ],
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: limpiaCampos,
                  //       style: TextButton.styleFrom(
                  //         foregroundColor: const Color.fromARGB(255, 52, 28, 236),
                  //         shape: const BeveledRectangleBorder(
                  //             borderRadius: BorderRadius.all(Radius.circular(5))),
                  //       ),
                  //       child: Column(
                  //         children: const <Widget>[
                  //           Icon(Icons.cleaning_services_outlined),
                  //           Text('Limpiar')
                  //         ],
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: () {
                  //         Alertas().displayDialog(context);
                  //       },
                  //       style: TextButton.styleFrom(
                  //         foregroundColor: const Color.fromARGB(255, 255, 1, 1),
                  //         shape: const BeveledRectangleBorder(
                  //             borderRadius: BorderRadius.all(Radius.circular(5))),
                  //       ),
                  //       child: Column(
                  //         children: const <Widget>[
                  //           Icon(Icons.info_outline),
                  //           Text('Formulario')
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 5,
                  ),

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     shape: const StadiumBorder(),
                  //     elevation: 0,
                  //   ),
                  //   child: const SizedBox(
                  //     height: 50,
                  //     child: Center(child: Text('Ver Módelo')),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         PageRouteBuilder(
                  //             transitionDuration: const Duration(milliseconds: 700),
                  //             transitionsBuilder:
                  //                 (context, animation, secondaryAnimation, child) {
                  //               return FadeTransition(
                  //                 opacity: animation,
                  //                 child: child,
                  //               );
                  //             },
                  //             pageBuilder:
                  //                 ((context, animation, secondaryAnimation) {
                  //               return const GraphScreen(
                  //                 title: 'Gráfico',
                  //               );
                  //             })));
                  //   },
                  // ),
                  const SizedBox(
                    height: 5,
                  ),

                  //contenedores donde se insertan los resultados definidos en el metodo setState ubicado en la funcion
                  //donde estan las operaciones de cálculo
                  Container(
                    height: 50,
                    width: 450,
                    color: const Color.fromRGBO(28, 49, 108, 1),
                    // decoration: const ColoredBox(color: Color.fromARGB(255, 28, 49, 108)),

                    // const BoxDecoration(
                    //   gradient: LinearGradient(colors: [
                    //     Color.fromARGB(255, 230, 23, 23),
                    //     Color(0xFFfF7818)
                    //   ]),
                    // ),
                    child: Center(
                      child: Text(
                        //aquí se inserta el resultado del textformfield
                        mostrarCantidadOptima,
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 450,
                    color: const Color.fromRGBO(28, 49, 108, 1),
                    // decoration: const BoxDecoration(
                    //   gradient: LinearGradient(colors: [
                    //     Color.fromARGB(255, 230, 23, 23),
                    //     Color(0xFFfF7818)
                    //   ]),
                    // ),
                    child: Center(
                      child: Text(
                        //aquí se inserta el resultado del textformfield
                        tiempoentrePedidos,
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 50,
                    width: 450,
                    color: Color.fromRGBO(221, 16, 100, 1),
                    // decoration: const BoxDecoration(
                    //   gradient: LinearGradient(colors: [
                    //     Color.fromARGB(255, 28, 107, 255),
                    //     Color.fromARGB(255, 30, 203, 255)
                    //   ]),
                    // ),
                    child: Center(
                      child: Text(
                        mostrarNumOrdenes,
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 450,
                    color: Color.fromRGBO(221, 16, 100, 1),
                    // decoration: const BoxDecoration(
                    //   gradient: LinearGradient(colors: [
                    //     Color.fromARGB(255, 28, 107, 255),
                    //     Color.fromARGB(255, 30, 203, 255)
                    //   ]),
                    // ),
                    child: Center(
                      child: Text(
                        tiempoReorden,
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 450,
                    color: Color.fromRGBO(221, 16, 100, 1),
                    // decoration: const BoxDecoration(
                    //   gradient: LinearGradient(colors: [
                    //     Color.fromARGB(255, 28, 107, 255),
                    //     Color.fromARGB(255, 30, 203, 255)
                    //   ]),
                    // ),
                    child: Center(
                      child: Text(
                        campoPuntoReorden,
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: 450,
                    color: Color.fromRGBO(14, 224, 148, 1),
                    // decoration: const BoxDecoration(
                    //   gradient: LinearGradient(colors: [
                    //     Color.fromARGB(255, 0, 134, 9),
                    //     Color.fromARGB(255, 80, 255, 60)
                    //   ]),
                    // ),
                    child: Center(
                      child: Text(
                        costoOrden,
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 450,
                    color: Color.fromRGBO(14, 224, 148, 1),
                    // decoration: const BoxDecoration(
                    //   gradient: LinearGradient(colors: [
                    //     Color.fromARGB(255, 0, 134, 9),
                    //     Color.fromARGB(255, 80, 255, 60)
                    //   ]),
                    // ),
                    //creamos el resultado del textformfield
                    child: Center(
                      child: Text(
                        costMantencion,
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    width: 450,
                    color: Color.fromRGBO(14, 224, 148, 1),
                    // decoration: const BoxDecoration(
                    //   gradient: LinearGradient(colors: [
                    //     Color.fromARGB(255, 0, 134, 9),
                    //     Color.fromARGB(255, 80, 255, 60)
                    //   ]),
                    // ),
                    //creamos el resultado del textformfield
                    child: Center(
                      child: Text(
                        costoTotal,
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
