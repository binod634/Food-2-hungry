import 'package:flutter/material.dart';
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
      // backgroundColor: const Color.fromARGB(255, 107, 230, 236),
      body: Stack(
        children: [
          const ContainerCircle(),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            // padding: EdgeInsets.only(
            // top: MediaQuery.of(context).size.width * 0.5),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Text("Food 2 Hunger")),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'assets/food1.png',
                      fit: BoxFit.contain,
                    ),
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.3),
                      child: const Text(
                        // textAlign: TextAlign.left,
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontFamily: 'joti'),
                      ))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.8,
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
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.8,
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
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.3,
                          right: MediaQuery.of(context).size.width * 0.3),
                      child: FilledButton(
                          onPressed: doSomething,
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 16),
                          )))),
              // SizedBox(
              // height: MediaQuery.of(context).size.height * 0.5,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
