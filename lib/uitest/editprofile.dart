import 'package:flutter/material.dart';
import 'package:food_2_hunger/algorithm/screensize.dart';
import 'package:food_2_hunger/design/profilecontainer.dart';
import 'package:food_2_hunger/elements/bottomnavigation.dart';
import 'package:food_2_hunger/elements/label.dart';
import 'package:food_2_hunger/themeData/theme.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      home: const EditProfileStateful(),
    );
  }
}

class EditProfileStateful extends StatefulWidget {
  const EditProfileStateful({super.key});

  @override
  createState() => _EditProfileStatefulState();
}

class _EditProfileStatefulState extends State<EditProfileStateful> {
  String name = ''; // Add more fields as needed for editing

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
              Column(
                children: [
                  SizedBox(height: screenheight(context) * 0.05),
                  SizedBox(
                    width: screenwidth(context),
                    height: screenheight(context) * 0.1,
                    child: titleLabel(context,
                        str: "Edit Profile",
                        align: TextAlign.center,
                        ssize: 32),
                  ),
                  Stack(alignment: Alignment.topCenter, children: [
                    Column(children: [
                      SizedBox(
                        height: screenheight(context) * 0.7,
                        width: screenwidth(context) * 0.8,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0.0, 10),
                                blurRadius: 10,
                                color: Color.fromARGB(255, 209, 209, 209),
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                returnEditBodyText("Name"),
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Binod Kandel",
                                  ),
                                ),
                                const SizedBox(height: 15),
                                returnEditBodyText("Email"),
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Kandelbinod634@gmail.com",
                                  ),
                                ),
                                const SizedBox(height: 15),
                                returnEditBodyText("Contact"),
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "9765571925",
                                  ),
                                ),
                                SizedBox(height: screenheight(context) * 0.04),
                                Center(
                                  child: SizedBox(
                                    // width: screenwidth(context),
                                    height: screenheight(context) * 0.15,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Implement logic for changing profile picture
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.grey,
                                                offset: Offset(0, 5))
                                          ],
                                          color: Colors.grey[200],
                                        ),
                                        child: ClipOval(
                                          child: Image.asset(
                                            "assets/image.jpeg",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenheight(context) * 0.01),
                                const Center(
                                  child: Text(
                                    "Change Profile Picture",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Center(
                                  child: FilledButton(
                                      onPressed: doSomethings,
                                      child: const Text("Update Changes")),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ])
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

Text returnEditBodyText(String str) {
  return Text(
    str,
    style: const TextStyle(fontSize: 20),
  );
}
