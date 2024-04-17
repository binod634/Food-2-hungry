import 'package:flutter/material.dart';

class ContainerCircle extends StatelessWidget {
  const ContainerCircle({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: MediaQuery.of(context).size.width * 1,
      alignment: Alignment.bottomCenter,
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * height,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(
                    MediaQuery.of(context).size.width * 2,
                    MediaQuery.of(context).size.height * 0.5)),
          )),
    );
  }
}
