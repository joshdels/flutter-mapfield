import 'dart:io';
import 'package:flutter/services.dart';
import 'package:mapfield/data/services/project_services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mapfield/data/models/gis_layer_models.dart';
import 'package:uuid/uuid.dart';

/* 
This is for testing the geopackage in the assets first 
seedGeoPackage is for retrieving the path and geopackage test
setUpIntialLayer is to create the requirement of the GISModelLayer
insert is for the offline database :)

this is the initial testing 
needs: refactoring into river pods ang insert layer
*/
Future<String> seedGeoPackage(String assetName) async {
  final directory = await getApplicationDocumentsDirectory();

  final filePath = join(directory.path, assetName);
  final file = File(filePath);

  await file.parent.create(recursive: true);

  if (!file.existsSync()) {
    final data = await rootBundle.load('assets/$assetName');
    final bytes = data.buffer.asUint8List();
    await file.writeAsBytes(bytes, flush: true);
  }

  return filePath;
}

Future<void> setupInitialLayer(String projectId) async {
  String localPath = await seedGeoPackage('data/test2.gpkg');

  final myLayer = GISLayerModel(
    id: const Uuid().v4(),
    projectId: projectId,
    name: 'Main Map',
    type: 'vector',
    path: localPath,
    createdAt: DateTime.now(),
  );

  await DatabaseService.instance.insertGisLayer(myLayer);
  await insertLayer(myLayer);

  print("Layer ready at: $myLayer");
}

// subjected to riverpods, needs refactoring
Future<void> insertLayer(GISLayerModel layer) async {
  try {
    await DatabaseService.instance.insertGisLayer(layer);
    print("Layer inserted into DB: ${layer.name}");
  } catch (e) {
    print("Error inserting layer: $e");
  }
}
