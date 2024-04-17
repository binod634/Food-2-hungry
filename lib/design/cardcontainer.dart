import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:walkthrough_test/algorithm/screensize.dart';

Widget returnHomeCardContainer(BuildContext context,
    {required Color backgroundColor,
    required String img,
    required String label}) {
  return Container(
      height: screenheight(context) * 0.1,
      width: screenheight(context) * 0.1,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
            // height: screenheight(context) * 0.06,
            child: Column(
          children: [
            SizedBox(
                height: screenheight(context) * 0.07, child: Image.asset(img)),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )),
      ));
}
