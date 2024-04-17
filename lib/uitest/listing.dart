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
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              onTap: () {
                                // Handle tap on the item
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: ClipOval(
                                        child: Image.asset(
                                          itemList[index]["image"],
                                          width:
                                              64, // Specify width of the circular image
                                          height:
                                              64, // Specify height of the circular image
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        width:
                                            16), // Add some space between leading and title
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            itemList[index]["title"],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(
                                              height:
                                                  8), // Add some space between title and description
                                          Text(
                                            itemList[index]["description"],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(
                                              height:
                                                  4), // Add some space between description and other subtitles
                                          Text(
                                            'Time: ${itemList[index]["time"]}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            'Quantity: ${itemList[index]["quantity"]}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
