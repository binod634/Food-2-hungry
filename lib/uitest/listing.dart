import 'package:flutter/material.dart';
import 'package:food_2_hunger/algorithm/screensize.dart';
import 'package:food_2_hunger/design/profilecontainer.dart';
import 'package:food_2_hunger/elements/bottomnavigation.dart';
import 'package:food_2_hunger/elements/label.dart';
import 'package:food_2_hunger/themeData/theme.dart';

class ListingDonation extends StatelessWidget {
  const ListingDonation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      home: const ProfileStateful(),
    );
  }
}

class ProfileStateful extends StatefulWidget {
  const ProfileStateful({super.key});

  @override
  createState() => _ProfileStatefulState();
}

class _ProfileStatefulState extends State<ProfileStateful> {
  void doSomethings() {}

  // Dummy data for demonstration
  List<Map<String, dynamic>> itemList = [
    {
      'image': 'assets/image.jpeg',
      'title': 'Item 1',
      'description': 'Description for item 1',
      'time': '10:00 AM',
      'quantity': 2,
    },
    {
      'image': 'assets/image.jpeg',
      'title': 'Item 2',
      'description': 'Description for item 2',
      'time': '11:30 AM',
      'quantity': 1,
    },
    {
      'image': 'assets/image.jpeg',
      'title': 'Item 2',
      'description': 'Description for item 2',
      'time': '11:30 AM',
      'quantity': 1,
    },
    {
      'image': 'assets/image.jpeg',
      'title': 'Item 2',
      'description': 'Description for item 2',
      'time': '11:30 AM',
      'quantity': 1,
    },
    {
      'image': 'assets/image.jpeg',
      'title': 'Item 2',
      'description': 'Description for item 2',
      'time': '11:30 AM',
      'quantity': 1,
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Stack(
            children: [
              ProfileContainer(
                height: 0.65,
                topColor: Theme.of(context).colorScheme.background,
                bottomColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(top: screenheight(context) * 0.05),
                child: Column(
                  children: [
                    SizedBox(
                      width: screenwidth(context),
                      height: screenheight(context) * 0.1,
                      child: titleLabel(
                        context,
                        align: TextAlign.center,
                        str: "Your Items",
                        ssize: 32,
                      ),
                    ),
                    SizedBox(
                      height: screenheight(context) * 0.7,
                      child: ListView.builder(
                        itemCount: itemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Theme.of(context).colorScheme.secondary,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(itemList[index]["image"]),
                              ),
                              title: Text(
                                itemList[index]["title"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemList[index]["description"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      // fontSize: 32
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Time: ${itemList[index]["time"]}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Quantity: ${itemList[index]["quantity"]}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              onTap: () {
                                // Handle tap on the item
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
