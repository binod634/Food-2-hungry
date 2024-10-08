import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_2_hunger/Login/login.dart';
import 'package:food_2_hunger/algorithm/screensize.dart';
import 'package:food_2_hunger/algorithm/shader.dart';
import 'package:food_2_hunger/database/database.dart';
import 'package:food_2_hunger/database/order.dart';
import 'package:food_2_hunger/elements/bottomnavigation.dart';
import 'package:food_2_hunger/elements/label.dart';
import 'package:food_2_hunger/design/cardcontainer.dart';
import 'package:food_2_hunger/themeData/theme.dart';
import 'package:food_2_hunger/uitest/adddonation.dart';

import '../algorithm/navigate.dart';

class AppHomeUi extends StatelessWidget {
  const AppHomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      home: const AppHomeUiState(),
    );
  }
}

class AppHomeUiState extends StatefulWidget {
  const AppHomeUiState({super.key});

  @override
  createState() => _AppHomeUiStateState();
}

class _AppHomeUiStateState extends State<AppHomeUiState> {
  int currentBottomBarindex = 0;
  void doSomething() {}

  @override
  void initState() {
    super.initState();
    connectDatabase();
    getDonationList();
  }

  void getDonationList() async {
    List<Map<String, Object?>> tmpDonation = await getOrderData();

    setState(() {
      latestDonations = tmpDonation;
    });
  }

  List<Map<String, dynamic>> latestDonations = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigation(),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SizedBox(
              width: screenwidth(context) * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenheight(context) * 0,
                    ),
                    SizedBox(
                      height: screenheight(context) * 0.1,
                      child: Row(
                        children: [
                          Container(
                              width: screenwidth(context) * 0.7,
                              alignment: Alignment.centerLeft,
                              child: titleLabel(context,
                                  ssize: 28, align: TextAlign.start)),
                          Container(
                              width: screenwidth(context) * 0.2,
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => const AppLogin(),
                                )),
                                child: const CircleAvatar(
                                  child: Text(
                                    "A",
                                    style: TextStyle(
                                        fontFamily: 'joti',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: screenheight(context) * 0.02),
                    SizedBox(
                      height: screenheight(context) * 0.25,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF89ECF0)),
                          child: Stack(children: [
                            SizedBox.expand(
                              child: SizedBox(
                                width: screenwidth(context) * 0.45,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: screenwidth(context) * 0.4),
                                    child: Image.asset("assets/food1.png")),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: screenheight(context) * 0.1,
                                  width: double.infinity,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 12, top: 12),
                                    child: Text(
                                      "Together Let's end hunger.\nOne Donation at a time.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenheight(context) * 0.05,
                                ),
                                SizedBox(
                                  height: screenheight(context) * 0.05,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          right: screenwidth(context) * 0.55,
                                          left: screenwidth(context) * 0.05),
                                      child: MaterialButton(
                                        color: const Color(0xFF1F7074),
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () => navigatorNavigateTo(
                                            context,
                                            navigationChild:
                                                const FoodDonation()),
                                        child: const Text(
                                          "Donate",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                )
                              ],
                            )
                          ])),
                    ),
                    SizedBox(
                      height: screenheight(context) * 0.02,
                    ),
                    SizedBox(
                      height: screenheight(context) * 0.05,
                      width: screenwidth(context) * 0.9,
                      child: Text(
                        "Donate",
                        style: returnHeaderTextStyle(
                            Theme.of(context).colorScheme.surface),
                      ),
                    ),
                    SizedBox(height: screenheight(context) * 0.02),
                    SizedBox(
                      height: screenheight(context) * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          returnHomeCardContainer(context,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              img: "assets/foodorg.png",
                              label: "Food"),
                          returnHomeCardContainer(context,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              img: "assets/clothesorg.png",
                              label: "Clothes"),
                          returnHomeCardContainer(context,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              img: "assets/educationorg.png",
                              label: "Education"),
                          returnHomeCardContainer(context,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              img: "assets/firstaidorg.png",
                              label: "Medicine"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenheight(context) * 0.02,
                    ),
                    SizedBox(
                      height: screenheight(context) * 0.05,
                      width: screenwidth(context) * 0.9,
                      child: Text(
                        "Latest Donation",
                        style: returnHeaderTextStyle(
                            Theme.of(context).colorScheme.surface),
                      ),
                    ),
                    SizedBox(
                      height: screenheight(context) * 0.02,
                    ),
                    latestDonations.isNotEmpty
                        ? Column(children: [
                            for (var i = 0; i < latestDonations.length; i++)
                              DonationItem(donation: latestDonations[i])
                          ])
                        : addDonationUsage(
                            height: screenheight(context) * 0.25,
                            weight: screenwidth(context) * 0.8),
                  ],
                ),
              )),
        ));
  }
}

TextStyle returnHeaderTextStyle(Color color) {
  return TextStyle(
      fontFamily: "joti",
      fontWeight: FontWeight.bold,
      fontSize: 28,
      shadows: [universalShadow()],
      color: color);
}

class DonationItem extends StatelessWidget {
  final Map<String, dynamic> donation;

  const DonationItem({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenheight(context) * 0.025),
      child: Container(
        width: screenwidth(context) * 0.9,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: ClipOval(
                child: Image.file(
                  File(donation[OrderData.imageUrl.name] ?? "null"),
                  fit: BoxFit
                      .cover, // You can adjust the BoxFit property as needed
                  // child: Text(
                  // donation[OrderData.title.name],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    donation[OrderData.title.name],
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    maxLines: 1,
                    "Contact no: ${donation[OrderData.phoneNo.name]}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    maxLines: 1,
                    "Location: ${donation[OrderData.location.name]}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
