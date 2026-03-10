import '../models/project_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectRepository {
  final List<ProjectModel> _fakeDb = [];

  Future<void> saveProject(ProjectModel project) async {
    await Future.delayed(const Duration(seconds: 1));

    _fakeDb.add(project);

    print("--- FAKE DB REPORT ---");
    print("Total Projects: ${_fakeDb.length}");
    print("Last Saved: ${project.name}");
    print("Basemap: ${project.selectedBasemap}");
    print("Fields: ${project.fields}");
    print("----------------------");
  }

  List<ProjectModel> getAllProjects() => List.unmodifiable(_fakeDb);
}

final projectRepositoryProvider = Provider((ref) => ProjectRepository());
