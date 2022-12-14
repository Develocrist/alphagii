import 'dart:math';

import 'package:agii_alpha/widgets/formula_alert.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({
    super.key,
    required this.dem,
    required this.ord,
    required this.man,
  });
  final String dem;
  final String ord;
  final String man;

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late List<SalesData> _chartData;
  late List<SalesData2> _chartData2;
  late List<InventaryData> _inventaryData;
  late List<LeadTimeData> _leadTimeData;
  //late List<PuntoReordenData> _reOrdenData;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _chartData2 = getChartData5();
    _inventaryData = getChartData2();
    _leadTimeData = getChartData3();
    //_reOrdenData = getChartData4();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // late double hola = widget.dato;
    // Text(widget.dato);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          elevation: 5,
          title: const Text('Gráfico'),
          backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
          actions: [
            IconButton(
                onPressed: () {
                  Alertas().descripcionGrafico(context);
                },
                icon: const Icon(Icons.info)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 350,
                  height: 600,
                  child: SfCartesianChart(
                    // annotations: <CartesianChartAnnotation>[
                    // CartesianChartAnnotation(
                    //     widget: const Text(
                    //       'Unidades',
                    //       textAlign: TextAlign.center,
                    //     ),
                    //     coordinateUnit: CoordinateUnit.point,
                    //     region: AnnotationRegion.chart,
                    //     x: 1,
                    //     y: demanda + 2),
                    // const CartesianChartAnnotation(
                    //     widget: Text('Días'),
                    //     coordinateUnit: CoordinateUnit.point,
                    //     region: AnnotationRegion.chart,
                    //     x: 23,
                    //     y: 1),
                    // ],
                    borderWidth: 0,
                    margin: const EdgeInsets.all(10),
                    primaryXAxis: NumericAxis(labelFormat: '{value} días'),
                    primaryYAxis: NumericAxis(labelFormat: '{value} uni'),

                    // primaryXAxis: CategoryAxis(
                    //     title: AxisTitle(
                    //         text: 'Tiempo (días)',
                    //         textStyle: const TextStyle(fontSize: 10))),
                    // primaryYAxis: CategoryAxis(
                    //     title: AxisTitle(
                    //         text: 'Stock (unidades)',
                    //         textStyle: const TextStyle(fontSize: 10))),
                    title: ChartTitle(text: 'Modelo EOQ Básico.'),
                    legend: Legend(
                        textStyle: const TextStyle(fontSize: 18),
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap,
                        position: LegendPosition.bottom), //ver la leyenda
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      LineSeries<SalesData, double>(
                          name: 'Demanda', // nombre de la leyenda
                          dataSource: _chartData,
                          xValueMapper: (SalesData dias, _) => dias.dias,
                          yValueMapper: (SalesData unidades, _) =>
                              unidades.unidades,
                          dataLabelSettings: const DataLabelSettings(
                              isVisible: false, showZeroValue: false),
                          enableTooltip: false,
                          markerSettings: const MarkerSettings(
                            isVisible: false,
                          )),
                      LineSeries<SalesData2, double>(
                          name:
                              'Cantidad óptima de pedido', // nombre de la leyenda
                          dataSource: _chartData2,
                          xValueMapper: (SalesData2 dias, _) => dias.dias,
                          yValueMapper: (SalesData2 unidades, _) =>
                              unidades.unidades,
                          dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                              showZeroValue: false,
                              labelAlignment: ChartDataLabelAlignment.top),
                          enableTooltip: true,
                          markerSettings: const MarkerSettings(
                            isVisible: true,
                          )),
                      LineSeries<InventaryData, double>(
                          name: 'Inventario Medio',
                          dataSource: _inventaryData,
                          xValueMapper: (InventaryData inventary, _) =>
                              inventary.inventary,
                          yValueMapper: (InventaryData inventary, _) =>
                              inventary.inventary2,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                          enableTooltip: true,
                          markerSettings:
                              const MarkerSettings(isVisible: true)),
                      LineSeries<LeadTimeData, double>(
                          name: 'Tiempo entre pedidos',
                          dataSource: _leadTimeData,
                          xValueMapper: (LeadTimeData lead, _) =>
                              lead.diapedido,
                          yValueMapper: (LeadTimeData lead, _) =>
                              lead.diallegada,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                          enableTooltip: true,
                          markerSettings: const MarkerSettings(
                            isVisible: true,
                          ))
                    ],

                    // primaryXAxis:
                    //     NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                    // primaryYAxis: NumericAxis(
                    //     numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
                  ),
                ),
              ),
              Column(
                children: [
                  const Divider(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Demanda ingresada: \n ${widget.dem} unidades.',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Costo de orden ingresado: \n ${widget.ord} CLP',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Costo de mantención anual ingresado: \n ${widget.man} CLP',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  // const Text(
                  //   'Días trabajados: \n 365 días',
                  //   style: TextStyle(fontSize: 20),
                  //   textAlign: TextAlign.center,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //lista donde se asigna la fuente de los datos y añadir las series de lineas
  //GRAFICO DE LA DEMANDA
  List<SalesData> getChartData() {
    double demanda = double.tryParse(widget.dem) ?? 0;
    double orden = double.tryParse(widget.ord) ?? 0;
    double mantencion = double.tryParse(widget.man) ?? 0;
    double cantidadOptima = sqrt((2 * demanda * orden) / mantencion);
    String cantOptim = cantidadOptima.toStringAsFixed(1);
    double co = double.parse(cantOptim);

    double numOrdenes = demanda / cantidadOptima;
    double reOrden = 365 / numOrdenes;
    String rorden = reOrden.toStringAsFixed(1);
    double ro = double.parse(rorden);

    final List<SalesData> chartData = [
      SalesData(0, co),
      SalesData(ro, 0),
      SalesData(ro, co),
      SalesData(ro * 2, 0),
      SalesData(ro * 2, co),
      SalesData(ro * 3, 0),
      // SalesData(ro * 3, co),
      // SalesData(ro * 4, 0),
      // SalesData(ro * 4, co),
      // SalesData(reOrden * 5, 0),
      // SalesData(reOrden * 5, cantidadOptima),
    ];
    return chartData;
  }

//_-------------------------------------------------------------------

  //lista donde se asigna la fuente de los datos y añadir las series de lineas
  //GRAFICO DE LA CANTIDAD OPTIMA
  List<SalesData2> getChartData5() {
    double demanda = double.tryParse(widget.dem) ?? 0;
    double orden = double.tryParse(widget.ord) ?? 0;
    double mantencion = double.tryParse(widget.man) ?? 0;
    double cantidadOptima = sqrt((2 * demanda * orden) / mantencion);
    String cantOptim = cantidadOptima.toStringAsFixed(1);
    double co = double.parse(cantOptim);

    double numOrdenes = demanda / cantidadOptima;
    double reOrden = 365 / numOrdenes;
    String rorden = reOrden.toStringAsFixed(1);
    double ro = double.parse(rorden);

    final List<SalesData2> chartData5 = [
      SalesData2(0, co),
      SalesData2(ro, co),
      SalesData2(ro * 2, co),
      SalesData2(ro * 3, co),
      // SalesData(ro * 3, co),
      // SalesData(ro * 4, 0),
      // SalesData(ro * 4, co),
      // SalesData(reOrden * 5, 0),
      // SalesData(reOrden * 5, cantidadOptima),
    ];
    return chartData5;
  }

//---------------------------------------------------------------------

//SEGUNDA LINEA GRÁFICA EN EL MISMO MAPEO
//GRAFICO DEL INVENTARIO MEDIO
  List<InventaryData> getChartData2() {
    double demanda = double.tryParse(widget.dem) ?? 0;
    double orden = double.tryParse(widget.ord) ?? 0;
    double mantencion = double.tryParse(widget.man) ?? 0;
    double cantidadOptima = sqrt((2 * demanda * orden) / mantencion);
    String cantOptim = cantidadOptima.toStringAsFixed(1);
    double co = double.parse(cantOptim);

    double numOrdenes = demanda / cantidadOptima;
    double reOrden = 365 / numOrdenes;
    String rorden = reOrden.toStringAsFixed(1);
    double ro = double.parse(rorden);

    final List<InventaryData> chartData2 = [
      InventaryData(0, co / 2),
      InventaryData(ro * 3, co / 2),
      // InventaryData(ro * 2, co / 2),
      // InventaryData(ro * 4, co / 2),
      // InventaryData(reOrden * 5, cantidadOptima / 2),
    ];
    return chartData2;
  }

// TERCERA LINEA GRAFICA EN EL MISMO MAPEO // CORRESPONDIENTE AL TIEMPO ENTRE PEDIDOS
//GRAFICO DEL tiempo entre pedidos
  List<LeadTimeData> getChartData3() {
    double demanda = double.tryParse(widget.dem) ?? 0;
    double orden = double.tryParse(widget.ord) ?? 0;
    double mantencion = double.tryParse(widget.man) ?? 0;
    double cantidadOptima = sqrt((2 * demanda * orden) / mantencion);
    double numOrdenes = demanda / cantidadOptima;
    double reOrden = 365 / numOrdenes;
    String rorden = reOrden.toStringAsFixed(1);
    double ro = double.parse(rorden);

    final List<LeadTimeData> chartData3 = [
      LeadTimeData(0, 0),
      LeadTimeData(ro, 0),

      // LeadTimeData(10, 15),
      // LeadTimeData(20, 25),
    ];
    return chartData3;
  }

  // CUARTA LINEA GRAFICA EN EL MISMO MAPEO // CORRESPONDIENTE AL PUNTO DE REORDEN
  // List<PuntoReordenData> getChartData4() {
  //   double demanda = double.tryParse(widget.dem) ?? 0;
  //   double orden = double.tryParse(widget.ord) ?? 0;
  //   double mantencion = double.tryParse(widget.man) ?? 0;
  //   double cantidadOptima = sqrt((2 * demanda * orden) / mantencion);
  //   double numOrdenes = demanda / cantidadOptima;
  //   double reOrden = 365 / numOrdenes;
  //   String rorden = reOrden.toStringAsFixed(1);
  //   double ro = double.parse(rorden);

  //   final List<LeadTimeData> chartData3 = [
  //     LeadTimeData(0, 0),
  //     LeadTimeData(ro, 0),

  //     // LeadTimeData(10, 15),
  //     // LeadTimeData(20, 25),
  //   ];
  //   return ;
  // }
}

class SalesData {
  SalesData(this.dias, this.unidades);
  final double dias;
  final double unidades;
}

class SalesData2 {
  SalesData2(this.dias, this.unidades);
  final double dias;
  final double unidades;
}

//CLASE CREADA PARA LA SEGUNDA LINEA GRÁFICA, CORRESPONDIENTE AL INVENTARIO MEDIO
class InventaryData {
  InventaryData(this.inventary, this.inventary2);
  final double inventary;
  final double inventary2;
}

//CLASE CREADA PARA LA TERCERA LINEA GRAFICA, CORRESPONDIENTE AL LEAD TIME
class LeadTimeData {
  LeadTimeData(this.diapedido, this.diallegada);
  final double diapedido;
  final double diallegada;
}

//CLASE CREADA PARA LA CUARTA LINEA GRAFICA, CORRESPONDIENTE AL PUNTO DE REORDEN
class PuntoReordenData {
  PuntoReordenData(this.punto1, this.punto2);
  final double punto1;
  final double punto2;
}


// void mostrarDialogo(BuildContext context) {
//   showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Error de Ingreso"),
//           iconColor: Colors.red,
//           icon: const Icon(
//             Icons.error_outline_outlined,
//             size: 50,
//           ),
//           content: const Text(
//             "Ingrese valores númericos en al menos las siguientes casillas: Demanda, Costo orden, Mantención.",
//             textAlign: TextAlign.center,
//           ),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           actions: <Widget>[
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text("Entendido.")),
//           ],
//         );
//       });
// }
