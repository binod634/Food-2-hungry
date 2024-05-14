import 'package:food_2_hunger/database/order.dart';
import 'package:sqflite/sqflite.dart';

const databaseName = "hunger.db";
const dataTable = "orders";
Database? databaseInstance;

Future<Database> connectDatabase() async {
  return databaseInstance ??= await openDatabase(databaseName);
}

void closeDatabase(Database? db) async {
  await db?.close();
}

void insertData(
    String? imageurl, String title, String? description, String? location) {
  databaseInstance!.insert(dataTable, {
    OrderData.imageUrl.name: imageurl,
    OrderData.title.name: title,
    OrderData.description.name: description,
    OrderData.location.name: location
  });
}

Future<List<Map<String, Object?>>> getOrderData() {
  return databaseInstance!.query(dataTable);
}
