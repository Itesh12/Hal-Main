// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      userId: json['userId'] as String?,
      message: json['message'] as String?,
      authToken: json['authToken'] as String?,
      hasRegistered: json['hasRegistered'] as bool?,
      hasDcAccess: (json['hasDcAccess'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fcm_token: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'authToken': instance.authToken,
      'hasRegistered': instance.hasRegistered,
      'hasDcAccess': instance.hasDcAccess,
      'fcm_token': instance.fcm_token,
    };
