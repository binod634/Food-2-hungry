import 'package:flutter/material.dart';
import 'package:walkthrough_test/algorithm/screensize.dart';

class ProfileLabel extends StatelessWidget {
  const ProfileLabel(
      {super.key,
      required this.leadingIcon,
      required this.titleString,
      required this.dataString});
  final IconData leadingIcon;
  final String titleString;
  final String dataString;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: screenwidth(context) * 0.9,
        height: screenheight(context) * 0.15,
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 1,
                  color: Color.fromARGB(255, 223, 223, 223),
                  spreadRadius: 0)
            ],
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenwidth(context) * 0.05,
                vertical: screenheight(context) * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(leadingIcon),
                  ),
                  Text(
                    titleString,
                    style: const TextStyle(fontSize: 18, fontFamily: "jua"),
                  ),
                ]),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    dataString,
                    style: const TextStyle(fontSize: 24, fontFamily: "jua"),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: screenheight(context) * 0.025),
    ]);
  }
}
