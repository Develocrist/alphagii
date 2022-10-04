import 'dart:math';

import 'package:agii_alpha/screens/listview1_screen.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: MyCalculator(),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Calculadora EOQ"),
    //     elevation: 5,
    //     backgroundColor: Color.fromRGBO(8, 75, 129, 10),
    //   ),
    //   body: const Center(
    //     child: Text('CalculatorScreen'),
    //   ),
    // );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => Calculadora();
}

class Calculadora extends State<MyCalculator> {
  //dialogo de alerta para mostrar las formulas
  void displayDialog(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: const Text("Formulas"),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                    "Aquí se insertaran las formulas y las variables segun corresponda"),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cerrar'))
            ],
          );
        }); //builder es un codigo que regresa un widget
  }

  //controladores para despues asignarles un campo de texto
  final controllerDemanda = TextEditingController();
  final controllerOrden = TextEditingController();
  final controllerCostoUnitario = TextEditingController();
  final controllerMantencion = TextEditingController();
  final controllerDias = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String mostrarCantidadOptima = "";
  String mostrarNumOrdenes = "";
  String tiempoReorden = "";
  String campoPuntoReorden = "";

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
    if (isNumericUsing_tryParse(controllerDemanda.text) &&
        isNumericUsing_tryParse(controllerOrden.text) &&
        isNumericUsing_tryParse(controllerMantencion.text) &&
        isNumericUsing_tryParse(controllerCostoUnitario.text) &&
        isNumericUsing_tryParse(controllerDias.text)) {
      demanda = double.parse(controllerDemanda.text);
      orden = double.parse(controllerOrden.text);
      costoUnitario = double.parse(controllerCostoUnitario.text);
      costoMantencion = double.parse(controllerMantencion.text);
      diasTrabajados = double.parse(controllerDias.text);

      //formula cantidad optima
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
      String tcostoMantencion = totalCostoMantener.toStringAsFixed(0);

      double totalCostoTotal = (demanda * costoUnitario) +
          ((demanda / cantidadOptima) * orden) +
          ((cantidadOptima / 2) * costoMantencion);

      //falta el total costo mantención

      String tcostoTotal = totalCostoTotal.toStringAsFixed(0);

      //este setstate imprime los resultados en los containers (estos estan codificados mas abajo)
      setState(() {
        mostrarCantidadOptima = 'Cantidad optima de pedido: $r unidades';
        mostrarNumOrdenes = 'Numero de ordenes esperado: $ordenes ';
        tiempoReorden = "Tiempo de reorden: $ord días";
        campoPuntoReorden = "Punto de reorden: $ptoReorden unidades";

        costoOrden = "Costo total orden:  $tcostoOrden";
        //costoMantencion = "Costo total mantención: $tcostoMantencion";
        costoTotal = "El costo total es de :  $tcostoTotal";
      });
    } else {
      MostrarDialogo();
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
    });
  }

//------------------------------------------

// Comprobar si es numero
  bool isNumericUsing_tryParse(String string) {
    if (string == null || string.isEmpty) {
      return false;
    }
    final number = num.tryParse(string);
    if (number == null) {
      return false;
    }
    return true;
  }

//-------------------------------------
  void MostrarDialogo() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            iconColor: Colors.red,
            icon: Icon(Icons.error_outline_outlined),
            content: const Text("Ingrese valores numericos en las casillas."),
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
    final logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              final route = MaterialPageRoute(
                builder: (context) => const Listview1Screen(),
              );
              Navigator.push(context, route);
            }),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Color.fromRGBO(8, 75, 129, 10),
        title: const Text('Calculadora EOQ'),
      ),
      body: ListView(key: my_form_key, children: [
        Row(
          //parte visual de los campos de texto, a los cuales se les asignan los controladores declarados mas arriba
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(" Demanda (D): "),
            Container(
              width: 60,
              height: 50,
              child: TextFormField(
                controller: controllerDemanda,
                validator: (value) {
                  if (value!.isEmpty) return "Ingresa la demanda";
                },
                keyboardType: TextInputType.phone,
              ),
            ),
            const Text("Costo Orden (K): "),
            Container(
              width: 60,
              height: 50,
              child: TextFormField(
                controller: controllerOrden,
                validator: (value) {
                  if (value!.isEmpty) return "Ingresa el costo de orden";
                },
                keyboardType: TextInputType.phone,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Mantención (H): "),
            Container(
              width: 60,
              height: 50,
              child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controllerMantencion,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingresar costo de mantencion";
                    }
                  }),
            ),
            const Text("Costo unitario (C): "),
            Container(
              width: 60,
              height: 50,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: controllerCostoUnitario,
                validator: (value) {
                  if (value!.isEmpty) return "Ingresa el costo unitario";
                },
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dias trabajados (anual): "),
              Container(
                width: 60,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controllerDias,
                  validator: (value) {
                    if (value!.isEmpty) return "Ingresa la cantidad de dias";
                  },
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),

          //codigo que incluye la inserción de los botones con sus respectivos colores

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: operacionMatematica,
                style: TextButton.styleFrom(
                  primary: Colors.amber,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.calculate_outlined),
                    Text('Calcular')
                  ],
                ),
              ),
              TextButton(
                onPressed: limpiaCampos,
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(255, 52, 28, 236),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.cleaning_services_outlined),
                    Text('Limpiar')
                  ],
                ),
              ),
              TextButton(
                onPressed: () => displayDialog(context),
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 1, 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.info_outline),
                    Text('Formulas')
                  ],
                ),
              ),
            ],
          ),
        ),

        //contenedores donde se insertan los resultados definidos en el metodo setState ubicado en la funcion
        //donde estan las operaciones de cálculo
        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFE2E64), Color(0xFFfF7818)]),
          ),
          child: Center(
            child: Text(
              //aquí se inserta el resultado del textformfield
              mostrarCantidadOptima,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 28, 107, 255),
              Color.fromARGB(255, 30, 203, 255)
            ]),
          ),
          child: Center(
            child: Text(
              mostrarNumOrdenes,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 28, 107, 255),
              Color.fromARGB(255, 30, 203, 255)
            ]),
          ),
          child: Center(
            child: Text(
              tiempoReorden,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 28, 107, 255),
              Color.fromARGB(255, 30, 203, 255)
            ]),
          ),
          child: Center(
            child: Text(
              campoPuntoReorden,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 0, 134, 9),
              Color.fromARGB(255, 80, 255, 60)
            ]),
          ),
          child: Center(
            child: Text(
              costoOrden,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 0, 134, 9),
              Color.fromARGB(255, 80, 255, 60)
            ]),
          ),
          //creamos el resultado del textformfield
          child: Center(
            child: Text(
              costoTotal,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Container(
          height: 50,
          width: 30,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 0, 134, 9),
              Color.fromARGB(255, 80, 255, 60)
            ]),
          ),
          //creamos el resultado del textformfield
          child: Center(
            child: Text(
              costMantencion,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
