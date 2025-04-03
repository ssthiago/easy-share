import 'package:flutter/material.dart';
import 'package:easy_share/easy_share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey _globalKey = GlobalKey();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("EasyShare Example")),
        body: Column(
          children: [
            RepaintBoundary(key: _globalKey, child: const Text("Capturar e Compartilhar")),
            ElevatedButton(
              onPressed: () => EasyShare.captureAndShare(context, _globalKey),
              child: const Text("Compartilhar"),
            ),
          ],
        ),
      ),
    );
  }
}
