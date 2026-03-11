import 'package:flutter/material.dart';
import 'package:mapfield/core/routing/route_names.dart';

import 'package:mapfield/features/mapView/section/map_section.dart';
import 'package:mapfield/features/_homeView/section/home_section.dart';
import 'package:mapfield/features/newProjectView/section/newproject_section.dart';
import 'package:mapfield/features/cloudProjectView/section/cloudproject_section.dart';
import 'package:mapfield/features/localProjectView/section/localproject_section.dart';
import 'package:mapfield/features/loginView/section/login_section.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeSection());

      case RouteNames.map:
        return MaterialPageRoute(
          builder: (_) => const MapSection(),
          settings: settings,
        );

      case RouteNames.newProject:
        return MaterialPageRoute(builder: (_) => const NewProjectSection());

      case RouteNames.cloudProject:
        return MaterialPageRoute(builder: (_) => const CloudProjectSection());

      case RouteNames.localProject:
        return MaterialPageRoute(builder: (_) => const LocalProjectSection());

      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginSection());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
