import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:easy_share/src/easy_share_image.dart';
import 'package:easy_share/src/easy_share_pdf.dart';
import 'package:easy_share/src/easy_share_share.dart';

class EasyShare {
  static Future<void> captureAndShare(BuildContext context, GlobalKey key) async {
    String? filePath = await EasyShareImage.captureAndSaveImage(key, "captura.png");
    if (filePath != null) {
      await EasyShareShare.shareFile(filePath);
    }
  }

  static Future<void> captureAndSaveAsPdf(BuildContext context, List<GlobalKey> keys) async {
    List<Uint8List> images = [];
    for (var key in keys) {
      Uint8List? image = await EasyShareImage.captureWidgetAsImage(key);
      if (image != null) images.add(image);
    }

    if (images.isNotEmpty) {
      String? pdfPath = await EasySharePDF.generatePdfFromImages(images, "documento.pdf");
      if (pdfPath != null) {
        await EasyShareShare.shareFile(pdfPath);
      }
    }
  }
}
