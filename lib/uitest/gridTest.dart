import 'package:flutter/material.dart';
import 'package:food_2_hunger/themeData/theme.dart';

class uitest extends StatelessWidget {
  const uitest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      home: const uiTestStatefulState(),
    );
  }
}

class uiTestStatefulState extends StatefulWidget {
  const uiTestStatefulState({super.key});

  @override
  createState() => _uiTestStateful();
}

class _uiTestStateful extends State<uiTestStatefulState> {
  final List<Map<String, String>> specialOffers = [
    {'name': 'Fresh Vegetables', 'price': 'Rs. 100'},
    {'name': 'Exotic Fruits', 'price': 'Rs. 150'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('MarketPlace'),
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () => {},
            ),
          ],
        ),
        body: ListView(children: [
          if (specialOffers.isNotEmpty)
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: specialOffers.map((offer) {
                return _buildSpecialOfferItem(offer);
              }).toList(),
            ),
          if (specialOffers.isNotEmpty)
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: specialOffers.map((offer) {
                return _buildSpecialOfferItem(offer);
              }).toList(),
            ),
          if (specialOffers.isNotEmpty)
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: specialOffers.map((offer) {
                return _buildSpecialOfferItem(offer);
              }).toList(),
            ),
        ]));
  }
}

Widget _buildSpecialOfferItem(Map<String, String> item) {
  return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          width: 130.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                  child: Image.asset(
                    'assets/clothesorg.png',
                  ),
                ),
                Text(
                  item['name']!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item['price']!,
                  style: const TextStyle(
                    fontSize: 8.0,
                  ),
                ),
              ],
            ),
          )));
}
