import 'package:mysql1/mysql1.dart';

var databaseSettings = ConnectionSettings(
    host: '10.42.0.1',
    port: 3306,
    user: 'mysql',
    password: 'mysql',
    db: 'fooddb');

void connectDatabase() async {
  var conn = await MySqlConnection.connect(databaseSettings);
  var userId = 1;
  var results =
      await conn.query('select name, email from users where id = ?', [userId]);
}
