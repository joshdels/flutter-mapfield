import 'package:flutter/material.dart';
import 'package:mapfield/data/models/project_models.dart';

void openMoreModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    builder: (context) {
      return Container(
        height: 200,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Center(
              child: Text(
                'More Options',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),

            Divider(),

            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("Delete Project"),
              onTap: () {},
            ),
          ],
        ),
      );
    },
  );
}
