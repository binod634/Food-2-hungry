import 'package:food_2_hunger/database/order.dart';
import 'package:sqflite/sqflite.dart';

const databaseName = "hunger.db";
const dataTable = "orders";
Database? databaseInstance;

void createTable(Database db) {
  db.execute(
      "Create Table $dataTable(id integer primary key AUTOINCREMENT, ${OrderData.imageUrl.name} TEXT,${OrderData.title.name} TEXT,${OrderData.description.name} TEXT,${OrderData.location.name} TEXT,${OrderData.phoneNo.name} TEXT)");
}

Future<Database> connectDatabase() async {
  return databaseInstance ??= await openDatabase(
    version: 2,
    databaseName,
    onCreate: (db, version) => createTable(db),
  );
}

void closeDatabase() async {
  databaseInstance?.close();
}

void insertData(String imageurl, String title, String? description,
    String? location, String phone) {
  databaseInstance!.insert(dataTable, {
    OrderData.imageUrl.name: imageurl,
    OrderData.title.name: title,
    OrderData.description.name: description,
    OrderData.location.name: location,
    OrderData.phoneNo.name: phone
  });
}

Future<List<Map<String, Object?>>> getOrderData() async {
  databaseInstance ??=
      await connectDatabase(); // check and connect database if theere is nothing.
  return databaseInstance!.query(dataTable);
}

void deleteTable() {
  // TODO: remove this
  databaseInstance!.rawQuery("Delete  $dataTable;");
}

void dropTable() {
  // TODO: remove this
  databaseInstance!.rawQuery("Drop TABLE $dataTable;");
}
