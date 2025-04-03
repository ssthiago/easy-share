import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class EasySharePDF {
  static Future<String?> generatePdfFromImages(List<Uint8List> images, String fileName) async {
    final pdf = pw.Document();

    for (var image in images) {
      final pdfImage = pw.MemoryImage(image);
      pdf.addPage(pw.Page(build: (pw.Context context) {
        return pw.Center(child: pw.Image(pdfImage));
      }));
    }

    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/$fileName";

    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    return filePath;
  }
}
