// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_partner_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationPartnerAddressModelImpl _$$StationPartnerAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StationPartnerAddressModelImpl(
      address: json['address'] as String,
      state: json['state'] as String,
      pinCode: json['pinCode'] as String,
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$StationPartnerAddressModelImplToJson(
        _$StationPartnerAddressModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'state': instance.state,
      'pinCode': instance.pinCode,
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_$StationPartnerFormModelImpl _$$StationPartnerFormModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StationPartnerFormModelImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      mobileNo: json['mobileNo'] as String,
      mailId: json['mailId'] as String,
      ksLocation: json['ksLocation'] as String,
      ksName: json['ksName'] as String,
      ksId: json['ksId'] as String,
      businessDetails: json['businessDetails'] as String,
    );

Map<String, dynamic> _$$StationPartnerFormModelImplToJson(
        _$StationPartnerFormModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'mobileNo': instance.mobileNo,
      'mailId': instance.mailId,
      'ksLocation': instance.ksLocation,
      'ksName': instance.ksName,
      'ksId': instance.ksId,
      'businessDetails': instance.businessDetails,
    };
