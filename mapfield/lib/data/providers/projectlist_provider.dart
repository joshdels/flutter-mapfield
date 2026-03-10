import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/data/models/project_models.dart';
import 'package:mapfield/data/repository/project_repository.dart';

final projectListProvider = Provider<List<ProjectModel>>((ref) {
  final repository = ref.watch(projectRepositoryProvider);

  return repository.getAllProjects();
});

final projectListLatestProvider = Provider<List<ProjectModel>>((ref) {
  final allProjects = ref.watch(projectListProvider);

  return allProjects.reversed.take(3).toList().cast<ProjectModel>();
});
