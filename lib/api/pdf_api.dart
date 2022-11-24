// import 'dart:html';
// import 'dart:io' as io;
// import 'dart:async';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';

// class PdfApi {
//   static Future<File> generatePDF({
//     required Order ord,
//     required ByteData imageGraph,
//   }) async {
//     final document = PdfDocument();

//     return saveFile(document);
//   }

//   static Future<File> saveFile(PdfDocument document) async {
//     final path = await getApplicationDocumentsDirectory();
//     final fileName =
//         path.path + "/Invoice${DateTime.now().toIso8601String()}.pdf";
//     final file = File([], fileName);

//     file.writeAsBytes(document.save());
//     document.dispose();

//     return file;
//   }
// }

