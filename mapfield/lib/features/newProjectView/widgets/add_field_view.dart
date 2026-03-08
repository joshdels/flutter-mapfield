import 'package:flutter/material.dart';

class AddField extends StatelessWidget {
  const AddField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("Add New Field"),
        ),
      ),
    );
  }
}
