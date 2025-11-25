import 'package:flutter/material.dart';
import '../../feature/home/presentation/pages/home_page.dart';
import '../../feature/syntax_lab/presentation/pages/syntax_lab_page.dart';
import '../../feature/syntax_showdown/presentation/pages/syntax_showdown_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String syntaxLab = '/syntax_lab_page';
  static const String syntaxShowdown = '/syntax_showdown_page';
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    syntaxLab: (context) => const SyntaxLabPage(),
    syntaxShowdown: (context) => const SyntaxShowdownPage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case syntaxLab:
        return MaterialPageRoute(builder: (context) => const SyntaxLabPage());
      case syntaxShowdown:
        return MaterialPageRoute(builder: (context) => const SyntaxShowdownPage());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Route ${settings.name} tidak ditemukan'),
            ),
          ),
        );
    }
  }
}