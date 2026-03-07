import "package:flutter/material.dart";
import "package:mapfield/features/homeView/widget/appbar_view.dart";
import "package:mapfield/features/homeView/widget/navigation_view.dart";
import "package:mapfield/features/homeView/widget/logo_view.dart";
import "package:mapfield/features/homeView/widget/project_view.dart";

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(),
      body: Column(children: [LogoView(), NavigationView(), ProjectView()]),
    );
  }
}
