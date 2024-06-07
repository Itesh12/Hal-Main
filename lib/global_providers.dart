import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:kisaan_station/src/controller/auth/provider/address_provider.dart';
import 'package:kisaan_station/src/controller/auth/provider/auth_controller.dart';
import 'package:kisaan_station/src/controller/auth/provider/otp_controller.dart';
import 'package:kisaan_station/src/controller/auth/state/address_state.dart';
import 'package:kisaan_station/src/controller/auth/state/auth_state.dart';
import 'package:kisaan_station/src/controller/auth/state/otp_state.dart';
import 'package:kisaan_station/src/controller/disease_detection/disease_detection_controller.dart';
import 'package:kisaan_station/src/controller/farm/choose_farm_controller.dart';
import 'package:kisaan_station/src/controller/farm/farm_list_controller.dart';
import 'package:kisaan_station/src/controller/farm/other_farm_list_controller.dart';
import 'package:kisaan_station/src/controller/market/provider/bazar_all_product_list_controller.dart';
import 'package:kisaan_station/src/controller/market/provider/bazar_rent_product_list_controller.dart';
import 'package:kisaan_station/src/controller/market/provider/bazar_sell_product_list_controller.dart';
import 'package:kisaan_station/src/controller/market/provider/my_product_list_controller.dart';
import 'package:kisaan_station/src/controller/market/provider/search_bazar_lisr_controller.dart';
import 'package:kisaan_station/src/controller/notification_controller.dart';
import 'package:kisaan_station/src/controller/post/provider/comment_list_controller.dart';
import 'package:kisaan_station/src/controller/post/provider/perticular_post_controller.dart';
import 'package:kisaan_station/src/controller/post/provider/post_list_controller.dart';
import 'package:kisaan_station/src/controller/post/provider/reply_list_controller.dart';
import 'package:kisaan_station/src/controller/post/provider/user_post_controller.dart';
import 'package:kisaan_station/src/controller/search/search_user_controller.dart';
import 'package:kisaan_station/src/controller/seller/seller_listing_controller.dart';
import 'package:kisaan_station/src/controller/seller/seller_orderlist_controller.dart';
import 'package:kisaan_station/src/controller/user/block_list_controller.dart';
import 'package:kisaan_station/src/controller/user/follower_list_controller.dart';
import 'package:kisaan_station/src/controller/user/following_list_controller.dart';
import 'package:kisaan_station/src/controller/user/user_controller.dart';
import 'package:kisaan_station/src/infrastructure/drawer/station_partner_form_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/agri/agri_news_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/auth/auth_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/disease_detection/disease_detection_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/mandiBhav/mandi_bhav_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/market/get_market_products_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/market/sell/bazar_sell_category_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/notification/notification_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/search/search_user_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/station/sell/station_sell_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/station/sell/upload_logistic_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/station/service/drone_service_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/user/user_repo.dart';
import 'package:kisaan_station/src/infrastructure/repository/weather/weather_repo.dart';
import 'package:kisaan_station/src/model/agriNews/top_news_model.dart';
import 'package:kisaan_station/src/model/mandiBhav/mandi_bhav_model.dart';
import 'package:kisaan_station/src/model/market/bazar_sell_categories_model.dart';
import 'package:kisaan_station/src/model/market/user_address_model.dart';
import 'package:kisaan_station/src/model/station/drone_service_model.dart';
import 'package:kisaan_station/src/model/station/near_by_station_list_model.dart';
import 'package:kisaan_station/src/model/station/seller_status_model.dart';
import 'package:kisaan_station/src/model/station/station_sell_category_model.dart';
import 'package:kisaan_station/src/model/user/blocked_list_model.dart';
import 'package:kisaan_station/src/model/weather/one_day_weather.dart';
import 'package:kisaan_station/src/util/services/location_services.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:latlong2/latlong.dart';

import 'src/controller/farm/current_area_notifier.dart';
import 'src/controller/post/provider/perticular_comment_controller.dart';
import 'src/infrastructure/repository/farm/farm_repo.dart';
import 'src/infrastructure/repository/social/post_repo.dart';
import 'src/model/social/post/comment_model.dart';
import 'src/model/social/post/post_model.dart';
import 'src/model/user/user_model.dart';

/// Service Provider
final authProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref);
});

final postProvider = Provider<PostRepository>((ref) {
  return PostRepository(ref);
});

//listing provider

final listingProvider = Provider<DroneServiceRepo>((ref) {
  return DroneServiceRepo(ref);
});

final orderListProvider = Provider<DroneServiceRepo>((ref) {
  return DroneServiceRepo(ref);
});

final locationProvider = Provider<LocationService>((ref) {
  return LocationService();
});

final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref);
});

final usernotificationProvider = Provider<NotificationDataRepository>((ref) {
  return NotificationDataRepository(ref);
});

final weatherDataRepoProvider = Provider<WeatherDataRepository>((ref) {
  return WeatherDataRepository(ref);
});

final mandiBhavRepoProvider = Provider<MandiBhavRepository>((ref) {
  return MandiBhavRepository(ref);
});

final notificationDataRepoProvider =
    Provider<NotificationDataRepository>((ref) {
  return NotificationDataRepository(ref);
});

final agriNewsRepoProvider = Provider<NewsDataRepository>((ref) {
  return NewsDataRepository(ref);
});

final bazarSellCategoryRepoProvider = FutureProvider.family
    .autoDispose<List<BazarSellCategoryModel>, String>(
        (ref, String bazarPostType) {
  return BazarSellRepo(ref).getBazarCategory(bazarPostType: bazarPostType);
});

final stationSellCategoryRepoProvider = FutureProvider.family
    .autoDispose<List<StationSellCategoryModel>, String>(
        (ref, String categoryType) {
  return StationRepo(ref).getBazarCategory(bazarPostType: categoryType);
});

final droneServiceListProvider =
    FutureProvider.autoDispose<List<DroneServiceModel>>((ref) {
  return ref.read(droneServiceRepoProvider).getDroneServices();
});

final sellerStatusProvider =
    FutureProvider.autoDispose<SellerStatusModel>((ref) {
  return ref.read(sellerStatusRepoProvider).getSellerStatus();
});

final sellerOnlyStatusProvider =
    FutureProvider.autoDispose<String>((ref) async {
  final status = await ref.read(sellerStatusRepoProvider).getSellerStatus();
  return status.status;
});

final nearByStationList = FutureProvider.autoDispose
    .family<List<NearByStaionListModel>, double>((ref, double range) {
  return StationRepo(ref).getNearByStationList(range: range);
});

// final nearbyStationsProvider = Provider.autoDispose.family((ref,double range) {
//   return ref.watch(nearByStationList(range));
// });

final userMultiAddressProvider =
    FutureProvider.autoDispose<UserAddressModel>((ref) {
  return BazarSellRepo(ref).getUserAddress();
});

final sellPostProvider = Provider.autoDispose<BazarSellRepo>((ref) {
  return BazarSellRepo(ref);
});

final stationSellRepoProvider = Provider.autoDispose<StationRepo>((ref) {
  return StationRepo(ref);
});

final droneServiceRepoProvider = Provider.autoDispose<DroneServiceRepo>((ref) {
  return DroneServiceRepo(ref);
});

final sellerStatusRepoProvider = Provider.autoDispose<DroneServiceRepo>((ref) {
  return DroneServiceRepo(ref);
});

final sellerListingRepoProvider = Provider.autoDispose<DroneServiceRepo>((ref) {
  return DroneServiceRepo(ref);
});

final sellerOrderListRepoProvider =
    Provider.autoDispose<DroneServiceRepo>((ref) {
  return DroneServiceRepo(ref);
});

final stationPartnerFormSubmitProvider =
    Provider.autoDispose<StationPartnerForm>((ref) {
  return StationPartnerForm(ref);
});

final getMarketProductProvider = Provider.autoDispose<BazarProductRepo>((ref) {
  return BazarProductRepo(ref);
});

final searchUserRepoProvider = Provider<SearchUserRepo>((ref) {
  return SearchUserRepo(ref);
});

// final dynamicLinkProvider = Provider<DynamicLinksService>((ref) {
//   return DynamicLinksService(ref);
// });

final farmRepoProvider = Provider<FarmRepo>((ref) {
  return FarmRepo(ref);
});

final currentCoordinateProvider = StateProvider<List<double>>((ref) {
  return [];
});

final googlePlaceProvider = Provider.autoDispose<DroneServiceRepo>((ref) {
  return DroneServiceRepo(ref);
});

final placeIdCoordinateProvider = Provider.autoDispose<DroneServiceRepo>((ref) {
  return DroneServiceRepo(ref);
});





final diseaseDetectionRepoProvider = Provider.autoDispose((ref) => DiseaseDetectionRepo(ref));
////// ------ Logistics Providers -------------//////


final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});


final uploadLogisticRepoProvider = Provider.autoDispose<UploadLogisticRepo>((ref) {
  return UploadLogisticRepo(ref);
});
// final tripStartLocationProvider = StateProvider<LocationData?>((ref) => null);
// final tripDropLocationProvider = StateProvider<LocationData?>((ref) => null);



/// Change Notifier Proider
///


final currentAreaProvider =
    StateNotifierProvider<CurrentAreaNotifier, AsyncValue<Placemark>>((ref) {
  return CurrentAreaNotifier();
});

final farmListProvider = ChangeNotifierProvider.family
    .autoDispose<FarmListNotifier, String>((ref, mobileNo) {
  return FarmListNotifier(ref, mobileNo : mobileNo);
});


final otherFarmListProvider = ChangeNotifierProvider.family
    .autoDispose<OtherFarmListNotifier, String>((ref, hsId) {
  return OtherFarmListNotifier(ref, hsId : hsId);
});

final postListProvider =
    ChangeNotifierProvider.autoDispose<PostListNotifier>((ref) {
  return PostListNotifier(ref);
});

final userPostListProvider = ChangeNotifierProvider.family
    .autoDispose<UserPostListNotifier, String>((ref, userId) {
  return UserPostListNotifier(ref, userId: userId);
});

final farmLocationProvider =
ChangeNotifierProvider.autoDispose<ChooseFarmLocationNotifier>((ref) {
  return ChooseFarmLocationNotifier(ref);
});

// for seller listing provider

final sellerListingProvider = ChangeNotifierProvider.family
    .autoDispose<SellerListinNotifier, String>((ref, userId) {
  return SellerListinNotifier(ref, userId: userId);
});

final sellerOrderListProvider = ChangeNotifierProvider.family
    .autoDispose<SellerOrderNotifier, String>((ref, userId) {
  return SellerOrderNotifier(ref, userId: userId);
});

final userNotificationListProvider = ChangeNotifierProvider.family
    .autoDispose<UserNotificationNotifier, String>((ref, userId) {
  return UserNotificationNotifier(ref, userId: userId);
});

final commentListProvider = ChangeNotifierProvider.family
    .autoDispose<CommentListNotifier, String>((ref, postId) {
  return CommentListNotifier(ref, postId: postId);
});

final followerListProvider = ChangeNotifierProvider.family
    .autoDispose<FollowerListNotifier, String>((ref, userId) {
  return FollowerListNotifier(ref, userId: userId);
});

final searchUserProvider = ChangeNotifierProvider.family
    .autoDispose<SearchUserNotifier, String>((ref, searchQuery) {
  return SearchUserNotifier(ref, searchQuery: searchQuery);
});

final replyListProvider = ChangeNotifierProvider.family
    .autoDispose<ReplyListNotifier, String>((ref, commentId) {
  return ReplyListNotifier(ref, commentId: commentId);
});

final bazarAllProductListProvider =
    ChangeNotifierProvider.autoDispose<BazarAllProductListNotifier>((ref) {
  return BazarAllProductListNotifier(ref);
});
final bazarSellProductListProvider =
    ChangeNotifierProvider.autoDispose<BazarSellProductListNotifier>((ref) {
  return BazarSellProductListNotifier(ref);
});
final bazarRentProductListProvider =
    ChangeNotifierProvider.autoDispose<BazarRentProductListNotifier>((ref) {
  return BazarRentProductListNotifier(ref);
});
final searchBazarProductProvider = ChangeNotifierProvider.family
    .autoDispose<SearchBazarByUserNotifier, String>((ref, searchQuery) {
  return SearchBazarByUserNotifier(ref, searchQuery: searchQuery);
});

final getMyProductProvider = ChangeNotifierProvider.family
    .autoDispose<MyProductListNotifier, String>((ref, userId) {
  return MyProductListNotifier(ref, userId: userId);
});



final diseaseSearchResultProvider =
ChangeNotifierProvider.autoDispose<DiseaseDetectionNotifier>((ref) {
  return DiseaseDetectionNotifier(ref);
});

final diseaseCropListProvider =
ChangeNotifierProvider.autoDispose<DiseaseDetectionNotifier>((ref) {
  return DiseaseDetectionNotifier(ref);
});

/// State Providers
///
final authController = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

final otpController =
    StateNotifierProvider.autoDispose<OtpController, OTPState>((ref) {
  return OtpController(ref);
});

final userController = StateNotifierProvider.family
    <UserNotifier, AsyncValue<User>, String>((ref, userId) {
  return UserNotifier(ref, userId: userId);
});

final perticularPostController = StateNotifierProvider.family
    .autoDispose<PerticularPostController, Post, Post>((ref, post) {
  return PerticularPostController(ref, state: post);
});

final perticularCommentController = StateNotifierProvider.family
    .autoDispose<PerticularCommentController, Comment, Comment>((ref, comment) {
  return PerticularCommentController(ref, state: comment);
});

final addressProvider =
    StateNotifierProvider.autoDispose<AddressNotifier, AddressState>((ref) {
  return AddressNotifier(ref);
});

final blockedUserProvider = StateNotifierProvider.autoDispose<BlockUserNotifier,
    AsyncValue<List<BlockedListModel>>>((ref) {
  return BlockUserNotifier(ref);
});

final followingListProvider = ChangeNotifierProvider.family
    .autoDispose<FollowingListNotifier, String>((ref, userId) {
  return FollowingListNotifier(ref, userId: userId);
});


final pickedImageProvider = StateProvider<List<File>>((ref) => []);


/// Future provider
///
final singleReplyProvider =
    FutureProvider.family.autoDispose<List<Comment>, String>((ref, commentId) {
  return ref.read(postProvider).getOneReply(page: 1, commentId: commentId);
});

final weatherDataProvider =
    FutureProvider.autoDispose<OneDayWeatherModel>((ref) {
  return ref.read(weatherDataRepoProvider).getWeatherData();
});

final mandiBhavProviderbyState =
    FutureProvider.family.autoDispose<MandiBhavModel, String>((ref, state) {
  return ref.read(mandiBhavRepoProvider).getMandiBhavbyState(state);
});
final mandiBhavProviderbyMarket =
    FutureProvider.family.autoDispose<MandiBhavModel, String>((ref, market) {
  return ref.read(mandiBhavRepoProvider).getWeatherDataByMarket(market);
});

final agriNewsDataProvider =
    FutureProvider.autoDispose<List<TopNewsModel>>((ref) {
  return ref.read(agriNewsRepoProvider).getAgriNewsData();
});

// final userFollowProvider =
//    StateNotifierProvider.family.autoDispose<UserFollNotifier,
//     AsyncValue<List<FollowingListModel>> , String>((ref , userId) {
//   return UserFollNotifier(ref , userId);
// });

final distancebylocationProvider =
    FutureProvider.family<double, DistanceModel>((ref, model) async {
  // final location = await ref.read(locationProvider).getLocation();
  final val = ref.read(userController(UserPreferences.userId)).asData!.value;
  const Distance distance = Distance();
  final List<Location> marketCoordinates =
      await locationFromAddress("${model.marketName}, ${model.state}");

  double userlat;
  double userlong;
  double km = 0;

  // debugPrint(location.toString());
  userlat = val.address.latitude;
  userlong = val.address.longitude;

  km = distance.as(
      LengthUnit.Kilometer,
      LatLng(userlat, userlong),
      LatLng(
          marketCoordinates.first.latitude, marketCoordinates.first.longitude));
  debugPrint(km.toString());
  return km;
});

// final followerListDataProvider =
//     FutureProvider.family.autoDispose<List<FollowerListModel>,int>((ref,page) {
//   return ref.read(followerListRepoProvider).getFollowerList(page: page);
// });
// final otherFollowerListDataProvider =
//     FutureProvider.family.autoDispose<List<FollowerListModel>,String>((ref,otherUserid) {
//   return ref.read(followerListRepoProvider).getOtherFollowerList(otherUserId:otherUserid);
// });
// final otherFollowingListDataProvider =
//     FutureProvider.family.autoDispose<List<FollowingListModel>,String>((ref,otherUserid) {
//   return ref.read(followingListRepoProvider).getOtherFollowingList(otherUserId: otherUserid);
// });

class DistanceModel {
  DistanceModel({required this.marketName, required this.state});

  final String marketName;
  final String state;
}
