import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<void> saveFile(File file) async {
  Directory path = await getApplicationDocumentsDirectory();
  File(path.path).writeAsBytes(file.readAsBytesSync());
}
