import "package:flutter/material.dart";
import "package:mapfield/features/newProjectView/widget/floating_view.dart";
import "package:mapfield/features/newProjectView/widget/title_view.dart";
import "package:mapfield/features/newProjectView/widget/fields_view.dart";
import "package:mapfield/features/newProjectView/widget/basemap_view.dart";
import "package:mapfield/features/newProjectView/widget/add_field_view.dart";

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
