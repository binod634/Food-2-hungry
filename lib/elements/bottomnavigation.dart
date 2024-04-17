import 'package:flutter/material.dart';
import 'package:walkthrough_test/algorithm/navigate.dart';
import 'package:walkthrough_test/home/home.dart';
import 'package:walkthrough_test/uitest/adddonation.dart';
import 'package:walkthrough_test/home/profile.dart';

int navigationBarItem = 0;

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationStateful();
  }
}

class BottomNavigationStateful extends StatefulWidget {
  const BottomNavigationStateful({super.key});

  @override
  createState() => _BottomNavigationStatefulState();
}

class _BottomNavigationStatefulState extends State<BottomNavigationStateful> {
  void handleNavigation(context, value) {
    setState(() {
      navigationBarItem = value;
    });
    if (value == 0) {
      navigatorNavigateTo(context, navigationChild: const AppHomeUi());
    } else if (value == 1) {
      navigatorNavigateTo(context, navigationChild: const FoodDonation());
    } else if (value == 3) {
      navigatorNavigateTo(context, navigationChild: const Profile());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) => value != navigationBarItem
            ? handleNavigation(context, value)
            : null,
        currentIndex: navigationBarItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Donation"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ]);
  }
}
