import 'package:flutter_test/flutter_test.dart';
import 'package:food_2_hunger/database/database.dart';

void main() async {
  var db = await connectDatabase();
  test("database table check",
      () => expect(db.query("select * from randomdata"), null));
}
