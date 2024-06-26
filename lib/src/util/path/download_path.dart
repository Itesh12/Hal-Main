import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String?> getDownloadPath(String filename) async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
      // ignore: avoid_slow_async_io
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }
  } catch (err) {
    print("Cannot get download folder path");
  }
  return "${directory?.path}/$filename";
}
