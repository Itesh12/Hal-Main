// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationFormModelImpl _$$RegistrationFormModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationFormModelImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      referralCode: json['referralCode'] as String?,
      state: json['state'] as String?,
      district: json['district'] as String?,
      pinCode: json['pinCode'] as String?,
      area: json['area'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$RegistrationFormModelImplToJson(
        _$RegistrationFormModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'username': instance.username,
      'referralCode': instance.referralCode,
      'state': instance.state,
      'district': instance.district,
      'pinCode': instance.pinCode,
      'area': instance.area,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
