import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarView({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("TopMapField"),
      centerTitle: true,
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
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
