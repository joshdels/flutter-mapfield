import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/data/models/project_models.dart';
import 'package:mapfield/core/routing/route_names.dart';
import 'package:mapfield/data/providers/projectlist_provider.dart';

class ProjectView extends ConsumerWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentProjects = ref.watch(projectListLatestProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Recent Projects",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: recentProjects.length,
            itemBuilder: (context, index) {
              final project = recentProjects[index];
              return ProjectItem(project: project);
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
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.grey.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        title: Text(project.name),
        subtitle: const Text("Updated naba?"),
        onLongPress: () {
          Navigator.pushNamed(context, RouteNames.map);
        },
      ),
    );
  }
}
