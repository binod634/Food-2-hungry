import 'package:flutter/material.dart';
import 'package:walkthrough_test/Login/login.dart';
import 'package:walkthrough_test/algorithm/screensize.dart';
import 'package:walkthrough_test/algorithm/shader.dart';
import 'package:walkthrough_test/elements/bottomnavigation.dart';
import 'package:walkthrough_test/elements/label.dart';
import 'package:walkthrough_test/design/cardcontainer.dart';
import 'package:walkthrough_test/themeData/theme.dart';
import 'package:walkthrough_test/uitest/adddonation.dart';

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
  List<Map<String, dynamic>> latestDonations = [
    {
      "title": "Helping Hands Organization",
      "amount": "\$100",
      "date": "April 1, 2024",
      "image": "assets/foodorg.png",
    },
    {
      "title": "Food for All Charity",
      "amount": "\$50",
      "date": "March 28, 2024",
      "image": "assets/clothesorg.png",
    },
    {
      "title": "Education Empowerment Fund",
      "amount": "\$80",
      "date": "March 25, 2024",
      "image": "assets/foodorg.png",
    },
    {
      "title": "MediCare Relief Initiative",
      "amount": "\$120",
      "date": "March 20, 2024",
      "image": "assets/firstaidorg.png",
    },
    {
      "title": "Clothing Drive Foundation",
      "amount": "\$70",
      "date": "March 15, 2024",
      "image": "assets/foodorg.png",
    },
    {
      "title": "Clothing Drive Foundation",
      "amount": "\$70",
      "date": "March 15, 2024",
      "image": "assets/foodorg.png",
    },
    {
      "title": "Random Food Foundation",
      "amount": "\$70",
      "date": "March 11, 2023",
      "image": "assets/foodorg.png",
    },
    {
      "title": "Clothing Drive Foundation",
      "amount": "\$70",
      "date": "March 15, 2024",
      "image": "assets/foodorg.png",
    },
    {
      "title": "Clothing Drive Foundation",
      "amount": "\$70",
      "date": "March 15, 2024",
      "image": "assets/foodorg.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SizedBox(
              width: screenwidth(context) * 0.9,
              child: ListView(
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
                              onPressed: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
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
                  SizedBox(height: screenheight(context) * 0.025),
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
                    height: screenheight(context) * 0.025,
                  ),
                  SizedBox(
                    height: screenheight(context) * 0.05,
                    width: screenwidth(context) * 0.9,
                    child: Text(
                      "Donate",
                      style: returnHeaderTextStyle(context),
                    ),
                  ),
                  SizedBox(height: screenheight(context) * 0.025),
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
                    height: screenheight(context) * 0.025,
                  ),
                  SizedBox(
                    height: screenheight(context) * 0.05,
                    width: screenwidth(context) * 0.9,
                    child: Text(
                      "Latest Donation",
                      style: returnHeaderTextStyle(context),
                    ),
                  ),
                  SizedBox(
                    height: screenheight(context) * 0.025,
                  ),
                  SizedBox(
                      height: screenheight(context) * 0.6,
                      child: ListView(children: [
                        for (int i = 0; i < latestDonations.length; i++)
                          DonationItem(
                            donation: latestDonations[i],
                          )
                      ])),
                ],
              )),
        ),
        bottomNavigationBar: const BottomNavigation());
  }
}

TextStyle returnHeaderTextStyle(BuildContext context) {
  return TextStyle(
      fontFamily: "joti",
      fontWeight: FontWeight.bold,
      fontSize: 28,
      shadows: [universalShadow()],
      color: Theme.of(context).colorScheme.surface);
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
            CircleAvatar(
              backgroundImage: AssetImage(donation["image"]),
              radius: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    donation["title"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Donated: ${donation["amount"]}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Date: ${donation["date"]}",
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
