import 'dart:typed_data';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class GeoPackageRenderer {
  Future<Database> openGeoPackage(String path) async {
    return await openDatabase(path, readOnly: true);
  }

  /// Fetches table name and the specific geometry column name
  Future<List<Map<String, String>>> getFeatureTables(Database db) async {
    final result = await db.rawQuery('''
      SELECT table_name, column_name, geometry_type_name 
      FROM gpkg_geometry_columns
    ''');

    return result.map((e) => {
      "table": e["table_name"] as String,
      "column": e["column_name"] as String,
      "type": e["geometry_type_name"] as String,
    }).toList();
  }

  /// Calculates the header offset for GeoPackage Binary Geometry
  /// GeoPackage binary headers are variable length!
  int _getWkbOffset(Uint8List geom) {
    if (geom.length < 8) return 0;
    final flags = geom[3];
    final envelopeContents = (flags & 0x0E) >> 1;
    
    // Envelope sizes: 0: 0 bytes, 1: 32 bytes, 2: 48 bytes, 3: 48 bytes, 4: 64 bytes
    int envelopeSize = 0;
    if (envelopeContents == 1) envelopeSize = 32;
    if (envelopeContents == 2 || envelopeContents == 3) envelopeSize = 48;
    if (envelopeContents == 4) envelopeSize = 64;

    return 8 + envelopeSize;
  }

  LatLng decodePoint(Uint8List geom) {
    final offset = _getWkbOffset(geom);
    final wkb = geom.sublist(offset);
    final byteData = ByteData.sublistView(wkb);

    // WKB Point: [1 byte endian] [4 bytes type] [8 bytes X] [8 bytes Y]
    // We assume Little Endian (1) for most GPKGs
    final lon = byteData.getFloat64(5, Endian.little);
    final lat = byteData.getFloat64(13, Endian.little);

    return LatLng(lat, lon);
  }

  List<LatLng> decodeLineString(Uint8List geom) {
    final offset = _getWkbOffset(geom);
    final wkb = geom.sublist(offset);
    final byteData = ByteData.sublistView(wkb);

    final numPoints = byteData.getUint32(5, Endian.little);
    List<LatLng> coords = [];

    int currentOffset = 9;
    for (int i = 0; i < numPoints; i++) {
      final lon = byteData.getFloat64(currentOffset, Endian.little);
      final lat = byteData.getFloat64(currentOffset + 8, Endian.little);
      coords.add(LatLng(lat, lon));
      currentOffset += 16;
    }
    return coords;
  }

  List<LatLng> decodePolygon(Uint8List geom) {
    final offset = _getWkbOffset(geom);
    final wkb = geom.sublist(offset);
    final byteData = ByteData.sublistView(wkb);

    // WKB Polygon: [Endian] [Type] [NumRings] [NumPoints] [Points...]
    final numRings = byteData.getUint32(5, Endian.little);
    if (numRings == 0) return [];

    final numPoints = byteData.getUint32(9, Endian.little);
    List<LatLng> coords = [];

    int currentOffset = 13;
    for (int i = 0; i < numPoints; i++) {
      final lon = byteData.getFloat64(currentOffset, Endian.little);
      final lat = byteData.getFloat64(currentOffset + 8, Endian.little);
      coords.add(LatLng(lat, lon));
      currentOffset += 16;
    }
    return coords;
  }

  /// Integrated Build Method
  Future<List<Widget>> buildLayers(String path) async {
    final db = await openGeoPackage(path);
    final featureInfos = await getFeatureTables(db);
    List<Widget> mapLayers = [];

    for (final info in featureInfos) {
      final table = info["table"]!;
      final column = info["column"]!;
      final type = info["type"]!;

      final rows = await db.query(table);

      if (type.contains("POINT")) {
        List<Marker> markers = [];
        for (var row in rows) {
          final blob = row[column];
          if (blob is Uint8List) {
            markers.add(Marker(
              point: decodePoint(blob),
              width: 40,
              height: 40,
              child: const Icon(Icons.location_on, color: Colors.green),
            ));
          }
        }
        if (markers.isNotEmpty) mapLayers.add(MarkerLayer(markers: markers));
      }

      if (type.contains("LINESTRING")) {
        List<Polyline> lines = [];
        for (var row in rows) {
          final blob = row[column];
          if (blob is Uint8List) {
            lines.add(Polyline(
              points: decodeLineString(blob),
              strokeWidth: 3,
              color: Colors.blue,
            ));
          }
        }
        if (lines.isNotEmpty) mapLayers.add(PolylineLayer(polylines: lines));
      }

      if (type.contains("POLYGON")) {
        List<Polygon> polygons = [];
        for (var row in rows) {
          final blob = row[column];
          if (blob is Uint8List) {
            polygons.add(Polygon(
              points: decodePolygon(blob),
              borderStrokeWidth: 2,
              borderColor: Colors.red,
              color: Colors.red.withOpacity(0.3),
            ));
          }
        }
        if (polygons.isNotEmpty) mapLayers.add(PolygonLayer(polygons: polygons));
      }
    }
    await db.close();
    return mapLayers;
  }
}