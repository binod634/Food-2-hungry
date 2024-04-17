import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:food_2_hunger/Login/login.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnimatedSplashScreen(
            splash: 'assets/childtrans1.png',
            splashIconSize: 250,
            backgroundColor: const Color.fromARGB(255, 188, 207, 255),
            nextScreen: const WalkthroughState()));
  }
}

class WalkthroughState extends StatefulWidget {
  const WalkthroughState({super.key});

  @override
  State<StatefulWidget> createState() => _Walkthrough();
}

class _Walkthrough extends State<WalkthroughState> {
  /*here we have a list of OnbordingScreen which we want to have, each OnbordingScreen have a imagePath,title and an desc.
      */
  final List<OnbordingData> list = [
    const OnbordingData(
      titlePadding: EdgeInsets.all(0),
      descPadding: EdgeInsets.all(0),
      image: AssetImage("assets/poor_children.jpg"),
      titleText: Text(
        "This is Title1",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      descText: Text("This is desc1"),
    ),
    const OnbordingData(
      image: AssetImage("assets/poor_children.jpg"),
      titleText: Text("This is Title2"),
      descText: Text("This is desc2"),
    ),
    const OnbordingData(
      image: AssetImage("assets/children.jpg"),
      titleText: Text("This is Title3"),
      descText: Text("This is desc4"),
    ),
    const OnbordingData(
      image: AssetImage("assets/children.jpg"),
      titleText: Text("This is Title4"),
      descText: Text("This is desc4"),
    ),
  ];

  _Walkthrough();

  @override
  Widget build(BuildContext context) {
    /* remove the back button in the AppBar is to set automaticallyImplyLeading to false
  here we need to pass the list and the route for the next page to be opened after this. */
    return Scaffold(
        body: IntroScreen(
      onbordingDataList: list,
      colors: const [
        //list of colors for per pages
        Colors.white,
        Colors.red,
      ],
      pageRoute: MaterialPageRoute(
        builder: (context) => const AppLogin(),
      ),
      nextButton: const Text(
        "NEXT",
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
      lastButton: const Text(
        "GOT IT",
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
      skipButton: const Text(
        "SKIP",
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
      selectedDotColor: Colors.orange,
      unSelectdDotColor: Colors.grey,
    ));
  }
}
