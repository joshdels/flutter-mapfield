import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mapfield/data/providers/projectlist_provider.dart";
import "package:mapfield/features/mapView/wigets/navbar.dart";
import "package:mapfield/features/mapView/wigets/floating_button.dart";
import "package:mapfield/features/mapView/wigets/map.dart";

class MapSection extends ConsumerWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? projectId =
        ModalRoute.of(context)?.settings.arguments as String?;

    final projectsAsync = ref.watch(projectListProvider);

    return projectsAsync.when(
      data: (projects) {
        final project = projects.firstWhere(
          (p) => p.id == projectId,
          orElse: () => throw Exception("Project not found"),
        );

        return Scaffold(
          body: MapView(project: project),
          bottomNavigationBar: const NavbarView(),
          floatingActionButton: const FloatingView(),
        );
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, _) => Scaffold(body: Center(child: Text("Error: $err"))),
    );
  }
}
