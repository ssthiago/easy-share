import 'package:easy_share/easy_share.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepaintBoundary(
        key: _globalKey,
        child: Scaffold(
          appBar: AppBar(title: Text("EasyShare Example")),
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () => EasyShare.captureAndShare(context, _globalKey),
                child: Text("Compartilhar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
