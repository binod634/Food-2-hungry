import 'dart:io';

import 'package:food_2_hunger/database/database.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:image_picker/image_picker.dart';

FTPConnect ftpAuth = FTPConnect(ip, user: 'anonymous', pass: 'anonymous');

void fileUpload(File url, String remoteName) async {
  try {
    File fileToUpload = File(url.path);
    await ftpAuth.connect();
    await ftpAuth.uploadFile(fileToUpload, sRemoteName: remoteName);
    await ftpAuth.disconnect();
  } catch (e) {
    print("Annomy Alert: $e");
  }
}

void multipleFileUpload(List<String> urls) async {
  try {
    for (String url in urls) {
      File fileToUpload = File(url);
      await ftpAuth.connect();
      await ftpAuth.uploadFile(fileToUpload);
      await ftpAuth.disconnect();
    }
  } catch (e) {
    // Handle error
    print('Error: $e');
  }
}
