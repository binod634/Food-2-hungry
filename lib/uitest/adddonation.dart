import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_2_hunger/database/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_2_hunger/algorithm/screensize.dart';
import 'package:food_2_hunger/design/profilecontainer.dart';
import 'package:food_2_hunger/elements/bottomnavigation.dart';
import 'package:food_2_hunger/elements/label.dart';
import 'package:food_2_hunger/themeData/theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mysql1/mysql1.dart';

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
  XFile? images;
  Position? locationData;
  String? locationErrorMsg;
  String? title;
  String? description;
  String? pickupLocation;
  String? phoneNumber;
  String? errorString;

  void doSomethings() {}
  void pickImages() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        images = image;
      }
    });
  }

  void removeImageFromList() {
    setState(() {
      images = null;
    });
  }

  bool checkNull(value) {
    if (value == null) {
      return true;
    }
    return false;
  }

  void valudateForm() {
    if (images != null) return;
    if (checkNull(title)) return;
    if (checkNull(pickupLocation)) return;
    if (checkNull(description)) return;
    if (checkNull(phoneNumber)) return;
    uploadToDatabase();
  }

  void uploadToDatabase() async {
    var conn = await MySqlConnection.connect(databaseSettings);
    await conn.query(
        'INSERT INTO donationdata (title, description, location, phone, image) VALUES (?, ?, ?, ?, ?)',
        [title, description, locationData, phoneNumber, images]);
  }

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationErrorMsg = "Location Disabled.";
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationErrorMsg = "Denied";
        });
      }
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      setState(() {
        locationErrorMsg = "Denied";
      });
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      locationData = position;
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
                          images == null
                              ? GestureDetector(
                                  onTap: pickImages,
                                  child: Container(
                                    height: 130,
                                    width: 130,
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
                                  child: Stack(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 120,
                                        width: 120,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.file(
                                            File(images!.path),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            removeImageFromList();
                                          },
                                          child: const Icon(Icons.cancel,
                                              color: Colors.red),
                                        ),
                                      )
                                    ],
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
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (value) {
                                  setState(() {
                                    title = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Name/Title.",
                                  icon: Icon(Icons.food_bank),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                onChanged: (value) {
                                  setState(() {
                                    description = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Short Description.",
                                  icon: Icon(Icons.description),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                onChanged: (value) {
                                  setState(() {
                                    pickupLocation = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Pickup Location.",
                                  icon: Icon(Icons.location_on),
                                ),
                              ),
                              MaterialButton(
                                onPressed: _determinePosition,
                                child: Text(locationData != null
                                    ? "${locationData!.longitude} + ${locationData!.latitude}"
                                    : "Click to get current location"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                onChanged: (value) {
                                  setState(() {
                                    phoneNumber = value;
                                  });
                                },
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    hintText: "Phone Number. *Optional",
                                    icon: Icon(Icons.phone)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FilledButton(
                                  onPressed: uploadToDatabase,
                                  child: const Text("Add Listing"))
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
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
