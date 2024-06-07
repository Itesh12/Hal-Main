// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String,
      username: json['username'] as String,
      referralCode: json['referralCode'] as String,
      mobileNo: json['mobileNo'] as String,
      profilePic: json['profilePic'] as String?,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      description: json['description'] as String?,
      followersCount: json['followers_count'] as int,
      followingCount: json['following_count'] as int,
      followingStatus: json['following_status'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'referralCode': instance.referralCode,
      'mobileNo': instance.mobileNo,
      'profilePic': instance.profilePic,
      'address': instance.address,
      'description': instance.description,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'following_status': instance.followingStatus,
    };
