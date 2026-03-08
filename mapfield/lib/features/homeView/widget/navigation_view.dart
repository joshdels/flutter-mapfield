  import 'package:flutter/material.dart';
  import 'package:mapfield/core/routing/route_names.dart';

  class NavigationView extends StatelessWidget {
    const NavigationView({super.key});

    @override
    Widget build(BuildContext context) {
      const items = [
        ButtonItem(
          icon: Icons.cloud,
          label: "Cloud Projects",
          route: RouteNames.login,
        ),
        ButtonItem(
          icon: Icons.map,
          label: "Local Projects",
          route: RouteNames.localProject,
        ),
        ButtonItem(
          icon: Icons.add,
          label: "Create New Project",
          route: RouteNames.newProject,
        ),
      ];

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items
            .map(
              (item) => ButtonSection(
                chosenIcon: item.icon,
                textLabel: item.label,
                routeTo: item.route,
              ),
            )
            .toList(),
      );
    }
  }

  class ButtonSection extends StatelessWidget {
    final IconData chosenIcon;
    final String textLabel;
    final String routeTo;

    const ButtonSection({
      super.key,
      required this.chosenIcon,
      required this.textLabel,
      required this.routeTo,
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
                onPressed: () {
                  Navigator.pushNamed(context, routeTo);
                },
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
    final String route;

    const ButtonItem({
      required this.icon,
      required this.label,
      required this.route,
    });
  }
