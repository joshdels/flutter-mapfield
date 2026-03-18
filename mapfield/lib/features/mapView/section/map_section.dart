import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mapfield/data/providers/gis_layer_provider.dart";
import "package:mapfield/data/providers/project_list_provider.dart";
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
    // Grab projectId from route arguments only once
    projectId ??= ModalRoute.of(context)?.settings.arguments as String?;
  }

  @override
  Widget build(BuildContext context) {
    // If we don't have a project ID, show loader
    if (projectId == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Watch projects and layers separately
    final projectsAsync = ref.watch(projectListProvider);
    final layersAsync = ref.watch(gisLayerProvider(projectId!));

    return projectsAsync.when(
      data: (projects) {
        final project = projects.firstWhere((p) => p.id == projectId);

        return layersAsync.when(
          data: (layerWidgets) {
            // ✅ Here we pass only List<Widget> to MapView
            return Scaffold(
              body: MapView(
                project: project,
                renderedLayers: layerWidgets,
              ),
              bottomNavigationBar: NavbarView(projectId: projectId!),
              floatingActionButton: const FloatingView(),
            );
          },
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) => Scaffold(
            body: Center(child: Text("Layers Error: $error")),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(child: Text("Project Error: $error")),
      ),
    );
  }
}