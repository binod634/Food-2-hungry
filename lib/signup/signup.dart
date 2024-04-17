import 'package:flutter/material.dart';
import 'package:walkthrough_test/design/containercircle.dart';
import 'package:walkthrough_test/algorithm/screensize.dart';
import 'package:walkthrough_test/elements/label.dart';
import 'package:walkthrough_test/home/home.dart';
import 'package:walkthrough_test/themeData/theme.dart';

class AppSignUp extends StatelessWidget {
  const AppSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      debugShowCheckedModeBanner: false,
      home: const AppSignUpState(),
    );
  }
}

class AppSignUpState extends StatefulWidget {
  const AppSignUpState({super.key});

  @override
  createState() => _AppSignUpSate();
}

class _AppSignUpSate extends State<AppSignUpState> {
  void doSomething() {}
  void checkSignIn() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AppHomeUi()));
  }

  var mailController = TextEditingController();
  var pwdController = TextEditingController();
  var cPwdController = TextEditingController();
  String mailString = "";
  String pwdString = "";
  String cPwdString = "";

  bool visiblePwd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: const Color.fromARGB(255, 107, 230, 236),
        body: SingleChildScrollView(
          reverse: true,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Stack(
            children: [
              const ContainerCircle(
                height: 0.5,
              ),
              Column(
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
                      height: screenheight(context) * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset(
                          'assets/food1.png',
                          fit: BoxFit.contain,
                        ),
                      )),
                  // SizedBox(height: screenheight(context) * 0.05),
                  SizedBox(
                      height: screenheight(context) * 0.1,
                      child: Padding(
                          padding: EdgeInsets.only(
                              right: screenwidth(context) * 0.3),
                          child: const Text(
                            // textAlign: TextAlign.left,
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                fontFamily: 'joti'),
                          ))),
                  SizedBox(
                    height: screenheight(context) * 0.1,
                    width: screenwidth(context) * 0.8,
                    child: Row(children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: mailController,
                            decoration: InputDecoration(
                              prefixIcon: SizedBox(
                                  width: 20,
                                  height: 20,
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
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              controller: pwdController,
                              onChanged: (value) => {value = "hi "},
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
                      height: screenheight(context) * 0.1,
                      width: screenwidth(context) * 0.8,
                      child: Row(children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              onChanged: (value) => {value = "hi "},
                              textAlign: TextAlign.center,
                              controller: cPwdController,
                              decoration: InputDecoration(
                                prefixIcon: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: Image.asset(
                                      "assets/keyiconorg.png",
                                    )),
                                hintText: "Confirm Password",
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
                              onPressed:
                                  cPwdString == pwdString ? checkSignIn : null,
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 16),
                              )))),
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
    cPwdController.addListener(() {
      setState(() {
        cPwdString = cPwdController.text;
      });
    });
  }

  @override
  void dispose() {
    mailController.dispose();
    pwdController.dispose();
    cPwdController.dispose();
    super.dispose();
  }
}
