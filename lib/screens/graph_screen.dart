import 'dart:math';
import 'package:agii_alpha/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:async';
import 'dart:ui' as ui;

//ARCHIVO CORRESPONDIENTE AL GRÁFICO, DONDE RECIBE LOS VALORES Y COMO LOS GRÁFICA
class GraphScreen extends StatefulWidget {
  // LAS VARIABLES DEM, ORD Y MAN, VIENEN DE CALCULATOR1_SCREEN.DART
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
  late GlobalKey<SfCartesianChartState> _cartesianChartKey;

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

  //-------------------------------------------

  //---------------------------------------------
//LO MISMO QUE OTROS ARCHIVOS, SE INICIA CON LA INSTRUCCION
//ASOCIADA A LA RESPONSIVIDAD, EN ESTE CASO DEL GRÁFICO.
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
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
              title: const Text(
                'Gráfico',
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                ),
              ),
              backgroundColor: const Color.fromRGBO(2, 102, 255, 1),
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
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Importante:',
                    style: TextStyle(
                        fontFamily: 'MuseoSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  const Text(
                    'El gráfico generado utiliza como base los 365 días trabajados.',
                    style: TextStyle(fontFamily: 'MuseoSans', fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    // color: Colors.red,
                    width: 350,
                    height: 570,
                    //ACA ABAJO SE DECLARA EL GRÁFICO, DE TIPO SFCARTESIANCHART
                    child: SfCartesianChart(
                      key: _cartesianChartKey,
                      onMarkerRender: (MarkerRenderArgs args) {
                        //esta instruccion es para destacar solo un marcador visual de cada gráfico generado
                        if (!(args.pointIndex == 1)) {
                          args.markerHeight = 0.0;
                          args.markerWidth = 0.0;
                        }
                      },
                      borderWidth: 0,
                      margin: const EdgeInsets.all(10),
                      primaryXAxis: NumericAxis(labelFormat: '{value} días'),
                      primaryYAxis: NumericAxis(labelFormat: '{value} uni'),
                      //AQUI COMIENZA A DIBUJARSE EL GRÁFICO, COMENZANDO POR EL TITULO
                      title: ChartTitle(
                          text: 'Modelo EOQ Básico.',
                          textStyle: const TextStyle(
                            fontFamily: 'MuseoSans',
                          )),
                      legend: Legend(
                          textStyle: const TextStyle(fontSize: 16),
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap,
                          position: LegendPosition.bottom), //ver la leyenda
                      tooltipBehavior: _tooltipBehavior,
                      //DESDE AQUÍ HACIA ABAJO SE SEÑALA EL TIPO DE GRÁFICO, LA FUENTE DE LOS
                      //DATOS Y OTRAS COSAS COMO ANCHO DE LA LINEA, SU COLOR, SU NOMBRE Y OTROS AJUSTES ADICIONALES
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
                            height: 20,
                            width: 20,
                            isVisible: false,
                          ),
                        ),
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
                              isVisible: false,
                              showZeroValue: false,
                              labelAlignment: ChartDataLabelAlignment.top),
                          enableTooltip: true,
                          markerSettings: const MarkerSettings(
                            height: 20,
                            width: 20,
                            isVisible: true,
                          ),
                        ),
                        LineSeries<InventaryData, double>(
                          color: Colors.red,
                          width: 5,
                          name: 'Inventario medio',
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
                            height: 20,
                            width: 20,
                          ),
                        ),
                        LineSeries<LeadTimeData, double>(
                          width: 10,
                          color: Colors.green,
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
                            height: 20,
                            width: 20,
                            isVisible: true,
                          ),
                        ),
                      ],
                    ),
                    //AQUI SE TERMINA EL GRÁFICO Y MAS ABAJO VIENEN OTRAS OPCIONES COMO
                    //EL BOTON DE CONVERTIR EL GRAFICO A IMAGEN, DATOS ADICIONALES
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              _renderChartAsImage();
                            },
                            child: const Icon(Icons.camera_alt),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Capturar gráfico',
                            style: TextStyle(
                                fontFamily: 'MuseoSans', fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '\n Gráfico generado por el ingreso de los siguientes valores: \n ',
                        style: TextStyle(fontFamily: 'MuseoSans', fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Demanda ingresada: \n ${widget.dem} unidades.',
                        style: const TextStyle(
                            fontFamily: 'MuseoSans', fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Costo de orden ingresado: \n ${widget.ord} CLP',
                        style: const TextStyle(
                            fontFamily: 'MuseoSans', fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Costo de mantención anual ingresado: \n ${widget.man} CLP',
                        style: const TextStyle(
                            fontFamily: 'MuseoSans', fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
      //PARTE RESPONSIVA PERO HACIA LOS TABLETS
      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
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
              title: const Text(
                'Gráfico',
                style: TextStyle(
                  fontFamily: 'MuseoSans',
                ),
              ),
              backgroundColor: const Color.fromRGBO(2, 102, 255, 1),
              actions: [
                IconButton(
                    onPressed: () {
                      AlertaDescripcionGrafico().descripcionGrafico(context);
                    },
                    icon: const Icon(Icons.info)),
              ],
            ),
            body: MediaQuery.of(context).orientation == Orientation.portrait
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Importante:',
                          style: TextStyle(
                              fontFamily: 'MuseoSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        const Text(
                          'El gráfico generado utiliza como base los 365 días trabajados.',
                          style:
                              TextStyle(fontFamily: 'MuseoSans', fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            width: 550,
                            height: 700,
                            child: SfCartesianChart(
                              onMarkerRender: (MarkerRenderArgs args) {
                                if (!(args.pointIndex == 1)) {
                                  args.markerHeight = 0.0;
                                  args.markerWidth = 0.0;
                                }
                              },
                              borderWidth: 0,
                              margin: const EdgeInsets.all(10),
                              primaryXAxis: NumericAxis(
                                  labelFormat: '{value} días',
                                  labelStyle: const TextStyle(fontSize: 14)),
                              primaryYAxis: NumericAxis(
                                  labelFormat: '{value} uni',
                                  labelStyle: const TextStyle(fontSize: 14)),

                              title: ChartTitle(
                                  text: 'Modelo EOQ Básico.',
                                  textStyle: const TextStyle(
                                      fontFamily: 'MuseoSans', fontSize: 24)),

                              legend: Legend(
                                  textStyle: const TextStyle(fontSize: 24),
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position:
                                      LegendPosition.bottom), //ver la leyenda
                              tooltipBehavior: _tooltipBehavior,
                              series: <ChartSeries>[
                                LineSeries<SalesData, double>(
                                    color: Colors.blue,
                                    width: 5,
                                    name: 'Demanda', // nombre de la leyenda
                                    dataSource: _chartData,
                                    xValueMapper: (SalesData dias, _) =>
                                        dias.dias,
                                    yValueMapper: (SalesData unidades, _) =>
                                        unidades.unidades,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false, showZeroValue: false),
                                    enableTooltip: false,
                                    markerSettings: const MarkerSettings(
                                      height: 20,
                                      width: 20,
                                      isVisible: false,
                                    )),
                                LineSeries<SalesData2, double>(
                                    color: Colors.yellow,
                                    width: 5,
                                    name:
                                        'Cantidad óptima de pedido', // nombre de la leyenda
                                    dataSource: _chartData2,
                                    xValueMapper: (SalesData2 dias, _) =>
                                        dias.dias,
                                    yValueMapper: (SalesData2 unidades, _) =>
                                        unidades.unidades,
                                    dataLabelSettings: const DataLabelSettings(
                                        textStyle: TextStyle(fontSize: 18),
                                        isVisible: true,
                                        showZeroValue: false,
                                        labelAlignment:
                                            ChartDataLabelAlignment.top),
                                    enableTooltip: true,
                                    markerSettings: const MarkerSettings(
                                      height: 20,
                                      width: 20,
                                      isVisible: true,
                                    )),
                                LineSeries<InventaryData, double>(
                                    width: 5,
                                    color: Colors.red,
                                    name: 'Inventario Medio',
                                    dataSource: _inventaryData,
                                    xValueMapper:
                                        (InventaryData inventary, _) =>
                                            inventary.inventary,
                                    yValueMapper:
                                        (InventaryData inventary, _) =>
                                            inventary.inventary2,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                    enableTooltip: true,
                                    markerSettings: const MarkerSettings(
                                      isVisible: true,
                                      height: 20,
                                      width: 20,
                                    )),
                                LineSeries<LeadTimeData, double>(
                                    width: 10,
                                    color: Colors.green,
                                    name: 'Tiempo entre pedidos',
                                    dataSource: _leadTimeData,
                                    xValueMapper: (LeadTimeData lead, _) =>
                                        lead.diapedido,
                                    yValueMapper: (LeadTimeData lead, _) =>
                                        lead.diallegada,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                    enableTooltip: true,
                                    markerSettings: const MarkerSettings(
                                      height: 20,
                                      width: 20,
                                      isVisible: true,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '\n Gráfico generado gracias al ingreso de los siguientes valores: \n ',
                              style: TextStyle(
                                  fontFamily: 'MuseoSans', fontSize: 28),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Demanda ingresada: \n ${widget.dem} unidades.',
                              style: const TextStyle(
                                  fontFamily: 'MuseoSans', fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Costo de orden ingresado: \n ${widget.ord} CLP',
                              style: const TextStyle(
                                  fontFamily: 'MuseoSans', fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Costo de mantención anual ingresado: \n ${widget.man} CLP',
                              style: const TextStyle(
                                  fontFamily: 'MuseoSans', fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            width: 550,
                            height: 700,
                            child: SfCartesianChart(
                              onMarkerRender: (MarkerRenderArgs args) {
                                if (!(args.pointIndex == 1)) {
                                  args.markerHeight = 0.0;
                                  args.markerWidth = 0.0;
                                }
                              },
                              borderWidth: 0,
                              margin: const EdgeInsets.all(10),
                              primaryXAxis: NumericAxis(
                                  labelFormat: '{value} días',
                                  labelStyle: const TextStyle(
                                      fontFamily: 'MuseoSans', fontSize: 14)),
                              primaryYAxis: NumericAxis(
                                  labelFormat: '{value} uni',
                                  labelStyle: const TextStyle(
                                      fontFamily: 'MuseoSans', fontSize: 14)),

                              title: ChartTitle(
                                  text: 'Modelo EOQ Básico.',
                                  textStyle: const TextStyle(fontSize: 24)),

                              legend: Legend(
                                  textStyle: const TextStyle(fontSize: 24),
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position:
                                      LegendPosition.bottom), //ver la leyenda
                              tooltipBehavior: _tooltipBehavior,
                              series: <ChartSeries>[
                                LineSeries<SalesData, double>(
                                    color: Colors.blue,
                                    width: 5,
                                    name: 'Demanda', // nombre de la leyenda
                                    dataSource: _chartData,
                                    xValueMapper: (SalesData dias, _) =>
                                        dias.dias,
                                    yValueMapper: (SalesData unidades, _) =>
                                        unidades.unidades,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false, showZeroValue: false),
                                    enableTooltip: false,
                                    markerSettings: const MarkerSettings(
                                      height: 20,
                                      width: 20,
                                      isVisible: false,
                                    )),
                                LineSeries<SalesData2, double>(
                                    color: Colors.yellow,
                                    width: 5,
                                    name:
                                        'Cantidad óptima de pedido', // nombre de la leyenda
                                    dataSource: _chartData2,
                                    xValueMapper: (SalesData2 dias, _) =>
                                        dias.dias,
                                    yValueMapper: (SalesData2 unidades, _) =>
                                        unidades.unidades,
                                    dataLabelSettings: const DataLabelSettings(
                                        textStyle: TextStyle(fontSize: 18),
                                        isVisible: true,
                                        showZeroValue: false,
                                        labelAlignment:
                                            ChartDataLabelAlignment.top),
                                    enableTooltip: true,
                                    markerSettings: const MarkerSettings(
                                      height: 20,
                                      width: 20,
                                      isVisible: true,
                                    )),
                                LineSeries<InventaryData, double>(
                                    width: 5,
                                    color: Colors.red,
                                    name: 'Inventario Medio',
                                    dataSource: _inventaryData,
                                    xValueMapper:
                                        (InventaryData inventary, _) =>
                                            inventary.inventary,
                                    yValueMapper:
                                        (InventaryData inventary, _) =>
                                            inventary.inventary2,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                    enableTooltip: true,
                                    markerSettings: const MarkerSettings(
                                      isVisible: true,
                                      height: 20,
                                      width: 20,
                                    )),
                                LineSeries<LeadTimeData, double>(
                                    width: 10,
                                    color: Colors.green,
                                    name: 'Tiempo entre pedidos',
                                    dataSource: _leadTimeData,
                                    xValueMapper: (LeadTimeData lead, _) =>
                                        lead.diapedido,
                                    yValueMapper: (LeadTimeData lead, _) =>
                                        lead.diallegada,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false),
                                    enableTooltip: true,
                                    markerSettings: const MarkerSettings(
                                      height: 20,
                                      width: 20,
                                      isVisible: true,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Importante:',
                              style: TextStyle(
                                  fontFamily: 'MuseoSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              'El gráfico generado utiliza como base los 365 días trabajados.',
                              style: TextStyle(
                                  fontFamily: 'MuseoSans', fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              width: 400,
                              height: 150,
                              child: Text(
                                '\n Gráfico generado gracias al ingreso de los siguientes valores: \n ',
                                style: TextStyle(
                                    fontFamily: 'MuseoSans', fontSize: 28),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              'Demanda ingresada: \n ${widget.dem} unidades.',
                              style: const TextStyle(
                                  fontFamily: 'MuseoSans', fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Costo de orden ingresado: \n ${widget.ord} CLP',
                              style: const TextStyle(
                                  fontFamily: 'MuseoSans', fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Costo de mantención anual ingresado: \n ${widget.man} CLP',
                              style: const TextStyle(
                                  fontFamily: 'MuseoSans', fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        );
      }

      return Container(width: 200, height: 200, color: Colors.red);
    });
  }

  //-------------------------

  Future<void> _renderChartAsImage() async {
    final ui.Image data =
        await _cartesianChartKey.currentState!.toImage(pixelRatio: 3.0);
    final ByteData? bytes =
        await data.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List imageBytes =
        bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    Widget buildImage() => Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                  height: 70,
                  width: 70,
                  child: Image(
                    image: AssetImage('assets/logouls.png'),
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                width: 300,
                height: 510,
                child: Image.memory(imageBytes),
              ),
            ],
          ),
        );
    final controller = ScreenshotController();
    // ignore: use_build_context_synchronously
    await Navigator.of(context).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return Screenshot(
            controller: controller,
            child: Scaffold(
                backgroundColor: Colors.white70,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildImage(),
                      ElevatedButton(
                        onPressed: () async {
                          const snackBar = SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text(
                              'Gráfico guardado en galería',
                            ),
                          );
                          final image =
                              await controller.captureFromWidget(buildImage());
                          await saveImage(image);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }

  Future<String> saveImage(Uint8List image) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = "screenshot_$time";
    final result = await ImageGallerySaver.saveImage(image, name: name);

    return result['filePath'];
  }

  //----------------------------

//-------------------------------------------

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
      SalesData(0, 0),
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
      InventaryData(ro, co / 2),
      InventaryData(ro * 2, co / 2),
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
