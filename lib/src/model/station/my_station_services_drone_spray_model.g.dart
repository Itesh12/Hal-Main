// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_station_services_drone_spray_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyStationDroneSprayFormModelImpl _$$MyStationDroneSprayFormModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyStationDroneSprayFormModelImpl(
      reqUserId: json['reqUserId'] as String,
      stationId: json['stationId'] as String,
      name: json['name'] as String,
      mobileNo: json['mobileNo'] as String,
      bookingDate: json['bookingDate'] as String,
      bookingStartTime: json['bookingStartTime'] as String,
      addFramLocation: json['addFramLocation'] as String,
      cropType: json['cropType'] as String,
      addFarmDetails: json['addFarmDetails'] as String,
      sparyProduct: json['sparyProduct'] as String,
      estimatedPrice: (json['estimatedPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$MyStationDroneSprayFormModelImplToJson(
        _$MyStationDroneSprayFormModelImpl instance) =>
    <String, dynamic>{
      'reqUserId': instance.reqUserId,
      'stationId': instance.stationId,
      'name': instance.name,
      'mobileNo': instance.mobileNo,
      'bookingDate': instance.bookingDate,
      'bookingStartTime': instance.bookingStartTime,
      'addFramLocation': instance.addFramLocation,
      'cropType': instance.cropType,
      'addFarmDetails': instance.addFarmDetails,
      'sparyProduct': instance.sparyProduct,
      'estimatedPrice': instance.estimatedPrice,
    };

_$FarmLocationModelImpl _$$FarmLocationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FarmLocationModelImpl(
      address: json['address'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$$FarmLocationModelImplToJson(
        _$FarmLocationModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$FarmDetailModelImpl _$$FarmDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FarmDetailModelImpl(
      farmName: json['farmName'] as String,
      area: (json['area'] as num).toDouble(),
      areaUnit: json['areaUnit'] as String,
      estimatedPrice: (json['estimatedPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$FarmDetailModelImplToJson(
        _$FarmDetailModelImpl instance) =>
    <String, dynamic>{
      'farmName': instance.farmName,
      'area': instance.area,
      'areaUnit': instance.areaUnit,
      'estimatedPrice': instance.estimatedPrice,
    };

_$SprayProductModelImpl _$$SprayProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SprayProductModelImpl(
      productName: json['productName'] as String,
      productPrice: json['productPrice'] as int,
      quantity: json['quantity'] as int,
      qtyUnit: json['qtyUnit'] as String,
    );

Map<String, dynamic> _$$SprayProductModelImplToJson(
        _$SprayProductModelImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'quantity': instance.quantity,
      'qtyUnit': instance.qtyUnit,
    };
