import 'package:flutter/material.dart';
import 'package:food_2_hunger/algorithm/screensize.dart';

class MyApp1 extends StatelessWidget {
  final List<Map<String, String>> specialOffers = [
    {'name': 'Fresh Vegetables', 'price': 'Rs. 100'},
    {'name': 'Exotic Fruits', 'price': 'Rs. 150'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
    {'name': 'Organic Honey', 'price': 'Rs. 250'},
  ];

  MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildSaleBanner(),
              _buildSpecialOffersTitle(),
              _buildSpecialOffersList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaleBanner() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(0, 2))],
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Get upto 10% off on Special Offers',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '10%',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialOffersTitle() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: const Row(
        children: <Widget>[
          Text(
            'New Collection',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialOffersList(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 10, // Assuming you always have 3 special offers
        itemBuilder: (context, index) {
          return _buildSpecialOfferItem(
              specialOffers[index % specialOffers.length]);
        },
      ),
    );
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
}
