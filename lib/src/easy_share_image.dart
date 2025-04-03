import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class EasyShareImage {
  static final ScreenshotController _screenshotController = ScreenshotController();

  static Future<Uint8List?> captureWidgetAsImage(GlobalKey key) async {
    try {
      RenderRepaintBoundary? boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;

      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      debugPrint("Erro ao capturar widget: $e");
      return null;
    }
  }

  static Future<String?> captureAndSaveImage(GlobalKey key, String fileName) async {
    Uint8List? imageBytes = await captureWidgetAsImage(key);
    if (imageBytes == null) return null;

    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/$fileName";

    File file = File(filePath);
    await file.writeAsBytes(imageBytes);

    return filePath;
  }
}
