// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddNewAddressModelImpl _$$AddNewAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddNewAddressModelImpl(
      userId: json['userId'] as String,
      state: json['state'] as String,
      district: json['district'] as String,
      pinCode: json['pinCode'] as String,
      area: json['area'] as String,
      locationType: json['locationType'] as String,
      landMark: json['landMark'] as String?,
      wtsUpMobileNo: json['wtsUpMobileNo'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddNewAddressModelImplToJson(
        _$AddNewAddressModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'state': instance.state,
      'district': instance.district,
      'pinCode': instance.pinCode,
      'area': instance.area,
      'locationType': instance.locationType,
      'landMark': instance.landMark,
      'wtsUpMobileNo': instance.wtsUpMobileNo,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
