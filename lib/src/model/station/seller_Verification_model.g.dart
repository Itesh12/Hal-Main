// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_Verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellerVerificationModelImpl _$$SellerVerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerVerificationModelImpl(
      userId: json['userId'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      businessDetails: json['businessDetails'] as String,
      hasRegistered: json['hasRegistered'] as bool,
      sellerType: json['sellerType'] as String,
      dcId: json['dcId'] as String,
      dcName: json['dcName'] as String,
      location: json['location'] as String,
      referralCode: json['referralCode'] as String?,
    );

Map<String, dynamic> _$$SellerVerificationModelImplToJson(
        _$SellerVerificationModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'businessDetails': instance.businessDetails,
      'hasRegistered': instance.hasRegistered,
      'sellerType': instance.sellerType,
      'dcId': instance.dcId,
      'dcName': instance.dcName,
      'location': instance.location,
      'referralCode': instance.referralCode,
    };
