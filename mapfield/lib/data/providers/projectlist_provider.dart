import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/data/models/project_models.dart';
import 'package:mapfield/data/services/project_services.dart';

class ProjectListNotifier extends AsyncNotifier<List<ProjectModel>> {
  final _db = DatabaseService.instance;

  @override
  Future<List<ProjectModel>> build() async {
    return await _db.getAllProjects();
  }

  // --- CRUD METHODS ---

  Future<void> addProject(ProjectModel project) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _db.insertProject(project);
      return await _db.getAllProjects();
    });
  }

  Future<void> deleteProject(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _db.deleteProject(id);
      return await _db.getAllProjects();
    });
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _db.getAllProjects());
  }
}

final projectListProvider =
    AsyncNotifierProvider<ProjectListNotifier, List<ProjectModel>>(() {
      return ProjectListNotifier();
    });

final projectListLatestProvider = Provider<AsyncValue<List<ProjectModel>>>((
  ref,
) {
  final allProjectsAsync = ref.watch(projectListProvider);

  return allProjectsAsync.whenData((projects) {
    final sorted = List<ProjectModel>.from(projects)
      ..sort((a, b) => b.lastOpened.compareTo(a.lastOpened));

    return sorted.take(3).toList();
  });
});
