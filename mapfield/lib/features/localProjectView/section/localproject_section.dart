import "package:flutter/material.dart";
import "package:mapfield/shared/widgets/search_view.dart";
import "package:mapfield/features/localProjectView/widget/projects_view.dart";
import "package:mapfield/features/localProjectView/widget/create_project_view.dart";
import "package:mapfield/core/routing/route_names.dart";

class LocalProjectSection extends StatelessWidget {
  const LocalProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Projects"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.home);
          },
          icon: const Icon(Icons.arrow_back),
        ),
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
