import 'package:flutter/material.dart';
import 'package:mapfield/core/routing/route_names.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarView({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("TopMapField"),
      centerTitle: true,
      backgroundColor: Colors.grey.shade300,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.green,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.person, size: 18),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.login);
              },
            ),
          ),
        ),
      ],
    );
  }
}
