// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_sell_service_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellDroneServicesTextFieldModelImpl
    _$$SellDroneServicesTextFieldModelImplFromJson(Map<String, dynamic> json) =>
        _$SellDroneServicesTextFieldModelImpl(
          sellerUserId: json['sellerUserId'] as String,
          name: json['name'] as String,
          mobileNo: json['mobileNo'] as String,
          selectKs: json['selectKs'] as String,
          TotalDrones: json['TotalDrones'] as int,
          droneDetails: json['droneDetails'] as String?,
        );

Map<String, dynamic> _$$SellDroneServicesTextFieldModelImplToJson(
        _$SellDroneServicesTextFieldModelImpl instance) =>
    <String, dynamic>{
      'sellerUserId': instance.sellerUserId,
      'name': instance.name,
      'mobileNo': instance.mobileNo,
      'selectKs': instance.selectKs,
      'TotalDrones': instance.TotalDrones,
      'droneDetails': instance.droneDetails,
    };
