import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(12.881959, 121.766541),
          initialZoom: 6,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
        ],
      ),
    );
  }
}
