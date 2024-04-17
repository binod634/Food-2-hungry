import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:walkthrough_test/algorithm/screensize.dart';
import 'package:walkthrough_test/design/profilecontainer.dart';
import 'package:walkthrough_test/elements/bottomnavigation.dart';
import 'package:walkthrough_test/elements/label.dart';
import 'package:walkthrough_test/themeData/theme.dart';

class FoodDonation extends StatelessWidget {
  const FoodDonation({super.key});

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
              Column(
                children: [
                  SizedBox(height: screenheight(context) * 0.05),
                  SizedBox(
                    width: screenwidth(context),
                    height: screenheight(context) * 0.1,
                    child: titleLabel(context,
                        align: TextAlign.center, str: "Donate Food", ssize: 32),
                  ),
                  SizedBox(
                    height: screenheight(context) * 0.8,
                    width: screenwidth(context) * 0.8,
                    child: Column(
                      children: [
                        Column(children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[100],
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 60,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const Text(
                            "Upload Images ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenheight(context) * 0.05,
                          )
                        ]),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Name/Title.",
                                  icon: Icon(Icons.food_bank),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Short Description.",
                                  icon: Icon(Icons.description),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Pickup Location.",
                                  icon: Icon(Icons.location_on),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Email Address",
                                    icon: Icon(Icons.mail)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Phone Number. *Optional",
                                    icon: Icon(Icons.phone)),
                              ),
                              SizedBox(height: 10),
                              Visibility(
                                visible: false,
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_today),
                                    SizedBox(width: 10),
                                    Text(
                                      "Pick-up Date:",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    // DatePickerDialog(
                                    //     firstDate: DateTime.now(),
                                    //     lastDate: DateTime.now())
                                    // Replace with actual DatePicker widget
                                    // const DatePicker(), // DatePicker implementation here
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Donation button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle donation submission logic here
              },
              child: const Text("Donate Food"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
