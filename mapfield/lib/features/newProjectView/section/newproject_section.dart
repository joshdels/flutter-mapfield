import "package:flutter/material.dart";
import "package:mapfield/features/newProjectView/widget/floating_view.dart";

class NewProjectSection extends StatelessWidget {
  const NewProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create a new project"), centerTitle: true, leading: BackButton(),),
      body: Center(child: Text("New Section")),
      bottomNavigationBar: CreateProjectView(),
    );
  }
}
