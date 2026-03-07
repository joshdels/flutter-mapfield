import "package:flutter/material.dart";
import "package:mapfield/features/mapview/wigets/navbar.dart";
import "package:mapfield/features/mapview/wigets/floatingButton.dart";
import "package:mapfield/features/mapview/wigets/map.dart";

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MapView()),
      bottomNavigationBar: NavbarView(),
      floatingActionButton: FloatingView(),
    );
  }
}
