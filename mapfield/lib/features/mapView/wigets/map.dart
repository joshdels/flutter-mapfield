import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapfield/data/models/project_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/data/providers/map_position_provider.dart';

class MapView extends ConsumerWidget {
  final ProjectModel project;
  final List<Widget> renderedLayers;

  const MapView({
    super.key,
    required this.project,
    required this.renderedLayers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(project.centerLatitude, project.centerLongitude),
        initialZoom: project.zoomLevel,
        onPositionChanged: (MapCamera position, bool hasGesture) {
          if (hasGesture) {
            ref
                .read(mapPositionProvider.notifier)
                .updatePosition(
                  position.center.latitude,
                  position.center.longitude,
                  position.zoom,
                );
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate: project.tileUrl,
          userAgentPackageName: 'com.example.app',
        ),
        ...renderedLayers,
      ],
    );
  }
}
