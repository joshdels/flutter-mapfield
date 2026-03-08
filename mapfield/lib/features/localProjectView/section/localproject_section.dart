import "package:flutter/material.dart";
import "package:mapfield/features/localProjectView/widget/search_view.dart";
import "package:mapfield/features/localProjectView/widget/projects_view.dart";
import "package:mapfield/features/localProjectView/widget/create_project_view.dart";

class LocalProjectSection extends StatelessWidget {
  const LocalProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects"),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SearchProjectView(),
            SizedBox(height: 20),
            Expanded(child: ProjectsView()),
            CreateProjectView(),
          ],
        ),
      ),
    );
  }
}
