import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/data/models/project_models.dart';
import 'package:mapfield/data/providers/projectlist_provider.dart';
import 'package:mapfield/features/newProjectView/providers/fields_provider.dart';
import 'package:mapfield/features/newProjectView/providers/projectname_provider.dart';
import 'package:mapfield/features/newProjectView/widgets/basemap_view.dart';

enum ProjectSaveStatus { idle, loading, success, error }

class ProjectController extends Notifier<ProjectSaveStatus> {
  @override
  ProjectSaveStatus build() => ProjectSaveStatus.idle;

  Future<void> createProject() async {
    state = ProjectSaveStatus.loading;

    try {
      final name = ref.read(projectnameProvider);
      final basemap = ref.read(selectedBasemapProvider);
      final rawFields = ref.read(fieldsProvider);

      if (name.isEmpty) throw Exception("Project name cannot be empty");

      final mappedFields = rawFields.map((f) => f.toJson()).toList();

      final newProject = ProjectModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        selectedBasemap: basemap,
        createdAt: DateTime.now(),
        createdBy: "Current User",
        lastOpened: DateTime.now(),
        fields: mappedFields,
        zoomLevel: 12.0,
        centerLatitude: 0.0,
        centerLongitude: 0.0,
      );

      await ref.read(projectListProvider.notifier).addProject(newProject);

      _resetForm();

      state = ProjectSaveStatus.success;
    } catch (e) {
      print("Error creating project: $e");
      state = ProjectSaveStatus.error;
    }
  }

  void _resetForm() {
    ref.invalidate(projectnameProvider);
    ref.invalidate(selectedBasemapProvider);
    ref.invalidate(fieldsProvider);
  }
}

final projectControllerProvider =
    NotifierProvider<ProjectController, ProjectSaveStatus>(
      ProjectController.new,
    );
