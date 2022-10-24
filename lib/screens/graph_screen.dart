import 'dart:math';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen(
      {super.key, required this.dem, required this.ord, required this.man});
  final String dem;
  final String ord;
  final String man;

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late List<SalesData> _chartData;
  late List<InventaryData> _inventaryData;
  late List<LeadTimeData> _leadTimeData;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _inventaryData = getChartData2();
    _leadTimeData = getChartData3();
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
          title: const Text('Modelo gráfico EOQ'),
          backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 320,
                  height: 400,
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

                    // primaryXAxis: CategoryAxis(
                    //     title: AxisTitle(
                    //         text: 'Tiempo (días)',
                    //         textStyle: const TextStyle(fontSize: 10))),
                    // primaryYAxis: CategoryAxis(
                    //     title: AxisTitle(
                    //         text: 'Stock (unidades)',
                    //         textStyle: const TextStyle(fontSize: 10))),
                    title: ChartTitle(text: 'Gráfico.'),
                    legend: Legend(
                        isVisible: true,
                        position: LegendPosition.bottom), //ver la leyenda
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      LineSeries<SalesData, double>(
                          name: 'Cantidad optima', // nombre de la leyenda
                          dataSource: _chartData,
                          xValueMapper: (SalesData dias, _) => dias.dias,
                          yValueMapper: (SalesData unidades, _) =>
                              unidades.unidades,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                          enableTooltip: true),
                      LineSeries<InventaryData, double>(
                          name: 'Inventario Medio',
                          dataSource: _inventaryData,
                          xValueMapper: (InventaryData inventary, _) =>
                              inventary.inventary,
                          yValueMapper: (InventaryData inventary, _) =>
                              inventary.inventary2,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                          enableTooltip: true),
                      LineSeries<LeadTimeData, int>(
                          name: 'Lead Time',
                          dataSource: _leadTimeData,
                          xValueMapper: (LeadTimeData lead, _) =>
                              lead.diapedido,
                          yValueMapper: (LeadTimeData lead, _) =>
                              lead.diallegada,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                          enableTooltip: true)
                    ],

                    // primaryXAxis:
                    //     NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                    // primaryYAxis: NumericAxis(
                    //     numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
                  ),
                ),
              ),
              Text('La demanda ingresada fue de: ${widget.dem}'),
              Text('La orden ingresada fue de: ${widget.ord}'),
              Text('La mantención ingresada fue de: ${widget.man}'),
            ],
          ),
        ),
      ),
    );
  }

  //lista donde se asigna la fuente de los datos y añadir las series de lineas
  List<SalesData> getChartData() {
    double demanda = double.tryParse(widget.dem) ?? 0;
    double orden = double.tryParse(widget.ord) ?? 0;
    double mantencion = double.tryParse(widget.man) ?? 0;
    double cantidadOptima = sqrt((2 * demanda * orden) / mantencion);

    final List<SalesData> chartData = [
      SalesData(0, cantidadOptima),
      SalesData(5, 0),
      SalesData(5, cantidadOptima),
      SalesData(10, 0),
      SalesData(10, cantidadOptima),
      SalesData(15, 0),
      SalesData(15, cantidadOptima),
      SalesData(20, 0),
      SalesData(20, cantidadOptima),
      SalesData(25, 0),
      SalesData(25, cantidadOptima),
    ];
    return chartData;
  }

//SEGUNDA LINEA GRÁFICA EN EL MISMO MAPEO
  List<InventaryData> getChartData2() {
    double demanda = double.tryParse(widget.dem) ?? 0;
    double orden = double.tryParse(widget.ord) ?? 0;
    double mantencion = double.tryParse(widget.man) ?? 0;
    double cantidadOptima = sqrt((2 * demanda * orden) / mantencion);

    final List<InventaryData> chartData2 = [
      InventaryData(0, cantidadOptima / 2),
      InventaryData(5, cantidadOptima / 2),
      InventaryData(10, cantidadOptima / 2),
      InventaryData(15, cantidadOptima / 2),
      InventaryData(20, cantidadOptima / 2),
      InventaryData(25, cantidadOptima / 2),
    ];
    return chartData2;
  }

// TERCERA LINEA GRAFICA EN EL MISMO MAPEO
  List<LeadTimeData> getChartData3() {
    final List<LeadTimeData> chartData3 = [
      LeadTimeData(0, 0),
      LeadTimeData(5, 0),

      // LeadTimeData(10, 15),
      // LeadTimeData(20, 25),
    ];
    return chartData3;
  }
}

class SalesData {
  SalesData(this.dias, this.unidades);
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
  final int diapedido;
  final int diallegada;
}
