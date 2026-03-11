import 'package:flutter/material.dart';
import 'package:mapfield/data/models/project_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/data/providers/projectlist_provider.dart';

void openProjectModal(
  BuildContext context,
  ProjectModel project,
  WidgetRef ref,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    builder: (context) {
      return Container(
        height: 200,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Center(
              child: Text(
                project.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.upload),
              title: const Text("Upload Project"),
              onTap: () {},
            ),

            Divider(),

            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("Delete Project"),
              onTap: () {
                Navigator.pop(context);
                ref.read(projectListProvider.notifier).deleteProject(project.id);
              },
            ),
          ],
        ),
      );
    },
  );
}
