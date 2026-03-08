import "package:flutter/material.dart";
import "package:mapfield/features/newProjectView/widgets/create_view.dart";

class CloudProjectSection extends StatelessWidget {
  const CloudProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create a new project"), centerTitle: true, leading: BackButton(),),
      body: Center(child: Text("Cloud Section")),
      bottomNavigationBar: CreateProjectView(),
    );
  }
}
