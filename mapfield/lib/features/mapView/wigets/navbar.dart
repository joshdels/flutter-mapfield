import "package:flutter/material.dart";

class NavbarView extends StatelessWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              print("Sync pressed");
            },
          ),

          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () {
              print("Add pressed");
            },
          ),

          IconButton(
            icon: const Icon(Icons.layers),
            onPressed: () {
              print("Layers pressed");
            },
          ),

          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              print("More pressed");
            },
          ),
        ],
      ),
    );
  }
}
