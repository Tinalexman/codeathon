import 'package:codeathon/core/navigation/pages.dart';
import 'package:codeathon/screens/mood_selection.dart';
import 'package:codeathon/screens/mood_target.dart';
import 'package:codeathon/screens/results.dart';
import 'package:codeathon/screens/splash.dart';
import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required super.builder, super.settings});

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    Offset begin = Offset(1.0, 0.0);
    Offset end = Offset.zero;
    Curve curve = Curves.easeInOut;

    Animatable<Offset> tween = Tween<Offset>(
      begin: begin,
      end: end,
    ).chain(CurveTween(curve: curve));

    return SlideTransition(position: animation.drive(tween), child: child);
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? routeArgs =
        settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case Pages.splash:
        return CustomRoute(
          builder: (context) => const Splash(),
          settings: settings,
        );
      case Pages.moodSelection:
        return CustomRoute(
          builder: (context) => const MoodSelection(),
          settings: settings,
        );
      case Pages.moodTarget:
        return CustomRoute(
          builder: (context) => const MoodTarget(),
          settings: settings,
        );
      case Pages.results:
        return CustomRoute(
          builder: (context) => const Results(),
          settings: settings,
        );
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Error'),
          ),
          body: const Center(child: Text('Error : Page Not Found')),
        );
      },
    );
  }
}
