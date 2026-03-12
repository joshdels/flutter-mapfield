import '../models/map_position_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapPositionNotifier extends Notifier<MapPosition?> {
  @override
  MapPosition? build() {
    return null;
  }

  void updatePosition(double lat, double lng, double zoom) {
    state = MapPosition(latitude: lat, longitude: lng, zoom: zoom);
  }
}

final mapPositionProvider = NotifierProvider<MapPositionNotifier, MapPosition?>(
  MapPositionNotifier.new,
);
