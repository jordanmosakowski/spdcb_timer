import 'dart:io';

import 'package:path_provider/path_provider.dart';


class StorageInterface{
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }


  Future<void> writeData(String location, String data) async {
    final path = await _localPath;
    final File file = File('$path/$location');
    await file.writeAsString(data);
    return;
  }

  Future<String> readData(String location) async {
    try {
      final path = await _localPath;
      final File file = File('$path/$location');
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return null;
    }
  }
}