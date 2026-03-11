import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(initialCenter: LatLng(0, 0), initialZoom: 2),
      children: [
        TileLayer(
          urlTemplate:
              'http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}',
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}
