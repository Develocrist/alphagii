import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key, required this.title});
  final String title;

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late List<SalesData> _chartData;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gráficos"),
          elevation: 5,
          backgroundColor: const Color.fromRGBO(8, 75, 129, 10),
        ),
        body: SizedBox(
          height: 400,
          child: SfCartesianChart(
            title: ChartTitle(text: 'Gráfico Referencial'),
            legend: Legend(isVisible: true), //ver la leyenda
            tooltipBehavior: _tooltipBehavior,
            series: <ChartSeries>[
              LineSeries<SalesData, double>(
                  name: 'Sales', // nombre de la leyenda
                  dataSource: _chartData,
                  xValueMapper: (SalesData sales, _) => sales.dias,
                  yValueMapper: (SalesData sales, _) => sales.unidades,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true)
            ],
            primaryXAxis:
                NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
            // primaryYAxis: NumericAxis(
            //     numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
          ),
        ),
      ),
    );
  }

  //lista donde se asigna la fuente de los datos y añadir las series de lineas
  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(5, 10),
      SalesData(6, 50),
      SalesData(7, 60),
      SalesData(8, 30),
      SalesData(9, 20),
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.dias, this.unidades);
  final double dias;
  final double unidades;
}
