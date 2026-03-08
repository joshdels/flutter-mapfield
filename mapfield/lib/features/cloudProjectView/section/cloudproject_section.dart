import "package:flutter/material.dart";
import "package:mapfield/features/cloudProjectView/widget/refresh_view.dart";
import "package:mapfield/features/cloudProjectView/widget/cloud_projects_view.dart";
import "package:mapfield/shared/widgets/search_view.dart";

class CloudProjectSection extends StatelessWidget {
  const CloudProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Projects"),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            SearchProjectView(),
            SizedBox(height: 20),
            Expanded(child: CloudProjectsView()),
          ],
        ),
      ),
      bottomNavigationBar: RefreshView(),
    );
  }
}
