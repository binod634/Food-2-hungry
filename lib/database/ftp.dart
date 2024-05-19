import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> saveFile(File file) async {
  Directory path = await getApplicationDocumentsDirectory();
  File(path.path).writeAsBytes(file.readAsBytesSync());
  return path.path + file.path;
}
