import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/model/farm/crop_report_model.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../constants/colors.dart';
import '../../../model/farm/farm_entity.dart';
import '../../http/api_provider.dart';

class FarmRepo {
  FarmRepo(
    this.ref,
  );

  final Ref ref;

  Future<bool> addFarm(
      {required FarmDetails farm, required List<CropDetail> crops}) async {
    bool saved = false;
    final res = await ref.read(apiProvider).post(
      '/myFarm/farm-registration/',
      body: {
        "userId": UserPreferences.userId,
        "farmDetails": farm.toJson(),
        "cropDetails": List<dynamic>.from(crops.map((x) => x.toJson())),
      },
    );
    res.when(
      success: (source) {
        debugPrint(source["message"]);
        saved = true;
      },
      error: (error) {
        throw error;
      },
    );
    return saved;
  }



  Future<bool> addOtherFarm(
      {required FarmDetails farm, required List<CropDetail> crops, required String farmerName, required String mobileNo}) async {
    bool saved = false;
    final res = await ref.read(apiProvider).post(
      '/myFarm/farm-registration-others/',
      body: {
        "farmerName": farmerName,
        "mobileNo": mobileNo,
        "farmDetails": farm.toJson(),
        "cropDetails": List<dynamic>.from(crops.map((x) => x.toJson())),
      },
    );
    res.when(
      success: (source) {
        debugPrint(source["message"]);
        saved = true;
      },
      error: (error) {
        throw error;
      },
    );
    return saved;
  }


  Future<bool> editFarm(
      {required FarmDetails farm, required List<CropDetail> crops, required String farmId}) async {
    bool saved = false;
    final res = await ref.read(apiProvider).put(
      '/myFarm/farm-analysis/edit/$farmId',
      body: {
        "farmDetails": farm.toJson(),
        "cropDetails": List<dynamic>.from(crops.map((x) => x.toJson())),
      },
    );
    res.when(
      success: (source) {
        debugPrint(source["message"]);
        saved = true;
      },
      error: (error) {
        throw error;
      },
    );
    return saved;
  }


  Future<bool> editOtherFarm(
      {required FarmDetails farm, required List<CropDetail> crops, required String farmId, required String farmerName, required String mobileNo}) async {
    bool saved = false;
    final res = await ref.read(apiProvider).put(
      '/myFarm/farm-analysis/edit-other-farm/$farmId',
      body: {
        "farmerName" : farmerName,
        "mobileNo": mobileNo,
        "farmDetails": farm.toJson(),
        "cropDetails": List<dynamic>.from(crops.map((x) => x.toJson())),
      },
    );
    res.when(
      success: (source) {
        debugPrint(source["message"]);
        saved = true;
      },
      error: (error) {
        throw error;
      },
    );
    return saved;
  }

  Future<List<FarmEntity>> getMyFarmByMobile(
      {required String userId, required int page}) async {
    List<FarmEntity> myFarmList = [];

    final res = await ref.read(apiProvider).get(
        '/myFarm/farm-registration/details/',
        query: {"page": page, "mobileNo": userId, "size": 4});

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<FarmEntity> data =
            List<FarmEntity>.from(source.map((x) => FarmEntity.fromJson(x)));

        myFarmList = data;
      },
      error: (error) {
        throw error;
      },
    );
    return myFarmList;
  }


  Future<List<FarmEntity>> getMyFarmByHsId(
      {required String hsId, required int page}) async {
    List<FarmEntity> myFarmList = [];

    final res = await ref.read(apiProvider).get(
        '/myFarm/farm-registration/details/',
        query: {"page": page, "hsId": hsId, "size": 4});

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<FarmEntity> data =
        List<FarmEntity>.from(source.map((x) => FarmEntity.fromJson(x)));

        myFarmList = data;
      },
      error: (error) {
        throw error;
      },
    );
    return myFarmList;
  }

  Future<List<CropReport>> getCropReport(String cropId) async {
    List<CropReport> cropReports = [];
    final res = await ref.read(apiProvider).get('/myFarm/crop-reports-list/',
        query: {
          "reqUserId": UserPreferences.userId,
          "cropId": cropId,
          "page": 1,
          "size": 10
        });

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<CropReport> data =
            List<CropReport>.from(source.map((x) => CropReport.fromJson(x)));

        cropReports = data;
      },
      error: (error) {
        throw error;
      },
    );
    return cropReports;
  }

  Future<void> requestCropReport(String cropId, BuildContext context) async {
    final res = await ref.read(apiProvider).get(
          '/myFarm/request-crop-analysis/${UserPreferences.userId}/$cropId',
        );
    res.when(
      success: (source) {
        debugPrint(source["message"]);
        if(source["message"] == "You have to await for previous analysis report."){
          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              backgroundColor: mediumOrange,
              content: Text("You have to wait for previous analysis report.")
          ));
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
              backgroundColor: mediumOrange,
              content: Text("Request Submitted Successfully.")
          ));
        }
            },
      error: (error) {
        throw error;
      },
    );
  }


  Future<List<CropReport>> getDownloadReport() async {

    List<CropReport> cropReports = [];
    final res = await ref.read(apiProvider).get('/myFarm/crop-reports-userwise/',
        query: {
          "reqUserId": UserPreferences.userId,
          "page": 1,
          "size": 10
        });

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<CropReport> data =
        List<CropReport>.from(source.map((x) => CropReport.fromJson(x)));


        print("Crop Report ${data.length}");

        cropReports = data;
      },
      error: (error) {
        throw error;
      },
    );
    return cropReports;

  }
}
