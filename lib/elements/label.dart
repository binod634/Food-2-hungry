import 'package:flutter/material.dart';
import 'package:walkthrough_test/algorithm/shader.dart';

Widget titleLabel(BuildContext context,
    {double ssize = 36,
    TextAlign align = TextAlign.center,
    String str = "Food 2 Hungry"}) {
  return Text(str,
      textAlign: align,
      style: TextStyle(
          fontFamily: 'joti',
          fontSize: ssize,
          color: Theme.of(context).colorScheme.surface,
          shadows: [universalShadow()]));
}
