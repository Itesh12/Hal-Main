import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/controller/disease_detection/disease_detection_controller.dart';
import 'package:kisaan_station/src/infrastructure/http/api_provider.dart';
import 'package:kisaan_station/src/model/disease_detection/diease_detection_model.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

class DiseaseDetectionRepo {
  DiseaseDetectionRepo(this.ref);
  final Ref ref;

  Future<List<SearchResults>> searchDisease(String kw) async {
    final List<SearchResults> result = [];
    final res = await ref.read(apiProvider).get('/disease/getPlant?search=$kw');

    res.when(success: (source) {
      final List resList = source;
      for (final element in resList) {
        result.add(SearchResults.fromJson(element));
      }
    }, error: (error) {
      throw error;
    });
    return result;
  }

  Future<List<DiseaseGetModel>> getDiseaseCrop(int page) async {
    final List<DiseaseGetModel> results = [];
    final res = await ref.read(apiProvider).get(
          '/disease/samples?userId=${UserPreferences.userId}&size=10&page=$page',
        );

    res.when(success: (source) {
      final List resList = source;
      for (final element in resList) {
        final model = DiseaseGetModel.fromJson(element);
        results.add(model);
      }
      }, error: (error) {
      throw error;
    });
    return results;
  }

  Future<bool> uploadDiseaseCrop() async {
    bool response = false;
    final diseaseModel = ref.read(uploadDiseaseProvider);

    final cropImage = ref.read(diseaseImageProvider);

    final formData = FormData.fromMap(diseaseModel!.toJson());

    formData.files.addAll(await addImages('diseaseSamples', cropImage));

    final res = await ref.read(apiProvider).post("/disease/upload-sample",
        body: formData, contentType: ContentType.multipart);

    res.when(success: (source) {
      if (source['message'].toString() == "Document updated") {
        response = true;
      }
      debugPrint(source.toString());
    }, error: (error) {
      throw error;
    });
    return response;
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
}
