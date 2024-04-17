import 'package:flutter/material.dart';
import 'package:food_2_hunger/themeData/theme.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightColorScheme, home: const AppHomeStateful());
  }
}

class AppHomeStateful extends StatefulWidget {
  const AppHomeStateful({super.key});

  @override
  createState() => _AppHomeStatefulState();
}

class _AppHomeStatefulState extends State<AppHomeStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food 2 Hunger"),
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
