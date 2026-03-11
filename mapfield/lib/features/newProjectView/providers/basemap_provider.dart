import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/data/models/basemap_models.dart';

final List<BasemapConfig> availableBasemaps = [
  const BasemapConfig(
    name: "Satellite",
    imagePath: "assets/basemap/satellite.jpg",
    tileUrl: 'http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}',
  ),
  const BasemapConfig(
    name: "Streets",
    imagePath: "assets/basemap/streets.jpg",
    tileUrl: 'http://mt0.google.com/vt/lyrs=m&hl=en&x={x}&y={y}&z={z}',
  ),
  const BasemapConfig(
    name: "Dark Mode",
    imagePath: "assets/basemap/black.jpg",
    tileUrl: 'https://a.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
  ),
  const BasemapConfig(
    name: "Light Mode",
    imagePath: "assets/basemap/Basemap.png",
    tileUrl: 'https://a.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
  ),
];

class SelectedBasemapNotifier extends Notifier<BasemapConfig> {
  @override
  BasemapConfig build() => availableBasemaps.first;

  void setBasemap(BasemapConfig config) {
    state = config;
  }
}
