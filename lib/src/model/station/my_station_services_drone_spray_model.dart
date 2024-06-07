import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_station_services_drone_spray_model.freezed.dart';
part 'my_station_services_drone_spray_model.g.dart';

@freezed
abstract class MyStationDroneSprayFormModel
    with _$MyStationDroneSprayFormModel {
  const factory MyStationDroneSprayFormModel({
    required String reqUserId,
    required String stationId,
    required String name,
    required String mobileNo,
    required String bookingDate,
    required String bookingStartTime,
    required String addFramLocation,
    required String cropType,
    required String addFarmDetails,
    required String sparyProduct,
    required double estimatedPrice,
  }) = _MyStationDroneSprayFormModel;

  factory MyStationDroneSprayFormModel.fromJson(Map<String, dynamic> json) =>
      _$MyStationDroneSprayFormModelFromJson(json);
}

@freezed
abstract class FarmLocationModel with _$FarmLocationModel {
  const factory FarmLocationModel({
    required String address,
    required String latitude,
    required String longitude,
  }) = _FarmLocationModel;

  factory FarmLocationModel.fromJson(Map<String, dynamic> json) =>
      _$FarmLocationModelFromJson(json);
}

@freezed
abstract class FarmDetailModel with _$FarmDetailModel {
  const factory FarmDetailModel({
    required String farmName,
    required double area,
    required String areaUnit,
    required double estimatedPrice,
  }) = _FarmDetailModel;

  factory FarmDetailModel.fromJson(Map<String, dynamic> json) =>
      _$FarmDetailModelFromJson(json);
}

@freezed
abstract class SprayProductModel with _$SprayProductModel {
  const factory SprayProductModel({
    required String productName,
    required int productPrice,
    required int quantity,
    required String qtyUnit,
  }) = _SprayProductModel;

  factory SprayProductModel.fromJson(Map<String, dynamic> json) =>
      _$SprayProductModelFromJson(json);
}
