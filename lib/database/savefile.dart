import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> saveFile(File file) async {
  Directory directory = await getApplicationDocumentsDirectory();
  String filePath = '${directory.path}/${file.uri.pathSegments.last}';
  File newFile = File(filePath);
  await newFile.writeAsBytes(await file.readAsBytes());
  return filePath;
}
