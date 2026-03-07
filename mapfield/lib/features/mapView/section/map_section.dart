import "package:flutter/material.dart";
import "package:mapfield/features/mapView/wigets/navbar.dart";
import "package:mapfield/features/mapView/wigets/floatingButton.dart";
import "package:mapfield/features/mapView/wigets/map.dart";

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
