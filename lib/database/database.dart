import 'package:mysql1/mysql1.dart';

var databaseSettings = ConnectionSettings(
    host: '192.168.1.245',
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
