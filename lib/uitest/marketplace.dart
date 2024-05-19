import 'package:flutter/material.dart';
import 'package:food_2_hunger/database/order.dart';
import 'package:food_2_hunger/elements/bottomnavigation.dart';
import 'package:food_2_hunger/themeData/theme.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightColorScheme,
      home: const UiTestStatefulState(),
    );
  }
}

class UiTestStatefulState extends StatefulWidget {
  const UiTestStatefulState({super.key});

  @override
  createState() => _UiTestStateful();
}

class _UiTestStateful extends State<UiTestStatefulState> {
  final List<Map<String, String>> specialOffers = [
    {
      OrderData.title.name: 'Hand Plot',
      OrderData.location.name: 'Rs. 100',
      OrderData.imageUrl.name: "assets/cloth.png"
    },
    {
      OrderData.title.name: 'Exotic Fruits',
      OrderData.location.name: 'Rs. 150',
      OrderData.imageUrl.name: "assets/plot.png"
    },
    {
      OrderData.title.name: 'Organic Honey',
      OrderData.location.name: 'Rs. 250',
      OrderData.imageUrl.name: "assets/card.png"
    },
    {
      OrderData.title.name: 'Organic Honey',
      OrderData.location.name: 'Rs. 250',
      OrderData.imageUrl.name: "assets/purse.png"
    },
    {
      OrderData.title.name: 'Organic Honey',
      OrderData.location.name: 'Rs. 250',
      OrderData.imageUrl.name: "assets/plot1.png"
    },
    {
      OrderData.title.name: 'Organic Honey',
      OrderData.location.name: 'Rs. 250',
      OrderData.imageUrl.name: "assets/plot.png"
    },
    {
      OrderData.title.name: 'Organic Honey',
      OrderData.location.name: 'Rs. 250',
      OrderData.imageUrl.name: "assets/cloth.png"
    },
    {
      OrderData.title.name: 'Organic Honey',
      OrderData.location.name: 'Rs. 250',
      OrderData.imageUrl.name: "assets/plot.png"
    },
    {
      OrderData.title.name: 'Organic Honey',
      OrderData.location.name: 'Rs. 250',
      OrderData.imageUrl.name: "assets/purse.png"
    },
    {
      OrderData.title.name: 'Organic Honey',
      OrderData.location.name: 'Rs. 250',
      OrderData.imageUrl.name: "assets/card.png"
    },
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
        _buildSaleBanner(),
        _buildSpecialOffersTitle("Recent Items"),
        _buildOfferItem(specialOffers),
        _buildSpecialOffersTitle("Recent Items"),
        _buildOfferItem(specialOffers),
        _buildSpecialOffersTitle("Recent Items"),
        _buildOfferItem(specialOffers),
        _buildSpecialOffersTitle("Recent Items"),
        _buildOfferItem(specialOffers),
      ]),
      bottomNavigationBar: const BottomNavigation(),
    );
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
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius as needed
                    child: Image.asset(
                      item[OrderData.imageUrl.name]!,
                      fit: BoxFit
                          .cover, // Use cover to fill the curved container
                    ),
                  ),
                ),
                Text(
                  item[OrderData.title.name]!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item[OrderData.location.name]!,
                  style: const TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          )));
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

Widget _buildSpecialOffersTitle(str) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    child: Row(
      children: <Widget>[
        Text(
          str,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _buildOfferItem(List<Map<String, String>> specialOffers) {
  return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: specialOffers.map((offer) {
        return _buildSpecialOfferItem(offer);
      }).toList());
}
