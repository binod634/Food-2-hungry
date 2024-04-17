import 'package:flutter/material.dart';
import 'package:food_2_hunger/algorithm/screensize.dart';
import 'package:walkthrough_test/algorithm/screensize.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer(
      {super.key,
      required this.height,
      required this.topColor,
      required this.bottomColor});
  final double height;
  final Color topColor, bottomColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenheight(context) * 1,
      width: screenwidth(context) * 1,
      alignment: Alignment.bottomCenter,
      color: topColor,
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * height,
          decoration: BoxDecoration(
            color: bottomColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(
                    MediaQuery.of(context).size.width * 2,
                    MediaQuery.of(context).size.height * 0.5),
                topRight: Radius.elliptical(
                    MediaQuery.of(context).size.width * 2,
                    MediaQuery.of(context).size.height * 0.5)),
          )),
    );
  }
}
