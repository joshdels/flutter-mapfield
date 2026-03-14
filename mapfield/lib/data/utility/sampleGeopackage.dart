import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

Future<String> copySampleGpkg() async {
  final dir = await getApplicationDocumentsDirectory();
  final filePath = path.join(dir.path, "sample.gpkg");

  final file = File(filePath);

  if (!await file.exists()) {
    final data = await rootBundle.load("assets/data/data.gpkg");
    await file.writeAsBytes(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
  }

  return filePath;
}