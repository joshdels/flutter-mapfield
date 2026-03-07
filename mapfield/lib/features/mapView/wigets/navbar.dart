import "package:flutter/material.dart";

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.sync), label: 'Sync'),
        NavigationDestination(icon: Icon(Icons.add_circle), label: 'Add'),
        NavigationDestination(icon: Icon(Icons.layers), label: 'Layers'),
        NavigationDestination(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
    );
  }
}
