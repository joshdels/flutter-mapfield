import 'package:flutter_geopackage/flutter_geopackage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

Future<List<Polygon>> loadPolygonsFromGpkg(String path) async {
  final gpkg = await GeoPackage.open(path);

  final tables = gpkg.featureTables();
  if (tables.isEmpty) return [];

  final features = await gpkg.features(tables.first);

  List<Polygon> polygons = [];

  for (var f in features) {
    final geom = f.geometry;

    if (geom is GeoPolygon) {
      for (var ring in geom.rings) {
        final points = ring.map((coord) => LatLng(coord.y, coord.x)).toList();

        polygons.add(
          Polygon(
            points: points,
            color: Colors.blue,
            borderStrokeWidth: 2,
            borderColor: Colors.blue,
          ),
        );
      }
    }
  }

  return polygons;
}

// to be finish