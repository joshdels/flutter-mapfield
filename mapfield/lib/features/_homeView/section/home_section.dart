import "package:flutter/material.dart";
import "package:mapfield/features/_homeView/widget/appbar_view.dart";
import "package:mapfield/features/_homeView/widget/navigation_view.dart";
import "package:mapfield/shared/widgets/logo_view.dart";
import "package:mapfield/features/_homeView/widget/recent_projects_view.dart";

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(),
      body: Column(
        children: [
          LogoView(),
          NavigationView(),
          Expanded(child: ProjectView()),
        ],
      ),
    );
  }
}
