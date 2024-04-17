import 'dart:io';

import 'package:ftpconnect/ftpconnect.dart';

FTPConnect ftpAuth = FTPConnect('example.com', user: 'user', pass: 'pass');

void fileUpload(url) async {
  try {
    File fileToUpload = File(url);
    await ftpAuth.connect();
    await ftpAuth.uploadFile(fileToUpload);
    await ftpAuth.disconnect();
  } catch (e) {
    //error
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
