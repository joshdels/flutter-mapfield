import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mapfield/data/providers/gis_layer_provider.dart";
import "package:mapfield/data/providers/project_list_provider.dart";
import "package:mapfield/data/providers/map_position_provider.dart";
import "package:mapfield/features/mapView/wigets/navbar.dart";
import "package:mapfield/features/mapView/wigets/floating_button.dart";
import "package:mapfield/features/mapView/wigets/map.dart";

class MapSection extends ConsumerStatefulWidget {
  const MapSection({super.key});

  @override
  ConsumerState<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends ConsumerState<MapSection> {
  String? projectId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    projectId ??= ModalRoute.of(context)?.settings.arguments as String?;
  }

  @override
  Widget build(BuildContext context) {
    final projectsAsync = ref.watch(projectListProvider);
    final layersAsync = ref.watch(gisLayerProvider(projectId!));

    ref.listen(mapPositionProvider, (previous, next) {
      if (next == null || projectId == null) return;

      final projects = projectsAsync.value;
      if (projects == null) return;

      final project = projects.firstWhere((p) => p.id == projectId);

      final updatedProject = project.copyWith(
        centerLatitude: next.latitude,
        centerLongitude: next.longitude,
        zoomLevel: next.zoom,
      );

      ref.read(projectListProvider.notifier).updateProject(updatedProject);
    });

    return projectsAsync.when(
      data: (projects) {
        final project = projects.firstWhere(
          (p) => p.id == projectId,
          orElse: () => throw Exception("Project not found"),
        );

        return layersAsync.when(
          data: (layers) {
            return Scaffold(
              body: MapView(project: project, layers: layers),
              bottomNavigationBar: const NavbarView(),
              floatingActionButton: const FloatingView(),
            );
          },
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (err, _) => Scaffold(body: Center(child: Text("Error: $err"))),
        );
      },
    );
  }
}
