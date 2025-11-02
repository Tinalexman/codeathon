import 'package:codeathon/core/ui/themes.dart';
import 'package:codeathon/screens/mood_input_screen.dart';
import 'package:codeathon/screens/mood_preset.dart';
import 'package:codeathon/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Codeathon());
}

class Codeathon extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  const Codeathon({super.key});

  @override
  State<Codeathon> createState() => _CodeathonState();
}

class _CodeathonState extends State<Codeathon> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Codeathon.navigatorKey,
      title: 'Codeathon',
      theme: themeData,
      home: const MoodInputScreen(),
    );
  }
}
