import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_geokit/flutter_geokit.dart';

import 'package:mapfield/data/models/gis_layer_models.dart';
import 'package:mapfield/data/services/project_services.dart';
import 'package:mapfield/data/utility/geopackage_handler.dart';

final gisLayerProvider = FutureProvider.family<List<Widget>, String>((ref, projectId) async {
  final List<GISLayerModel> layerModels = await DatabaseService.instance.getGisLayers(projectId);

  final List<Widget> allMapWidgets = [];
  final repo = GeoPackageRepository();

  // 2. Loop through each layer and parse its specific GeoPackage file
  for (final layer in layerModels) {
    try {
      final features = await repo.fetchFeatures(layer.path);
      
      // 3. Convert these features into the Marker/Polyline/Polygon layers
      final widgets = _convertToMapWidgets(features);
      allMapWidgets.addAll(widgets);
    } catch (e) {
      debugPrint("Error parsing GeoPackage at ${layer.path}: $e");
      // Continue to next layer so one bad file doesn't break the whole map
      continue;
    }
  }

  return allMapWidgets;
});


List<Widget> _convertToMapWidgets(List<GeoFeature> features) {
  final markers = <Marker>[];
  final polylines = <Polyline>[];
  final polygons = <Polygon>[];

  for (final feature in features) {
    final geometry = feature.geometry;

    // 1. If it's a Point, make a Marker
    if (geometry is GeoPoint) {
      markers.add(
        Marker(
          point: geometry.point,
          width: 40,
          height: 40,
          child: const Icon(Icons.location_on, color: Colors.red, size: 30),
        ),
      );
    }
    // 2. If it's a Line, make a Polyline
    else if (geometry is GeoLineString) {
      polylines.add(
        Polyline(points: geometry.points, strokeWidth: 3.0, color: Colors.blue),
      );
    }
    // 3. If it's a Polygon (like your Forest), make a Polygon
    else if (geometry is GeoPolygon) {
      polygons.add(
        Polygon(
          points: geometry.points,
          color: Colors.green,
          borderColor: Colors.green,
          borderStrokeWidth: 2.0,
        ),
      );
    }
  }

  return [
    if (polygons.isNotEmpty) PolygonLayer(polygons: polygons),
    if (polylines.isNotEmpty) PolylineLayer(polylines: polylines),
    if (markers.isNotEmpty) MarkerLayer(markers: markers),
  ];
}
