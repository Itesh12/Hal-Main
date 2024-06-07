import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../global_providers.dart';
import '../../../model/market/get_bazar_product_model.dart';
import '../../http/api_provider.dart';

class BazarProductRepo {
  BazarProductRepo(
    this.ref,
  );

  final Ref ref;

  Future<List<GetBazarProductModel>> getBazarProducts(
      {required String trade,
      required String userId,
      required int page}) async {
    List<GetBazarProductModel> bazarSellProducts = [];

    final location = await ref.read(locationProvider).getLocation();
    final double? lat = location?.latitude;
    final double? lon = location?.longitude;

    if (location != null) {
      final res = await ref.read(apiProvider).get(
            '/bazaar/products/$trade/$userId/1?page=$page&size=20&lat=$lat&long=$lon&range=100',
            // query: {"trade": trade, "stalkerId": UserPreferences.userId}
          );
      res.when(
        success: (source) {
          final List<GetBazarProductModel> data =
              List<GetBazarProductModel>.from(
                  source.map((x) => GetBazarProductModel.fromJson(x)));

          bazarSellProducts = data;
        },
        error: (error) {
          throw error;
        },
      );
    }

    return bazarSellProducts;
  }

  Future<List<GetBazarProductModel>> searchProductByUser(
      {required int page, required final String searchQuery}) async {
    List<GetBazarProductModel> followerList = [];

    final res = await ref.read(apiProvider).get(
          '/product/search/$page/20/$searchQuery?lat=28.6267042&long=77.3722473',
        );

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<GetBazarProductModel> data = List<GetBazarProductModel>.from(
            source.map((x) => GetBazarProductModel.fromJson(x)));


        debugPrint(data.toString());
        followerList = data;
      },
      error: (error) {
        throw error;
      },
    );
    return followerList;
  }

  Future<List<GetBazarProductModel>> getMyProducts(
      {required int page, required String userId}) async {
    List<GetBazarProductModel> productList = [];

    final res = await ref.read(apiProvider).get(
          '/bazaar/mySellProducts/$userId?page=$page&size=20&lat=28.6267042&long=77.3722473',
        );

    res.when(
      success: (source) {
        debugPrint(source.toString());
        if (source[0] != null) {
          final List<GetBazarProductModel> data =
              List<GetBazarProductModel>.from(
                  source.map((x) => GetBazarProductModel.fromJson(x)));
          productList = data;
        } else {
          debugPrint(source["message"]);
        }
      },
      error: (error) {
        throw error;
      },
    );
    return productList;
  }

  Future<void> deleteProduct({
    required String productId,
  }) async {
    final res = await ref.read(apiProvider).delete(
          '/bazaar/deleteMyProducts/${UserPreferences.userId}/$productId',
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
}
