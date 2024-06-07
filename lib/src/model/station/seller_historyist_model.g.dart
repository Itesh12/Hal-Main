// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_historyist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellerHistoryistModelImpl _$$SellerHistoryistModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerHistoryistModelImpl(
      addFarmLocation: AddFarmLocation.fromJson(
          json['addFarmLocation'] as Map<String, dynamic>),
      id: json['_id'] as String,
      addFarmDetails: (json['addFarmDetails'] as List<dynamic>)
          .map((e) => AddFarmDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      cropType: json['cropType'] as String,
      sparyProduct: json['sparyProduct'] as String,
      bookingId: json['bookingId'] as String,
      estimatedPrice: json['estimatedPrice'] as int,
      paymentReceived: json['paymentReceived'],
      remainingPayment: json['remainingPayment'] as int,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SellerHistoryistModelImplToJson(
        _$SellerHistoryistModelImpl instance) =>
    <String, dynamic>{
      'addFarmLocation': instance.addFarmLocation,
      '_id': instance.id,
      'addFarmDetails': instance.addFarmDetails,
      'cropType': instance.cropType,
      'sparyProduct': instance.sparyProduct,
      'bookingId': instance.bookingId,
      'estimatedPrice': instance.estimatedPrice,
      'paymentReceived': instance.paymentReceived,
      'remainingPayment': instance.remainingPayment,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$AddFarmDetailImpl _$$AddFarmDetailImplFromJson(Map<String, dynamic> json) =>
    _$AddFarmDetailImpl(
      farmName: json['farmName'] as String,
      area: (json['area'] as num).toDouble(),
      areaUnit: json['areaUnit'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$AddFarmDetailImplToJson(_$AddFarmDetailImpl instance) =>
    <String, dynamic>{
      'farmName': instance.farmName,
      'area': instance.area,
      'areaUnit': instance.areaUnit,
      '_id': instance.id,
    };

_$AddFarmLocationImpl _$$AddFarmLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$AddFarmLocationImpl(
      address: json['address'] as String,
    );

Map<String, dynamic> _$$AddFarmLocationImplToJson(
        _$AddFarmLocationImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
    };
