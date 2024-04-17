import 'package:flutter/material.dart';
import 'package:walkthrough_test/design/containercircle.dart';
import 'package:walkthrough_test/algorithm/screensize.dart';
import 'package:walkthrough_test/elements/label.dart';
import 'package:walkthrough_test/themeData/theme.dart';

class LoginSelection extends StatelessWidget {
  const LoginSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      home: const LoginSelectionScreen(),
    );
  }
}

class LoginSelectionScreen extends StatefulWidget {
  const LoginSelectionScreen({super.key});

  @override
  createState() => _LoginSelectionScreenState();
}

class _LoginSelectionScreenState extends State<LoginSelectionScreen> {
  void doSomething() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color.fromARGB(255, 107, 230, 236),
      body: Stack(
        children: [
          const ContainerCircle(
            height: 0.35,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            // padding: EdgeInsets.only(
            // top: MediaQuery.of(context).size.width * 0.5),
            children: [
              SizedBox(
                height: screenheight(context) * 0.1,
              ),
              SizedBox(
                  height: screenheight(context) * 0.1,
                  child: titleLabel(context)),
              SizedBox(
                  height: screenheight(context) * 0.35,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'assets/food1.png',
                      fit: BoxFit.contain,
                    ),
                  )),
              SizedBox(height: screenheight(context) * 0.1),
              SizedBox(
                  height: screenheight(context) * 0.1,
                  child: Padding(
                      padding:
                          EdgeInsets.only(right: screenwidth(context) * 0.3),
                      child: const Text(
                        // textAlign: TextAlign.left,
                        "Let's Start",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontFamily: 'joti'),
                      ))),
              SizedBox(
                height: screenheight(context) * 0.05,
                width: screenwidth(context) * 0.8,
                child: Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: FilledButton(
                          onPressed: doSomething, child: const Text("Login"))),
                ),
              ),
              SizedBox(
                  height: screenheight(context) * 0.1,
                  width: screenwidth(context) * 0.8,
                  child: Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: FilledButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          onPressed: doSomething,
                          child: const Text("Sign Up"),
                        )),
                  )),
              // SizedBox(
              //     height: screenheight(context) * 0.05,
              //     child: Padding(
              //         padding: EdgeInsets.only(
              //             left: screenwidth(context) * 0.3,
              //             right: screenwidth(context) * 0.3),
              //         child: FilledButton(
              //             onPressed: doSomething,
              //             child: const Text(
              //               "Login",
              //               style: TextStyle(fontSize: 16),
              //             )))),
              // SizedBox(
              // height: screenheight(context) * 0.5,
              // ),
              SizedBox(
                  height: screenheight(context) * 0.05,
                  child: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Let's End Hunger Together, One Donation at a Time!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ))),
              SizedBox(
                height: screenheight(context) * 0.05,
              )
            ],
          ),
        ],
      ),
    );
  }
}
