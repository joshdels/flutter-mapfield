import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapfield/data/models/project_models.dart';

class MapView extends StatelessWidget {
  final ProjectModel project;

  const MapView({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(project.centerLatitude, project.centerLongitude),
        initialZoom: project.zoomLevel,
      ),
      children: [
        TileLayer(
          urlTemplate:
              // 'http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}',
              project.tileUrl,
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}
