import "package:flutter/material.dart";

class FloatingView extends StatelessWidget {
  const FloatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {}, child: Icon(Icons.my_location));
  }
}
