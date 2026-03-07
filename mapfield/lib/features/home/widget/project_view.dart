import 'package:flutter/material.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Recent Projects", style: TextStyle(fontWeight: FontWeight.bold)),
        // ListView()
      ],
    );
  }
}
