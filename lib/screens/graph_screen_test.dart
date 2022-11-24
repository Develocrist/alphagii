import 'dart:math';
import 'dart:typed_data';
import 'package:agii_alpha/screens/graph_screen.dart';
import 'package:agii_alpha/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:agii_alpha/screens/save_file_mobile.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:async';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

class GraphScreen2 extends StatefulWidget {
  const GraphScreen2({
    super.key,
    required this.dem,
    required this.ord,
    required this.man,
  });
  final String dem;
  final String ord;
  final String man;

  @override
  State<GraphScreen2> createState() => _GraphScreenState();
}

late GlobalKey<SfCartesianChartState> _cartesianChartKey;

class _GraphScreenState extends State<GraphScreen2> {
  late List<SalesData> _chartData;
  late List<SalesData2> _chartData2;
  late List<InventaryData> _inventaryData;
  late List<LeadTimeData> _leadTimeData;
  //late List<PuntoReordenData> _reOrdenData;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _cartesianChartKey = GlobalKey();
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
    return Scaffold(
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
                AlertaDescripcionGrafico().descripcionGrafico(context);
              },
              icon: const Icon(
                Icons.info,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                width: 350,
                height: 600,
                child: SfCartesianChart(
                  key: _cartesianChartKey,
                  onMarkerRender: (MarkerRenderArgs args) {
                    if (!(args.pointIndex == 1)) {
                      args.markerHeight = 0.0;
                      args.markerWidth = 0.0;
                    }
                  },
                  borderWidth: 0,
                  margin: const EdgeInsets.all(10),
                  primaryXAxis: NumericAxis(labelFormat: '{value} días'),
                  primaryYAxis: NumericAxis(labelFormat: '{value} uni'),

                  title: ChartTitle(text: 'Modelo EOQ Básico.'),
                  legend: Legend(
                      textStyle: const TextStyle(fontSize: 18),
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                      position: LegendPosition.bottom), //ver la leyenda
                  tooltipBehavior: _tooltipBehavior,
                  series: <ChartSeries>[
                    LineSeries<SalesData, double>(
                        width: 5,
                        color: Colors.blue,
                        name: 'Demanda', // nombre de la leyenda
                        dataSource: _chartData,
                        xValueMapper: (SalesData dias, _) => dias.dias,
                        yValueMapper: (SalesData unidades, _) =>
                            unidades.unidades,
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: false, showZeroValue: false),
                        enableTooltip: false,
                        markerSettings: const MarkerSettings(
                          height: 10,
                          width: 10,
                          isVisible: false,
                        )),
                    LineSeries<SalesData2, double>(
                        color: Colors.yellow,
                        width: 5,
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
                          height: 15,
                          width: 15,
                          isVisible: true,
                        )),
                    LineSeries<InventaryData, double>(
                        color: Colors.red,
                        width: 5,
                        name: 'Inventario Medio',
                        dataSource: _inventaryData,
                        xValueMapper: (InventaryData inventary, _) =>
                            inventary.inventary,
                        yValueMapper: (InventaryData inventary, _) =>
                            inventary.inventary2,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: false),
                        enableTooltip: true,
                        markerSettings: const MarkerSettings(
                          isVisible: true,
                          height: 15,
                          width: 15,
                        )),
                    LineSeries<LeadTimeData, double>(
                        width: 5,
                        color: Colors.green,
                        name: 'Tiempo entre pedidos',
                        dataSource: _leadTimeData,
                        xValueMapper: (LeadTimeData lead, _) => lead.diapedido,
                        yValueMapper: (LeadTimeData lead, _) => lead.diallegada,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: false),
                        enableTooltip: true,
                        markerSettings: const MarkerSettings(
                          height: 15,
                          width: 15,
                          isVisible: true,
                        ))
                  ],
                ),
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _renderChartAsImage();
                    },
                    child: const Text('Exportar Imagen')),
                ElevatedButton(
                    onPressed: () {
                      _renderPdf(context);
                    },
                    child: const Text('Exportar PDF')),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '\n Gráfico generado gracias al ingreso de los siguientes valores: \n ',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
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
                const SizedBox(
                  height: 20,
                )
                // const Text(
                //   'Días trabajados: \n 365 días',
                //   style: TextStyle(fontSize: 20),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _renderChartAsImage() async {
    final ui.Image data =
        await _cartesianChartKey.currentState!.toImage(pixelRatio: 3.0);
    final ByteData? bytes =
        await data.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List imageBytes =
        bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    await Navigator.of(context).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return Scaffold(body: Image.memory(imageBytes));
        },
      ),
    );
  }

  // Future<void> _renderChartAsImage() async {
  //   final ui.Image data =
  //     await _cartesianChartKey.currentState!.toImage(pixelRatio: 3.0);
  //   final ByteData? bytes =
  //     await data.toByteData(format: ui.ImageByteFormat.png);
  //   final Uint8List imageBytes =
  //     bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  //   await Navigator.of(context).push<dynamic>(
  //     MaterialPageRoute<dynamic>(
  //       builder: (BuildContext context) {
  //         return Scaffold(
  //           body: Image.memory(imageBytes)
  //         );
  //       },
  //     ),
  //   );
  // }

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

  // Future onSubmit() async {
  //   showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) => Center(
  //             child: CircularProgressIndicator.adaptive(),
  //           ));
  //   final image = await cartesianChartKey.currentState?.toImage();
  //   final imageGraph = await image!.toByteData(format: ui.ImageByteFormat.png);

  //   final file = await PdfApi.generatePDF(
  //     order: widget.ord,
  //     imageGraph: imageGraph!,
  //   );

  //   Navigator.of(context).pop();
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

Future<void> _renderPdf(context) async {
  final ui.Image data =
      await _cartesianChartKey.currentState!.toImage(pixelRatio: 3.0);
  final ByteData? bytes = await data.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List imageBytes =
      bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  final PdfBitmap bitmap = PdfBitmap(imageBytes);
  final PdfDocument document = PdfDocument();
  document.pageSettings.size =
      Size(bitmap.width.toDouble(), bitmap.height.toDouble());
  final PdfPage page = document.pages.add();
  final Size pageSize = page.getClientSize();
  page.graphics.drawImage(
      bitmap, Rect.fromLTWH(100, 100, pageSize.width, pageSize.height));
  await FileSaveHelper.saveAndLaunchFile(
      await document.save(), 'cartesian_chart.pdf');
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
    duration: Duration(milliseconds: 200),
    content: Text('Chart has been exported as PDF document.'),
  ));
}