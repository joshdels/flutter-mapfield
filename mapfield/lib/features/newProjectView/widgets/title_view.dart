import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapfield/features/newProjectView/providers/projectname_provider.dart';

class ProjectNameView extends ConsumerWidget {
  const ProjectNameView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Project Name", textAlign: TextAlign.left),
        TextField(
          onChanged: (value) {
            ref.read(projectnameProvider.notifier).updateName(value);
          },
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
