import "package:flutter/material.dart";
import "package:mapfield/features/newProjectView/widgets/floating_view.dart";

class LocalProjectSection extends StatelessWidget {
  const LocalProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Project Section"), centerTitle: true, leading: BackButton(),),
      body: Center(child: Text("Local Section")),
      bottomNavigationBar: CreateProjectView(),
    );
  }
}
