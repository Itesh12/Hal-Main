import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/drawer/station_partner_form_model.dart';
import '../http/api_provider.dart';

class StationPartnerForm {
  StationPartnerForm(this.ref);

  final Ref ref;

  Future<void> stationPartnerFormSubmit(
      {required StationPartnerFormModel stationPartnerdata,
      List<File>? images}) async {
    final FormData formData = FormData.fromMap(stationPartnerdata.toJson());

    if (images!.isNotEmpty) {
      final List<MapEntry<String, MultipartFile>> formImages = [];
      for (final image in images) {
        final fileName = image.path.split('/').last;
        final ms = MapEntry(
          'adhaarVerify',
          await MultipartFile.fromFile(image.path, filename: fileName),
        );
        formImages.add(ms);
      }
      formData.files.addAll(formImages);
    }

    final res = await ref.read(apiProvider).post(
      '/ks/ksPartner/',
      body: formData,
      contentType: ContentType.multipart,
    );
    debugPrint(res.toString());
    debugPrint(formData.toString());

    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }
}
