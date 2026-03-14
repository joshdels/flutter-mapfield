import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/gis_layer_models.dart';
import '../services/project_services.dart';

final gisLayerProvider = FutureProvider.family<List<GISLayerModel>, String>((
  ref,
  projectId,
) async {
  return await DatabaseService.instance.getGisLayers(projectId);
});
