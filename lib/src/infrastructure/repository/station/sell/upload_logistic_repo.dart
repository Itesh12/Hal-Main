import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/controller/station/upload_logistics_controller.dart';
import 'package:kisaan_station/src/infrastructure/http/api_provider.dart';
import 'package:dio/dio.dart';

import '../../../../model/station/logistics/sell/upload_logistics_model.dart';

class UploadLogisticRepo {
  UploadLogisticRepo(this.ref);

  final Ref ref;

  Future<List<LogisticsRegistrationResponse>> submitLogisticsData() async {
    final List<LogisticsRegistrationResponse> response = [];

    final logisticBody = LogisticModel(
        ownerDetails: ref.read(logisticsOwnerDetailProvider)!,
        driverDetails: ref.read(logisticsDriverDetailProvider)!,
        bankDetails: ref.read(logisticsBankDetailsProvider)!,
        vehicleDetails: ref.read(logisticsVehicleDetailsProvider)!,
        address: ref.read(logisticsAddressDetailProvider)!);


    final res = await ref
        .read(apiProvider)
        .post('/hs-logistics/create', body: logisticBody.toJson());

    res.when(success: (source) {
      debugPrint(source.toString());
      response.add(LogisticsRegistrationResponse.fromJson(source));
    }, error: (error) {
      throw error;
    });
    return response;
  }

  Future<dynamic> submitLogisticsImages(String hsId) async {
    final kycDetails = ref.read(logisticsKycDetailsProvider);


    String message = '';

    final aadhaar = ref.read(aadhaarImageListProvider);
    final pan = ref.read(panImageListProvider);
    final rc = ref.read(rcImageListProvider);
    final dl = ref.read(dlImageListProvider);
    final insurance = ref.read(insuranceImageListProvider);
    final pollution = ref.read(pucImageListProvider);

    final FormData formData = FormData.fromMap(kycDetails!.toJson());
    
    formData.fields.add(MapEntry('hsId', hsId));

    formData.files.addAll(await addImages('aadhaar', aadhaar));
    formData.files.addAll(await addImages('pan', pan));
    formData.files.addAll(await addImages('rc', rc));
    formData.files.addAll(await addImages('dl', dl));
    formData.files.addAll(await addImages('insurance', insurance));
    formData.files.addAll(await addImages('pollution', pollution));
    formData.files.addAll(await addImages('vehiclePhotos', pollution));


    final res = await ref.read(apiProvider).post(
        '/hs-logistics/upload-documents',
        body: formData,
        contentType: ContentType.multipart);

    res.when(success: (source) {
      debugPrint(source.toString());
      message = source['message'];
    }, error: (error) {
      debugPrint(error.toString());
      throw error;
    });
    return message;
  }

  Future<List<MapEntry<String, MultipartFile>>> addImages(
      String type, List<File> images) async {
    final List<MapEntry<String, MultipartFile>> formImages = [];
    if (images.isNotEmpty) {
      for (final image in images) {
        final fileName = image.path.split('/').last;
        final ms = MapEntry(
          type,
          await MultipartFile.fromFile(image.path, filename: fileName),
        );
        formImages.add(ms);
      }
    }
    return formImages;
  }



  Future<void> getLogisticsDetail() async {






  }
}

