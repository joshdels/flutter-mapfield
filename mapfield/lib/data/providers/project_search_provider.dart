import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/data/models/project_models.dart';
import 'package:mapfield/data/providers/project_list_provider.dart';

class ProjectSearchNotifier extends Notifier<String> {
  @override
  String build() => "";

  void updateSearch(String query) {
    state = query;
  }

  void clear() {
    state = "";
  }
}

final projectSearchProvider =
    NotifierProvider.autoDispose<ProjectSearchNotifier, String>(() {
      return ProjectSearchNotifier();
    });

final filteredProjectsProvider =
    Provider.autoDispose<AsyncValue<List<ProjectModel>>>((ref) {
      final projectsAsync = ref.watch(projectListLatestProvider);
      final query = ref.watch(projectSearchProvider).toLowerCase();

      return projectsAsync.whenData((projects) {
        if (query.isEmpty) return projects;
        return projects
            .where((p) => p.name.toLowerCase().contains(query))
            .toList();
      });
    });
