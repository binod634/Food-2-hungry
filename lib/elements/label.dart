import 'package:flutter/material.dart';
import 'package:food_2_hunger/algorithm/shader.dart';

Widget titleLabel(BuildContext context,
    {double ssize = 36, TextAlign align = TextAlign.center}) {
  return Text("Food 2 Hungry",
      textAlign: align,
      style: TextStyle(
          fontFamily: 'joti',
          fontSize: ssize,
          color: Theme.of(context).colorScheme.surface,
          shadows: [universalShadow()]));
}
