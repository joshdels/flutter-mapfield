import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/data/models/project_models.dart';
import 'package:mapfield/data/providers/projectlist_provider.dart';
import 'package:mapfield/features/localProjectView/widget/bottom_modal_view.dart';
import 'package:mapfield/core/routing/route_names.dart';

class ProjectsView extends ConsumerWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(filteredProjectsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Download Projects", textAlign: TextAlign.left),
        const Divider(),
        Expanded(
          child: projectsAsync.when(
            data: (projects) {
              if (projects.isEmpty) {
                return const Center(child: Text("No projects found."));
              }
              return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectItem(project: projects[index]);
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) =>
                Center(child: Text("Error loading projects: $err")),
          ),
        ),
      ],
    );
  }
}

class ProjectItem extends ConsumerWidget {
  final ProjectModel project;

  const ProjectItem({super.key, required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade200,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        title: Text(project.name),
        subtitle: Text("Updated naba?"),
        onTap: () {
          Navigator.pushNamed(context, RouteNames.map, arguments: project.id);
        },
        trailing: IconButton(
          onPressed: () {
            openProjectModal(context, project, ref);
          },
          icon: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
