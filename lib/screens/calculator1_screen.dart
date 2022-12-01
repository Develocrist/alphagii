import 'dart:math';
import 'package:agii_alpha/screens/graph_screen.dart';
// import 'package:agii_alpha/screens/graph_screen_test.dart';
import 'package:agii_alpha/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      AlertaErrorIngreso().mostrarDialogo(context);
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

//-------------------------------------------------

//parte visual
  @override
  Widget build(BuildContext context) {
    ScrollController controladorScroll = ScrollController();
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              centerTitle: true,
              elevation: 5,
              backgroundColor: const Color.fromRGBO(2, 102, 255, 1),
              title: const Text(
                'Modelo EOQ',
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      AlertaDescripcionCalculadora()
                          .descripcionCalculadora(context);
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
                        'Variables:',
                        style: TextStyle(fontSize: 18, fontFamily: 'MuseoSans'),
                      ),
                      const SizedBox(
                        height: 15,
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
                                    color: Color.fromRGBO(76, 134, 255, 1),
                                  ),
                                ),
                                labelText: '(D) Demanda:',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 150,
                            height: 70,
                            child: TextFormField(
                              controller: controllerOrden,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]')),
                                LengthLimitingTextInputFormatter(8),
                              ],
                              decoration: const InputDecoration(
                                  prefix: Text('\$ '),
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 1),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(76, 134, 255, 1),
                                    ),
                                  ),
                                  labelText: ' (K) Costo orden:'),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: controllerMantencion,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')),
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                    prefix: Text('\$ '),
                                    contentPadding:
                                        EdgeInsets.only(left: 10, bottom: 1),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 134, 255, 1),
                                      ),
                                    ),
                                    labelText: '(H) Mantención:'),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            // const VerticalDivider(),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: controllerCostoUnitario,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')),
                                  LengthLimitingTextInputFormatter(8),
                                ],
                                decoration: const InputDecoration(
                                    prefix: Text('\$ '),
                                    contentPadding:
                                        EdgeInsets.only(left: 10, bottom: 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                76, 134, 255, 1))),
                                    labelText: '(C) Costo unitario:'),
                              ),
                            )
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: SizedBox(
                              width: 280,
                              height: 50,
                              child: TextFormField(
                                //readOnly: !blFlag,
                                keyboardType: TextInputType.phone,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[1-9]')),
                                  //FilteringTextInputFormatter.digitsOnly,

                                  LengthLimitingTextInputFormatter(1),
                                ],
                                controller: controllerLead,

                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 1),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(76, 134, 255, 1))),
                                  labelText:
                                      '(L) Tiempo de espera del proveedor:',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              width: 280,
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
                                          color:
                                              Color.fromRGBO(76, 134, 255, 1))),
                                  labelText: 'Días trabajados al año:',
                                ),
                              ),
                            ),
                          ),
                          const VerticalDivider(),
                        ],
                      ),

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
                            backgroundColor:
                                const Color.fromRGBO(2, 102, 255, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fixedSize: const Size(320, 50)),
                        label: const Text(
                          'Calcular',
                          style:
                              TextStyle(fontSize: 18, fontFamily: 'MuseoSans'),
                        ),
                        icon: const Icon(Icons.calculate_outlined),
                      ),
                      const SizedBox(
                        height: 10,
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
                                color: Color.fromRGBO(2, 102, 255, 1),
                              ),
                              fixedSize: const Size(140, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            label: const Text(
                              'Limpiar',
                              style: TextStyle(
                                fontFamily: 'MuseoSans',
                                fontSize: 18,
                                color: Color.fromRGBO(2, 102, 255, 1),
                              ),
                            ),
                            icon: const Icon(
                              Icons.cleaning_services_outlined,
                              color: Color.fromRGBO(2, 102, 255, 1),
                            ),
                          ),
                          const VerticalDivider(
                            width: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              AlertaFormulario().infoFormulas(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(2, 102, 255, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                fixedSize: const Size(170, 50)),
                            label: const Text(
                              'Formulario',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'MuseoSans',
                              ),
                            ),
                            icon: const Icon(Icons.class_outlined),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
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
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(2, 102, 255, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                fixedSize: const Size(250, 50)),
                            label: const Text(
                              'Gráfico',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'MuseoSans',
                              ),
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
                                  2, 102, 255, 1), // <-- Button color
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 400,
                          width: 400,
                          padding: const EdgeInsets.only(top: 10),
                          color: const Color.fromRGBO(76, 134, 255, 1),
                          child: SingleChildScrollView(
                            child: Text(
                              //aquí se inserta el resultado del textformfield
                              '$mostrarCantidadOptima \n $tiempoentrePedidos \n $campoPuntoReorden \n $mostrarNumOrdenes  \n $costoOrden \n $costMantencion \n $costoTotal',
                              style: const TextStyle(
                                  fontFamily: 'MuseoSans',
                                  fontSize: 18.0,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
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
      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              centerTitle: true,
              elevation: 5,
              backgroundColor: const Color.fromRGBO(2, 102, 255, 1),
              title: const Text(
                'Modelo EOQ',
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      AlertaDescripcionCalculadora()
                          .descripcionCalculadora(context);
                    },
                    icon: const Icon(Icons.info)),
              ],
            ),
            body: MediaQuery.of(context).orientation == Orientation.portrait
                ? GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: SingleChildScrollView(
                      child: Column(
                          //key: my_form_key,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Variables:',
                              style: TextStyle(fontSize: 24),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              //parte visual de los campos de texto, a los cuales se les asignan los controladores declarados mas arriba
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 300,
                                  height: 70,
                                  child: TextFormField(
                                    minLines: null,
                                    maxLines: null,
                                    expands: true,
                                    controller: controllerDemanda,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(8),
                                    ],
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 20, bottom: 1),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Color.fromRGBO(8, 75, 129, 10),
                                        )),
                                        labelText: '(D) Demanda:'),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ),
                                const VerticalDivider(),
                                SizedBox(
                                  width: 300,
                                  height: 70,
                                  child: TextFormField(
                                    minLines: null,
                                    maxLines: null,
                                    expands: true,
                                    controller: controllerOrden,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]')),
                                      LengthLimitingTextInputFormatter(8),
                                    ],
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 20, bottom: 1),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    8, 75, 129, 10))),
                                        labelText: ' (K) \$ Costo orden:'),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 300,
                                    height: 70,
                                    child: TextFormField(
                                      minLines: null,
                                      maxLines: null,
                                      expands: true,
                                      keyboardType: TextInputType.phone,
                                      controller: controllerMantencion,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]')),
                                        LengthLimitingTextInputFormatter(8),
                                      ],
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 20, bottom: 1),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      8, 75, 129, 10))),
                                          labelText: '(H) \$ Mantención:'),
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  // const VerticalDivider(),
                                  SizedBox(
                                    width: 300,
                                    height: 70,
                                    child: TextFormField(
                                      minLines: null,
                                      maxLines: null,
                                      expands: true,
                                      keyboardType: TextInputType.phone,
                                      controller: controllerCostoUnitario,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]')),
                                        LengthLimitingTextInputFormatter(8),
                                      ],
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 20, bottom: 1),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      8, 75, 129, 10))),
                                          labelText: '(C) \$ Costo unitario:'),
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  )
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: SizedBox(
                                    width: 500,
                                    height: 70,
                                    child: TextFormField(
                                      minLines: null,
                                      maxLines: null,
                                      expands: true,
                                      style: const TextStyle(fontSize: 24),
                                      //readOnly: !blFlag,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[1-9]')),
                                        //FilteringTextInputFormatter.digitsOnly,

                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                      controller: controllerLead,

                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 20, bottom: 1),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    8, 75, 129, 10))),
                                        labelText:
                                            '(L) Tiempo de espera del proveedor (días):',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: SizedBox(
                                    width: 400,
                                    height: 70,
                                    child: TextFormField(
                                      minLines: null,
                                      maxLines: null,
                                      expands: true,
                                      style: const TextStyle(fontSize: 24),
                                      //readOnly: !cbFlag,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                      controller: controllerDias,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 20, bottom: 1),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    8, 75, 129, 10))),
                                        labelText: 'Días trabajados al año:',
                                      ),
                                    ),
                                  ),
                                ),
                                const VerticalDivider(),
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            //codigo que incluye la inserción de los botones con sus respectivos colores
                            ElevatedButton.icon(
                              onPressed: () {
                                operacionMatematica();
                                // controladorScroll.animateTo(
                                //     controladorScroll.position.maxScrollExtent,
                                //     duration: const Duration(milliseconds: 700),
                                //     curve: Curves.easeInOut);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(8, 75, 129, 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  fixedSize: const Size(300, 50)),
                              label: const Text(
                                'Calcular',
                                style: TextStyle(fontSize: 18),
                              ),
                              icon: const Icon(Icons.calculate_outlined),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    limpiaCampos();
                                    // controladorScroll.animateTo(
                                    //     controladorScroll
                                    //         .position.minScrollExtent,
                                    //     duration:
                                    //         const Duration(milliseconds: 700),
                                    //     curve: Curves.easeInOut);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shadowColor:
                                          Colors.transparent.withOpacity(0.1),
                                      side: const BorderSide(
                                        width: 2,
                                        color: Color.fromRGBO(8, 75, 129, 1),
                                      ),
                                      fixedSize: const Size(150, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  label: const Text(
                                    'Limpiar',
                                    style: TextStyle(
                                        fontSize: 18,
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
                                    AlertaFormulario().infoFormulas(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(8, 75, 129, 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      fixedSize: const Size(170, 50)),
                                  label: const Text(
                                    'Fórmulario',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  icon: const Icon(Icons.class_outlined),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
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
                                                    man: controllerMantencion
                                                        .text,
                                                  ))),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(8, 75, 129, 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      fixedSize: const Size(250, 50)),
                                  label: const Text(
                                    'Gráfico',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  icon: const Icon(Icons.auto_graph_outlined),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            //contenedores donde se insertan los resultados definidos en el metodo setState ubicado en la funcion
                            //donde estan las operaciones de cálculo
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 450,
                                width: 500,
                                padding: const EdgeInsets.only(top: 10),
                                color: const Color.fromRGBO(28, 49, 108, 1),
                                child: SingleChildScrollView(
                                  child: Text(
                                    //aquí se inserta el resultado del textformfield
                                    '$mostrarCantidadOptima \n \n $tiempoentrePedidos \n \n $campoPuntoReorden \n \n $mostrarNumOrdenes  \n \n $costoOrden \n \n $costMantencion \n \n $costoTotal',
                                    style: const TextStyle(
                                        fontFamily: 'MuseoSans',
                                        fontSize: 24.0,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 5,
                            ),
                          ]),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: SingleChildScrollView(
                      controller: controladorScroll,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                              //key: my_form_key,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Variables:',
                                  style: TextStyle(fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  //parte visual de los campos de texto, a los cuales se les asignan los controladores declarados mas arriba
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      height: 70,
                                      child: TextFormField(
                                        minLines: null,
                                        maxLines: null,
                                        expands: true,
                                        style: const TextStyle(fontSize: 24),
                                        controller: controllerDemanda,
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(8),
                                        ],
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 20, bottom: 1),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  8, 75, 129, 10),
                                            )),
                                            labelText: '(D) Demanda :'),
                                      ),
                                    ),
                                    const VerticalDivider(),
                                    SizedBox(
                                      width: 250,
                                      height: 70,
                                      child: TextFormField(
                                        minLines: null,
                                        maxLines: null,
                                        expands: true,
                                        style: const TextStyle(fontSize: 24),
                                        controller: controllerOrden,
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]')),
                                          LengthLimitingTextInputFormatter(8),
                                        ],
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 20, bottom: 1),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        8, 75, 129, 10))),
                                            labelText: ' (K) Costo orden \$:'),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        height: 70,
                                        child: TextFormField(
                                          minLines: null,
                                          maxLines: null,
                                          expands: true,
                                          style: const TextStyle(fontSize: 24),
                                          keyboardType: TextInputType.phone,
                                          controller: controllerMantencion,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]')),
                                            LengthLimitingTextInputFormatter(8),
                                          ],
                                          decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 20, bottom: 1),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          8, 75, 129, 10))),
                                              labelText: '(H) \$ Mantención:'),
                                        ),
                                      ),
                                      const VerticalDivider(),
                                      SizedBox(
                                        width: 250,
                                        height: 70,
                                        child: TextFormField(
                                          minLines: null,
                                          maxLines: null,
                                          expands: true,
                                          style: const TextStyle(fontSize: 24),
                                          keyboardType: TextInputType.phone,
                                          controller: controllerCostoUnitario,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]')),
                                            LengthLimitingTextInputFormatter(8),
                                          ],
                                          decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 20, bottom: 1),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          8, 75, 129, 10))),
                                              labelText:
                                                  '(C) Costo unitario \$:'),
                                        ),
                                      )
                                    ]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: SizedBox(
                                        width: 400,
                                        height: 70,
                                        child: TextFormField(
                                          minLines: null,
                                          maxLines: null,
                                          expands: true,
                                          style: const TextStyle(fontSize: 24),
                                          //readOnly: !blFlag,
                                          keyboardType: TextInputType.phone,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[1-9]')),
                                            //FilteringTextInputFormatter.digitsOnly,

                                            LengthLimitingTextInputFormatter(1),
                                          ],
                                          controller: controllerLead,

                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 20, bottom: 1),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        8, 75, 129, 10))),
                                            labelText:
                                                '(L) Tiempo de espera del proveedor (días):',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: SizedBox(
                                        width: 300,
                                        height: 70,
                                        child: TextFormField(
                                          minLines: null,
                                          maxLines: null,
                                          expands: true,
                                          style: const TextStyle(fontSize: 24),
                                          //readOnly: !cbFlag,
                                          keyboardType: TextInputType.phone,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(3),
                                          ],
                                          controller: controllerDias,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 20, bottom: 1),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        8, 75, 129, 10))),
                                            labelText:
                                                'Días trabajados al año:',
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
                                  ],
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                //codigo que incluye la inserción de los botones con sus respectivos colores
                                ElevatedButton.icon(
                                  onPressed: () {
                                    operacionMatematica();
                                    controladorScroll.animateTo(
                                        controladorScroll
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 700),
                                        curve: Curves.easeInOut);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(8, 75, 129, 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      fixedSize: const Size(300, 50)),
                                  label: const Text(
                                    'Calcular',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  icon: const Icon(Icons.calculate_outlined),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        limpiaCampos();
                                        controladorScroll.animateTo(
                                            controladorScroll
                                                .position.minScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 700),
                                            curve: Curves.easeInOut);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shadowColor: Colors.transparent
                                              .withOpacity(0.1),
                                          side: const BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(8, 75, 129, 1),
                                          ),
                                          fixedSize: const Size(150, 50),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      label: const Text(
                                        'Limpiar',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                Color.fromRGBO(8, 75, 129, 1)),
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
                                        AlertaFormulario()
                                            .infoFormulas(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              8, 75, 129, 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fixedSize: const Size(170, 50)),
                                      label: const Text(
                                        'Formulario',
                                        style: TextStyle(
                                            fontFamily: 'MuseoSans',
                                            fontSize: 18),
                                      ),
                                      icon: const Icon(Icons.class_outlined),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
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
                                                  builder: (context) =>
                                                      GraphScreen(
                                                        dem: controllerDemanda
                                                            .text,
                                                        ord: controllerOrden
                                                            .text,
                                                        man:
                                                            controllerMantencion
                                                                .text,
                                                      ))),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              8, 75, 129, 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          fixedSize: const Size(250, 50)),
                                      label: const Text(
                                        'Gráfico',
                                        style: TextStyle(
                                            fontFamily: 'MuseoSans',
                                            fontSize: 18),
                                      ),
                                      icon:
                                          const Icon(Icons.auto_graph_outlined),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: 20,
                                ),

                                const SizedBox(
                                  height: 5,
                                ),
                              ]),
                          const SizedBox(
                            width: 50,
                          ),
                          const VerticalDivider(
                            width: 30,
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          //contenedores donde se insertan los resultados definidos en el metodo setState ubicado en la funcion
                          //donde estan las operaciones de cálculo

                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 650,
                              width: 500,
                              padding: const EdgeInsets.only(top: 20),
                              color: const Color.fromRGBO(8, 75, 129, 1),
                              child: SingleChildScrollView(
                                child: Text(
                                  //aquí se inserta el resultado del textformfield
                                  '$mostrarCantidadOptima \n \n $tiempoentrePedidos \n \n $campoPuntoReorden \n \n $mostrarNumOrdenes \n \n $costoOrden \n \n $costMantencion \n \n $costoTotal',
                                  style: const TextStyle(
                                      fontFamily: 'MuseoSans',
                                      fontSize: 26,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
      }

      return Container(
        width: 200,
        height: 200,
        color: Colors.purple,
      );
    });
  }
}
