// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_deliver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDeliverdModelImpl _$$OrderDeliverdModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDeliverdModelImpl(
      id: json['buyId'] as String?,
      estimatedPrice: json['estimatedPrice'] as String,
      paymentReceived: json['paymentReceived'] as String,
      remainingPayment: json['remainingPayment'] as String,
      OCLocation: json['OCLocation'] as String,
      addFarmDetails: json['addFarmDetails'] as String,
      equipmentNo: json['equipmentNo'] as String,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$$OrderDeliverdModelImplToJson(
        _$OrderDeliverdModelImpl instance) =>
    <String, dynamic>{
      'buyId': instance.id,
      'estimatedPrice': instance.estimatedPrice,
      'paymentReceived': instance.paymentReceived,
      'remainingPayment': instance.remainingPayment,
      'OCLocation': instance.OCLocation,
      'addFarmDetails': instance.addFarmDetails,
      'equipmentNo': instance.equipmentNo,
      'remarks': instance.remarks,
    };

_$FarmDetailOrderImpl _$$FarmDetailOrderImplFromJson(
        Map<String, dynamic> json) =>
    _$FarmDetailOrderImpl(
      farmName: json['farmName'] as String,
      area: (json['area'] as num).toDouble(),
      areaUnit: json['areaUnit'] as String,
    );

Map<String, dynamic> _$$FarmDetailOrderImplToJson(
        _$FarmDetailOrderImpl instance) =>
    <String, dynamic>{
      'farmName': instance.farmName,
      'area': instance.area,
      'areaUnit': instance.areaUnit,
    };

_$OcLocationImpl _$$OcLocationImplFromJson(Map<String, dynamic> json) =>
    _$OcLocationImpl(
      address: json['address'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$$OcLocationImplToJson(_$OcLocationImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
