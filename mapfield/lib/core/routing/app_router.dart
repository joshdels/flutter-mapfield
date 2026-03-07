import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RouteNames.map:
        return MaterialPageRoute(builder: (_) => const MapSection());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
    }
  }
}


// import 'package:flutter/material.dart';
// import 'core/routing/app_router.dart';
// import 'core/routing/route_names.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: RouteNames.home,
//       onGenerateRoute: AppRouter.generateRoute,
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }