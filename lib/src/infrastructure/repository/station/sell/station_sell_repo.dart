import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../../global_providers.dart';
import '../../../../model/station/my_station_services_drone_spray_model.dart';
import '../../../../model/station/near_by_station_list_model.dart';
import '../../../../model/station/order_deliver_model.dart';
import '../../../../model/station/seller_Verification_model.dart';
import '../../../../model/station/seller_service_upload_model.dart';
import '../../../../model/station/station_sell_category_model.dart';
import '../../../../model/station/station_sell_service_form_model.dart';
import '../../../http/api_provider.dart';

class StationRepo {
  StationRepo(
    this.ref,
  );

  final Ref ref;

  Future<List<StationSellCategoryModel>> getBazarCategory(
      {required String bazarPostType}) async {
    List<StationSellCategoryModel> bazarSellCategory = [];

    final res = await ref.read(apiProvider).get(
          '/bazaar/categories/$bazarPostType',
        );

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<StationSellCategoryModel> data =
            List<StationSellCategoryModel>.from(
                source.map((x) => StationSellCategoryModel.fromJson(x)));


        debugPrint(data.toString());
        bazarSellCategory = data;
      },
      error: (error) {
        throw error;
      },
    );
    return bazarSellCategory;
  }

  Future<List<NearByStaionListModel>>  getNearByStationList(
      {required double range, double? lat, double? long}) async {
    List<NearByStaionListModel> nearbyStationList = [];
    final val = ref.read(userController(UserPreferences.userId)).asData!.value;

    double userlat;
    double userlong;

    userlat = val.address.latitude;
    userlong = val.address.longitude;
    final res = await ref.read(apiProvider).get('/ks/nearbyStations', query: {
      "stalkerId": UserPreferences.userId,
      "latitude": userlat,
      "longitude": userlong,
      "range": range,
    });

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<NearByStaionListModel> data =
            List<NearByStaionListModel>.from(
                source.map((x) => NearByStaionListModel.fromJson(x)));


        debugPrint(data.toString());
        nearbyStationList = data;
      },
      error: (error) {
        throw error;
      },
    );
    return nearbyStationList;
  }

  Future<void> droneSprayingServiceFormSubmit(
      {required SellDroneServicesTextFieldModel sellDroneServicesTextFieldModel,
      required List<File> images}) async {
    final FormData formData =
        FormData.fromMap(sellDroneServicesTextFieldModel.toJson());

    if (images.isNotEmpty) {
      final List<MapEntry<String, MultipartFile>> formImages = [];
      for (final image in images) {
        final fileName = image.path.split('/').last;
        final ms = MapEntry(
          'pilotLiscense',
          await MultipartFile.fromFile(image.path, filename: fileName),
        );
        formImages.add(ms);
      }
      formData.files.addAll(formImages);
    }

    final res = await ref.read(apiProvider).post(
          '/myStation/sellService/droneSprayingService/',
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

  Future<void> sellerVerificationFormSubmit(
      {required SellerVerificationModel sellerVerificationModel,
      required List<File> images}) async {
    final FormData formData =
        FormData.fromMap(sellerVerificationModel.toJson());

    if (images.isNotEmpty) {
      final List<MapEntry<String, MultipartFile>> formImages = [];
      for (final image in images) {
        final fileName = image.path.split('/').last;
        final ms = MapEntry(
          'documents',
          await MultipartFile.fromFile(image.path, filename: fileName),
        );
        formImages.add(ms);
      }
      formData.files.addAll(formImages);
    }

    final res = await ref.read(apiProvider).post(
          '/sp/seller-registration',
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

  // seller delivery confirm

  Future<void> sellerOrderdelivered(
      {required OrderDeliverdModel orderDeliverdModel,
      required List<File> images}) async {
    final FormData formData = FormData.fromMap(orderDeliverdModel.toJson());

    if (images.isNotEmpty) {
      final List<MapEntry<String, MultipartFile>> formImages = [];
      for (final image in images) {
        final fileName = image.path.split('/').last;
        final ms = MapEntry(
          'fieldImages',
          await MultipartFile.fromFile(image.path, filename: fileName),
        );
        formImages.add(ms);
      }
      formData.files.addAll(formImages);
    }

    final res = await ref.read(apiProvider).put(
          '/sp/order-delivered',
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

  // seller active inactive

  Future<void> inactiveActiveSeller({
    required String sellerId,
    required String status,
  }) async {
    final res = await ref
        .read(apiProvider)
        .put('/sp/active-or-Inactive-seller/', query: {
      "sellerId": sellerId,
      "status": status,
    });
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<void> inactiveProductMyseller({
    required String sellerId,
    required String productId,
    required String status,
  }) async {
    final res = await ref
        .read(apiProvider)
        .put('/sp/active-or-Inactive-product/', query: {
      "sellerId": sellerId,
      "productId": productId,
      "status": status,
    });
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  // remaining payment update

  Future<void> remainingpaymentUpdate({
    required String buyId,
    required double paymentReceived,
  }) async {
    final res = await ref.read(apiProvider).put('/sp/update-payment',
        body: {"buyId": buyId, "paymentReceived": paymentReceived});
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  // Future<void> remainingpaymentUpdate({
  //   required String buyId,
  // }) async {
  //   final res = await ref.read(apiProvider).put('/sp/update-payment', query: {
  //     "buyId": buyId,
  //   });
  //   res.when(
  //     success: (source) {
  //       debugPrint(source["message"]);
  //     },
  //     error: (error) {
  //       throw error;
  //     },
  //   );
  // }
//sellerlisting product delete in seller mode

  Future<void> deleteProductMyseller({
    required String sellerId,
    required String productId,
  }) async {
    final res = await ref
        .read(apiProvider)
        .delete('/sp/delete-sell-drone-spraying-service/', query: {
      "sellerId": sellerId,
      "productId": productId,
    });
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

// seller service upload api

  Future<void> sellerServiceUploadFormSubmit(
      {required SellerServiceUploadModel sellerServiceUploadModel,
      required List<File> images}) async {
    final FormData formData = FormData.fromMap(<String, dynamic>{
      'sellerId': sellerServiceUploadModel.sellerId,
      'kisaanStations':
          jsonEncode(sellerServiceUploadModel.kisaanStations).toString(),
      'droneRegNo': sellerServiceUploadModel.droneRegNo,
      'description': sellerServiceUploadModel.description,
    });

    if (images.isNotEmpty) {
      final List<MapEntry<String, MultipartFile>> formImages = [];
      for (final image in images) {
        final fileName = image.path.split('/').last;
        final ms = MapEntry(
          'images',
          await MultipartFile.fromFile(image.path, filename: fileName),
        );
        formImages.add(ms);
      }
      formData.files.addAll(formImages);
    }

    final res = await ref.read(apiProvider).post(
          '/sp/sell-drone-spraying-service/',
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

  Future<String> droneSprayingFormSubmit({
    required MyStationDroneSprayFormModel myStationDroneSprayFormModel,
  }) async {
    final formData = myStationDroneSprayFormModel.toJson();
    String bokkingId = '';

    final res = await ref.read(apiProvider).post(
          '/myStation/droneSprayrequest/',
          body: formData,
        );
    debugPrint(res.toString());

    res.when(
      success: (source) {
        bokkingId = source["boobkingId"];
      },
      error: (error) {
        throw error;
      },
    );
    return bokkingId;
  }
}
