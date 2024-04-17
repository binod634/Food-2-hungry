import 'package:flutter/material.dart';
import 'package:walkthrough_test/algorithm/navigate.dart';
import 'package:walkthrough_test/algorithm/screensize.dart';
import 'package:walkthrough_test/design/profilecontainer.dart';
import 'package:walkthrough_test/elements/bottomnavigation.dart';
import 'package:walkthrough_test/elements/label.dart';
import 'package:walkthrough_test/themeData/theme.dart';
import 'package:walkthrough_test/uitest/editprofile.dart';
import 'package:walkthrough_test/uitest/profilelabel.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightColorScheme, home: const ProfileStateful());
  }
}

class ProfileStateful extends StatefulWidget {
  const ProfileStateful({super.key});

  @override
  createState() => _ProfileStatefulState();
}

class _ProfileStatefulState extends State<ProfileStateful> {
  void doSomethings() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              ProfileContainer(
                height: 0.65,
                topColor: Theme.of(context).colorScheme.background,
                bottomColor: Colors.white,
              ),
              Column(children: [
                SizedBox(height: screenheight(context) * 0.05),
                SizedBox(
                  width: screenwidth(context),
                  height: screenheight(context) * 0.1,
                  child: titleLabel(context,
                      align: TextAlign.center, str: "About Us", ssize: 32),
                ),
                SizedBox(
                  height: screenheight(context) * 0.3,
                  width: screenwidth(context) * 0.6,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: screenheight(context) * 0.075),
                          SizedBox(
                            height: screenheight(context) * 0.225,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0.0, 10),
                                        blurRadius: 10,
                                        color:
                                            Color.fromARGB(255, 209, 209, 209),
                                        spreadRadius: 1)
                                  ]),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: screenheight(context) * 0.075),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Binod Kandel",
                                        style: TextStyle(
                                            fontSize: 24, fontFamily: "jua"),
                                      ),
                                      const Text(
                                        "Volunteer",
                                        style: TextStyle(
                                            fontSize: 20, fontFamily: "jua"),
                                      ),
                                      FilledButton(
                                        onPressed: () {
                                          navigatorNavigateTo(context,
                                              navigationChild:
                                                  const EditProfile());
                                        },
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color.fromARGB(
                                                        255, 195, 206, 216))),
                                        child: const Text("Edit Profile"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset.zero,
                                    blurRadius: 15,
                                    color: Colors.grey,
                                    spreadRadius: 1)
                              ]),
                          height: screenheight(context) * 0.15,
                          width: screenheight(context) * 0.15,
                          child: const CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/image.jpeg",
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: screenheight(context) * 0.025),
                const ProfileLabel(
                    leadingIcon: Icons.location_on,
                    titleString: "Address",
                    dataString: "Manigram - 32907"),
                const ProfileLabel(
                    leadingIcon: Icons.phone,
                    titleString: "Contact",
                    dataString: "9765571925"),
                const ProfileLabel(
                    leadingIcon: Icons.mail,
                    titleString: "EMail",
                    dataString: "Kandelbinod634@gmail.com"),
                const ProfileLabel(
                    leadingIcon: Icons.workspace_premium_sharp,
                    titleString: "Role",
                    dataString: "Volunteer")
              ])
            ],
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
