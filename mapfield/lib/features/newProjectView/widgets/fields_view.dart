import 'package:flutter/material.dart';

class FieldsView extends StatelessWidget {
  const FieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fields",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(child: FieldsList()),
          ],
        ),
      ),
    );
  }
}

class FieldsList extends StatelessWidget {
  const FieldsList({super.key});

  @override
  Widget build(BuildContext context) {
    final fields = [
      ["Field A", "South Plot"],
      ["Field B", "North Plot"],
    ];

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: fields.length,
            itemBuilder: (context, index) {
              return FieldRow(
                name: fields[index][0],
                location: fields[index][1],
              );
            },
          ),
        ),
      ],
    );
  }
}

class FieldRow extends StatelessWidget {
  final String name;
  final String location;

  const FieldRow({super.key, required this.name, required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(name)),
          Expanded(flex: 2, child: Text(location)),
          IconButton(icon: const Icon(Icons.delete_outline), onPressed: () {}),
        ],
      ),
    );
  }
}
