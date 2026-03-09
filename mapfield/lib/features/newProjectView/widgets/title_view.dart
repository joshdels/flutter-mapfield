import 'package:flutter/material.dart';

class ProjectNameView extends StatelessWidget {
  const ProjectNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Project Name", textAlign: TextAlign.left),
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
