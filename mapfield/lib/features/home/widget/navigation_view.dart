import 'package:flutter/material.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      ButtonItem(icon: Icons.cloud, label: "Cloud Projects"),
      ButtonItem(icon: Icons.map, label: "Local Projects"),
      ButtonItem(icon: Icons.add, label: "Create New Project"),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items
          .map(
            (item) =>
                ButtonSection(chosenIcon: item.icon, textLabel: item.label),
          )
          .toList(),
    );
  }
}

class ButtonSection extends StatelessWidget {
  final IconData chosenIcon;
  final String textLabel;

  const ButtonSection({
    super.key,
    required this.chosenIcon,
    required this.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(chosenIcon, size: 40),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(textLabel, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

class ButtonItem {
  final IconData icon;
  final String label;

  const ButtonItem({required this.icon, required this.label});
}
