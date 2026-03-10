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
    final projects = ref.watch(projectListProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Download Projects", textAlign: TextAlign.left),
        Divider(),
        Expanded(
          child: projects.isEmpty
              ? const Center(child: Text("No projects found."))
              : ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ProjectItem(project: projects[index]);
                  },
                ),
        ),
      ],
    );
  }
}

class ProjectItem extends StatelessWidget {
  final ProjectModel project;

  const ProjectItem({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade200,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        title: Text(project.name),
        subtitle: Text("Updated naba?"),
        onTap: () {
          Navigator.pushNamed(context, RouteNames.map);
        },
        trailing: IconButton(
          onPressed: () {
            openProjectModal(context, project);
          },
          icon: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
