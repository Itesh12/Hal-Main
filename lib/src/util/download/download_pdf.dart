import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/util/path/download_path.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadNotifier extends StateNotifier<double> {
  DownloadNotifier(this.cropId) : super(0.0);

  final String cropId;

  Dio dio = Dio();

  Future<void> startDownloading(
      {required String fileName,
      required String url,
      required String cropId}) async {
    if (await getPermission()) {
      final String? path = await getDownloadPath("$fileName.pdf");

      print(url);
      print(path);
      if (path != null) {
        await dio.download(
          url,
          path,
          onReceiveProgress: (recivedBytes, totalBytes) {
            print('hi: $totalBytes , $recivedBytes');
            state = recivedBytes / totalBytes;
            if (state == 1.0) {
              state = 0;
            }
          },
        );
      }
    }
  }

  //get storage permission
  Future<bool> getPermission() async {
    final val = await Permission.storage.request();

    return val.isGranted;
  }
}
