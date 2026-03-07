import "package:flutter/material.dart";

class CreateProjectView extends StatelessWidget {
  const CreateProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: TextButton(onPressed: () {}, child: Text("Create Project")),
    );
  }
}
