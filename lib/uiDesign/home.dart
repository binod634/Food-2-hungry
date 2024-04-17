import 'package:flutter/material.dart';
import 'package:food_2_hunger/themeData/theme.dart';

class AppHomeUi extends StatelessWidget {
  const AppHomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      home: const AppHomeUiState(),
    );
  }
}

class AppHomeUiState extends StatefulWidget {
  const AppHomeUiState({super.key});

  @override
  createState() => _AppHomeUiStateState();
}

class _AppHomeUiStateState extends State<AppHomeUiState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
