import 'package:flutter/material.dart';
import 'package:food_2_hunger/database/database.dart';

class Databaseinspector extends StatelessWidget {
  const Databaseinspector({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DatabaseinspectorStateful(),
    );
  }
}

class DatabaseinspectorStateful extends StatefulWidget {
  const DatabaseinspectorStateful({super.key});

  @override
  createState() => _DatabaseinspectorStatefulState();
}

class _DatabaseinspectorStatefulState extends State<DatabaseinspectorStateful> {
  List<Map<String, Object?>> somethings = List.empty();
  Future<void> _fetchOrderData() async {
    final data = await getOrderData();
    setState(() {
      somethings = data;
    });
  }

  @override
  void initState() {
    _fetchOrderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(somethings.isEmpty ? "null" : somethings.join())));
  }
}
