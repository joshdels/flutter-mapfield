import "package:flutter/material.dart";
import "package:mapfield/features/newProjectView/widgets/create_view.dart";
import "package:mapfield/features/newProjectView/widgets/title_view.dart";
import "package:mapfield/features/newProjectView/widgets/fields_view.dart";
import "package:mapfield/features/newProjectView/widgets/basemap_view.dart";
import "package:mapfield/features/newProjectView/widgets/add_field_view.dart";

class NewProjectSection extends StatelessWidget {
  const NewProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Project"),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(30),
        child: Column(
          children: [ProjectNameView(), BasemapView(), FieldsView(), AddField()],
        ),
      ),
      bottomNavigationBar: CreateProjectView(),
    );
  }
}
