import 'package:flutter/material.dart';
import 'package:mapfield/features/mapview/section/map_section.dart';
import 'package:mapfield/features/home/section/home_section.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeSection(),
      debugShowCheckedModeBanner: false,
    );
  }
}
