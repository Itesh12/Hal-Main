import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../model/market/add_new_address_model.dart';
import '../../../../model/market/bazar_sell_categories_model.dart';
import '../../../../model/market/bazar_sell_post_model.dart';
import '../../../../model/market/edit_my_product_model.dart';
import '../../../../model/market/user_address_model.dart';
import '../../../http/api_provider.dart';

class BazarSellRepo {
  BazarSellRepo(
    this.ref,
  );

  final Ref ref;

  Future<List<BazarSellCategoryModel>> getBazarCategory(
      {required String bazarPostType}) async {
    List<BazarSellCategoryModel> bazarSellCategory = [];

    final res = await ref.read(apiProvider).get(
          '/bazaar/categories/$bazarPostType',
        );

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<BazarSellCategoryModel> data =
            List<BazarSellCategoryModel>.from(
                source.map((x) => BazarSellCategoryModel.fromJson(x)));


        debugPrint(data.toString());
        bazarSellCategory = data;
      },
      error: (error) {
        throw error;
      },
    );
    return bazarSellCategory;
  }

  Future<UserAddressModel> getUserAddress() async {
    late UserAddressModel userAdressData;

    final res = await ref.read(apiProvider).get(
          '/bazaar/userAddress/${UserPreferences.userId}',
        );

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final UserAddressModel data = UserAddressModel.fromJson(source);


        debugPrint(data.toString());
        userAdressData = data;
      },
      error: (error) {
        throw error;
      },
    );
    return userAdressData;
  }

  Future<void> addNewAddress(AddNewAddressModel addnewAddressModel) async {
    final res = await ref
        .read(apiProvider)
        .post('/bazaar/newAddress/', body: addnewAddressModel.toJson());

    res.when(
      success: (source) {
        debugPrint(source.toString());
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<void> editMyProduct(
      {required EditMyProductModel editMyProductModel}) async {
    final FormData formData = FormData.fromMap(editMyProductModel.toJson());

    final res = await ref.read(apiProvider).put(
          '/bazaar/editMyProducts/',
          body: formData,
          contentType: ContentType.multipart,
        );
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<void> sellRentProductFormSubmit(
      {required BazarSellPostModel sellRentPost, List<File>? images}) async {
    final FormData formData = FormData.fromMap(sellRentPost.toJson());

    if (images!.isNotEmpty) {
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
          '/bazaar/sell_rent_Product',
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
