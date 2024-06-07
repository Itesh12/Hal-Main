// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_orderlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellerOrderlistModelImpl _$$SellerOrderlistModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerOrderlistModelImpl(
      id: json['_id'] as String,
      buyerName: json['buyerName'] as String,
      bookingId: json['bookingId'] as String,
      serviceName: json['serviceName'] as String,
      estimatedPrice: (json['estimatedPrice'] as num).toDouble(),
      farmLocation:
          FarmLocation.fromJson(json['farmLocation'] as Map<String, dynamic>),
      bookingDate: json['bookingDate'] as String,
      bookingTime: json['bookingTime'] as String,
      farmDetails: (json['farmDetails'] as List<dynamic>)
          .map((e) => FarmDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      cropType: json['cropType'] as String,
      sparyProduct: json['sparyProduct'] as String,
      mobileNo: json['mobileNo'] as String,
      orderStatus: json['orderStatus'] as String,
      buyerProfileImage: json['buyerProfileImage'] as String?,
    );

Map<String, dynamic> _$$SellerOrderlistModelImplToJson(
        _$SellerOrderlistModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'buyerName': instance.buyerName,
      'bookingId': instance.bookingId,
      'serviceName': instance.serviceName,
      'estimatedPrice': instance.estimatedPrice,
      'farmLocation': instance.farmLocation,
      'bookingDate': instance.bookingDate,
      'bookingTime': instance.bookingTime,
      'farmDetails': instance.farmDetails,
      'cropType': instance.cropType,
      'sparyProduct': instance.sparyProduct,
      'mobileNo': instance.mobileNo,
      'orderStatus': instance.orderStatus,
      'buyerProfileImage': instance.buyerProfileImage,
    };

_$FarmDetailImpl _$$FarmDetailImplFromJson(Map<String, dynamic> json) =>
    _$FarmDetailImpl(
      farmName: json['farmName'] as String,
      area: (json['area'] as num).toDouble(),
      areaUnit: json['areaUnit'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$FarmDetailImplToJson(_$FarmDetailImpl instance) =>
    <String, dynamic>{
      'farmName': instance.farmName,
      'area': instance.area,
      'areaUnit': instance.areaUnit,
      '_id': instance.id,
    };

_$FarmLocationImpl _$$FarmLocationImplFromJson(Map<String, dynamic> json) =>
    _$FarmLocationImpl(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$FarmLocationImplToJson(_$FarmLocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };
