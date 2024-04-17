import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_2_hunger/algorithm/screensize.dart';
import 'package:food_2_hunger/design/profilecontainer.dart';
import 'package:food_2_hunger/elements/bottomnavigation.dart';
import 'package:food_2_hunger/elements/label.dart';
import 'package:food_2_hunger/themeData/theme.dart';

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
  final ImagePicker picker = ImagePicker();
  List<XFile> images = List.empty(growable: true);

  void doSomethings() {}
  void pickImages() async {
    final ImagePicker picker = ImagePicker();
    List<XFile> tmp = await picker.pickMultiImage();
    setState(() {
      images = tmp;
    });
  }

  void removeImageFromList(index) {
    setState(() {
      images.removeAt(index);
    });
  }

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
                          images.isEmpty
                              ? GestureDetector(
                                  onTap: pickImages,
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
                                )
                              : SizedBox(
                                  height: 120, // Specify a height here
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return Stack(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.file(
                                              File(images[i].path),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            right: 1,
                                            child: GestureDetector(
                                              onTap: () {
                                                removeImageFromList(i);
                                              },
                                              child: const Icon(Icons.cancel,
                                                  color: Colors.red),
                                            ),
                                          )
                                        ],
                                      );
                                    },
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
