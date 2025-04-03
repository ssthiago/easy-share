import 'package:share_plus/share_plus.dart';

class EasyShareShare {
  static Future<void> shareFile(String filePath) async {
    await Share.shareXFiles([XFile(filePath)], text: "Compartilhado via EasyShare!");
  }
}
