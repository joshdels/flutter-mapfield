import 'package:flutter_geokit/flutter_geokit.dart';

class GeoPackageRepository {
  Future<List<GeoFeature>> fetchFeatures(String path) async {
    final handler = GeoPackageHandler();
    try {
      handler.openGeoPackage(path);
      handler.readFeatures();
      return List.from(handler.features);
    } finally {
      handler.closeGeoPackage();
    }
  }
}
