import 'package:codeathon/core/ui/themes.dart';
import 'package:codeathon/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Codeathon());
}

class Codeathon extends StatefulWidget {
  const Codeathon({super.key});

  @override
  State<Codeathon> createState() => _CodeathonState();
}

class _CodeathonState extends State<Codeathon> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Codeathon',
      theme: themeData,
      home: const Splash(),
    );
  }
}
