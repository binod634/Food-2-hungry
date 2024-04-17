import 'package:flutter/material.dart';

void navigatorNavigateTo(BuildContext context,
    {required Widget navigationChild}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => navigationChild,
  ));
}
