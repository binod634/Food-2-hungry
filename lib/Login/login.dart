import 'package:flutter/material.dart';
import 'package:food_2_hunger/algorithm/navigate.dart';
import 'package:food_2_hunger/design/containercircle.dart';
import 'package:food_2_hunger/algorithm/screensize.dart';
import 'package:food_2_hunger/elements/label.dart';
import 'package:food_2_hunger/home/home.dart';
import 'package:food_2_hunger/themeData/theme.dart';

class AppLogin extends StatelessWidget {
  const AppLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      debugShowCheckedModeBanner: false,
      home: const AppLoginState(),
    );
  }
}

class AppLoginState extends StatefulWidget {
  const AppLoginState({super.key});

  @override
  createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLoginState> {
  String initialText = "Login";
  void doSomething() {}
  bool checkLogin() {
    if (mailString == "binod" && pwdString == "binod") {
      return true;
    }
    return false;
  }

  var mailController = TextEditingController();
  var pwdController = TextEditingController();
  String mailString = "";
  String pwdString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Stack(
            children: [
              const ContainerCircle(
                height: 0.45,
              ),
              Column(
                children: [
                  SizedBox(
                    height: screenheight(context) * 0.1,
                  ),
                  SizedBox(
                      height: screenheight(context) * 0.1,
                      child: titleLabel(context)),
                  SizedBox(
                      height: screenheight(context) * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset(
                          'assets/food1.png',
                          fit: BoxFit.contain,
                        ),
                      )),
                  SizedBox(height: screenheight(context) * 0.05),
                  SizedBox(
                      height: screenheight(context) * 0.1,
                      child: Padding(
                          padding: EdgeInsets.only(
                              right: screenwidth(context) * 0.3),
                          child: Text(
                            // textAlign: TextAlign.left,
                            initialText,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                fontFamily: 'joti'),
                          ))),
                  SizedBox(
                    height: screenheight(context) * 0.15,
                    width: screenwidth(context) * 0.8,
                    child: Row(children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            controller: mailController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              prefixIcon: SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: Image.asset(
                                    "assets/mailicon.png",
                                  )),
                              hintText: "Email",
                              border: const OutlineInputBorder(),
                              fillColor: Colors.red,
                            ),
                            maxLines: 1,
                            minLines: 1,
                            // expands: true,
                          )),
                    ]),
                  ),
                  SizedBox(
                      height: screenheight(context) * 0.1,
                      width: screenwidth(context) * 0.8,
                      child: Row(children: [
                        SizedBox(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              controller: pwdController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                prefixIcon: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: Image.asset(
                                      "assets/keyiconorg.png",
                                    )),
                                hintText: "Password",
                                border: const OutlineInputBorder(),
                                fillColor: Colors.red,
                              ),
                              maxLines: 1,
                              minLines: 1,
                              // expands: true,
                            )),
                      ])),
                  SizedBox(
                      height: screenheight(context) * 0.05,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: screenwidth(context) * 0.3,
                              right: screenwidth(context) * 0.3),
                          child: FilledButton(
                              onPressed: () {
                                if (checkLogin()) {
                                  navigatorNavigateTo(context,
                                      navigationChild: const AppHomeUi());
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 16),
                              )))),
                  SizedBox(
                      height: screenheight(context) * 0.05,
                      child: const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Let's End Hunger Together, One Donation at a Time!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ))),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    mailController.addListener(() {
      setState(() {
        mailString = mailController.text;
      });
    });
    pwdController.addListener(() {
      setState(() {
        pwdString = pwdController.text;
      });
    });
  }

  @override
  void dispose() {
    mailController.dispose();
    pwdController.dispose();
    super.dispose();
  }
}
