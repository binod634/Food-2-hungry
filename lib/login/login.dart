import 'package:flutter/material.dart';
import 'package:food_2_hunger/algorithm/screensize.dart';
import 'package:food_2_hunger/design/containercircle.dart';
import 'package:food_2_hunger/themeData/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      debugShowCheckedModeBanner: false,
      home: const AppHome(),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  void doSomething() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const ContainerCircle(),
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
                      padding:
                          EdgeInsets.only(right: screenwidth(context) * 0.3),
                      child: const Text(
                        // textAlign: TextAlign.left,
                        "Login",
                        style: TextStyle(
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
                      child: const TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
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
                          onChanged: (value) => {value = "hi "},
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
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
                          onPressed: doSomething,
                          child: const Text(
                            "Login",
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
    );
  }

  titleLabel(BuildContext context) {}
}
