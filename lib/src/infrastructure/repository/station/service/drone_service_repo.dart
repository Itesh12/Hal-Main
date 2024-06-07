import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../../model/station/drone_service_model.dart';
import '../../../../model/station/listingproduct_details_model.dart';
import '../../../../model/station/seller_dashboard_model.dart';
import '../../../../model/station/seller_historyist_model.dart';
import '../../../../model/station/seller_mylisting_model.dart';
import '../../../../model/station/seller_orderlist_model.dart';
import '../../../../model/station/seller_status_model.dart';
import '../../../http/api_provider.dart';

class DroneServiceRepo {
  DroneServiceRepo(
    this.ref,
  );

  final Ref ref;

  final stalkerId = UserPreferences.userId;

  Future<List<DroneServiceModel>> getDroneServices() async {
    List<DroneServiceModel> droneServices = [];

    final res = await ref.read(apiProvider).get(
          '/myStation/list-of-Orders-of-services/$stalkerId',
        );

    res.when(
      success: (source) {
        debugPrint(source.toString());

        final List<DroneServiceModel> data = List<DroneServiceModel>.from(
            source.map((x) => DroneServiceModel.fromJson(x)));


        debugPrint(data.toString());
        droneServices = data;
      },
      error: (error) {
        throw error;
      },
    );
    return droneServices;
  }

  Future<SellerStatusModel> getSellerStatus() async {
    SellerStatusModel? sellerStatus;

    final res =
        await ref.read(apiProvider).get('/sp/seller-registration-info', query: {
      "userId": UserPreferences.userId,
    });

    res.when(
      success: (source) {
        debugPrint("source");

        try {
          final List<SellerStatusModel> data = List<SellerStatusModel>.from(
            source.map(
              (x) {
                final a = SellerStatusModel.fromJson(x);

                UserPreferences.setSeller(a.spid);
                return a;
              },
            ),
          );


          debugPrint(data.toString());
          sellerStatus = data.first;
        } catch (e) {
          debugPrint(e.toString());
          rethrow;
        }
      },
      error: (error) {
        debugPrint(error.toString());
        throw error;
      },
    );
    if(sellerStatus?.sellerType != null){
      await UserPreferences.setSellerType(sellerStatus!.sellerType!);
    }
    return sellerStatus!;
  }

//for getting first time seller status as seller /not

  Future<bool> getSellerFirstStatus() async {
    bool firstStatus = false;

    final res =
        await ref.read(apiProvider).get('/sp/has-seller-registered', query: {
      "userId": UserPreferences.userId,
    });

    res.when(
      success: (source) {
        // debugPrint(source.toString());
        debugPrint("source");

        if (source["status"]) {
          //do yur task
          firstStatus = true;
        }
        // var data = source.first.map((x) => SellerStatusModel.fromJson(x));
      },
      error: (error) {
        debugPrint(error.toString());
        throw error;
      },
    );
    return firstStatus;
  }

  //for getting drone list

  Future<List> getSellerDrone({required String sellerId}) async {
    List droneList = [];
    final res =
        await ref.read(apiProvider).get('/sp/drone-equipments-list', query: {
      "sellerId": sellerId,
    });

    res.when(
      success: (source) {
        final data = source;
        droneList = data;
      },
      error: (error) {
        debugPrint(error.toString());
        throw error;
      },
    );
    return droneList;
  }

// for geting single product details in listing page
  Future<ListingproductDetailsModel?> getProductDetail(
      {required String sellerId, required String productId}) async {
    ListingproductDetailsModel? _productDetails;
    final res = await ref.read(apiProvider).get(
        '/sp/my-listing-products-detail',
        query: {"sellerId": sellerId, "productId": productId});

    res.when(
      success: (source) {
        // debugPrint(source.toString());
        debugPrint("source");

        // var data = source.first.map((x) => SellerStatusModel.fromJson(x));

        try {
          final List<ListingproductDetailsModel> data =
              List<ListingproductDetailsModel>.from(
            source.map(
              (x) {
                debugPrint('trying to convert data');
                debugPrint(x.toString());
                final a = ListingproductDetailsModel.fromJson(x);
                debugPrint(a.toString());
                return a;
              },
            ),
          );


          debugPrint(data.toString());
          _productDetails = data.first;
        } catch (e) {
          debugPrint(e.toString());
          rethrow;
        }
      },
      error: (error) {
        debugPrint(error.toString());
        throw error;
      },
    );
    return _productDetails!;
  }

  // for geting single orderhistory details in listing page
  Future<SellerHistoryistModel?> getOrderDetails(
      {required String buyId}) async {
    SellerHistoryistModel? _productDetails;
    final res = await ref
        .read(apiProvider)
        .get('/sp/order-history-details', query: {"buyId": buyId});

    res.when(
      success: (source) {
        _productDetails = SellerHistoryistModel.fromJson(source);
      },
      error: (error) {
        debugPrint(error.toString());
        throw error;
      },
    );
    return _productDetails;
  }

  //for getting dashboard details of a users

  Future<SellerDashboardModel?> getdashboardDetails(
      {required String time, required String sellerId}) async {
    SellerDashboardModel? _dashboardDetails;
    final res = await ref
        .read(apiProvider)
        .get('/sp/analytics', query: {"time": time, "sellerId": sellerId});

    res.when(
      success: (source) {
        _dashboardDetails = SellerDashboardModel.fromJson(source);
      },
      error: (error) {
        debugPrint(error.toString());
        throw error;
      },
    );
    return _dashboardDetails!;
  }

// for getting users product listing in seller mode

  Future<List<SellerMylistingModel>> getSellerList(
      {required int page, required String sellerId, required int size}) async {
    final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
    final sellerId = val.id;

    List<SellerMylistingModel> listing = [];
    final res = await ref.read(apiProvider).get('/sp/my-listing-products',
        query: {"sellerId": sellerId, "page": page, "size": size});

    res.when(
      success: (source) {
        try {
          if (source['message'] == "You've not added any selling product.") {
            listing = [];
          }
        } catch (e) {
          listing = List<SellerMylistingModel>.from(
              source.map((x) => SellerMylistingModel.fromJson(x)));
        }
      },
      error: (error) {
        throw error;
      },
    );
    return listing;
  }

  // for getting order list of seller

  Future<List<SellerOrderlistModel>> getSellerOrderList(
      {required int page, required String sellerId, required int size}) async {
    final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
    final sellerId = val.id;

    List<SellerOrderlistModel> orderList = [];
    final res = await ref.read(apiProvider).get('/sp/my-orders-list',
        query: {"sellerId": sellerId, "page": page, "size": size});

    res.when(
      success: (source) {
        try {
          if (source['message'] == 'No Orders.') {
            orderList = [];
          }
        } catch (e) {
          orderList = List<SellerOrderlistModel>.from(
              source.map((x) => SellerOrderlistModel.fromJson(x)));
        }
      },
      error: (error) {
        throw error;
      },
    );
    return orderList;
  }

  // Google Places

  Future<List<LocationTextAutocomplete>> getGooglePlaceTexts(String kw) async {
    final List<LocationTextAutocomplete> locationList = [];

    final res = await ref.read(apiProvider).get(
        '?key=AIzaSyC6pbtcBe5CI5MtcE8ZVN7MEWgj4Cj6IqM&input=$kw',
        newBaseUrl:
            'https://maps.googleapis.com/maps/api/place/autocomplete/json');

    res.when(success: (data) {
      for (final locData in data['predictions']) {
        final LocationTextAutocomplete locationTextAutocomplete =
            LocationTextAutocomplete(
                placeId: locData['place_id'],
                mainText: locData['structured_formatting']['main_text'],
                secondaryText: locData['structured_formatting']['secondary_text'] ?? ""
            );

        locationList.add(locationTextAutocomplete);
      }
      return locationList;
    }, error: (er) {
      return locationList;
    });
    return locationList;
  }

  Future<List<TripLocationData>> getPlaceIdCoordinates(
      String placeId) async {
    final List<TripLocationData> locationCoordinates = [];

    final res = await ref.read(apiProvider).get(
        "?placeid=$placeId&key=AIzaSyC6pbtcBe5CI5MtcE8ZVN7MEWgj4Cj6IqM&fields=formatted_address,geometry",
        newBaseUrl: "https://maps.googleapis.com/maps/api/place/details/json");

    res.when(
        success: (data) {
          final TripLocationData locationCoordinate = TripLocationData(
              address: data['result']['formatted_address'],
              lat: data['result']['geometry']['location']['lat'],
              lng: data['result']['geometry']['location']['lng']);

          locationCoordinates.add(locationCoordinate);
        },
        error: (error) {});

    return locationCoordinates;
  }
}

class LocationTextAutocomplete {
  final String placeId;
  final String mainText;
  final String secondaryText;

  LocationTextAutocomplete({
    required this.placeId,
    required this.mainText,
    required this.secondaryText,
  });

  factory LocationTextAutocomplete.fromJson(Map<String, dynamic> json) {
    return LocationTextAutocomplete(
      placeId: json['place_id'],
      mainText: json['main_text'],
      secondaryText: json['secondary_text'],
    );
  }
}

class TripLocationData {
  final double lat;
  final double lng;
  final String address;

  TripLocationData({
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory TripLocationData.fromJson(Map<String, dynamic> json) {
    return TripLocationData(
        lat: json['lat'],
        lng: json['lng'],
        address: json['address']);
  }
}
