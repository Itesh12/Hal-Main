// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileUpdateRepoModelImpl _$$ProfileUpdateRepoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileUpdateRepoModelImpl(
      userId: json['userId'] as String,
      name: json['name'] as String?,
      username: json['username'] as String?,
      referralCode: json['referralCode'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
      state: json['state'] as String?,
      district: json['district'] as String?,
      pinCode: json['pinCode'] as String?,
      area: json['area'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      keepImage: json['keepImage'] as bool?,
    );

Map<String, dynamic> _$$ProfileUpdateRepoModelImplToJson(
        _$ProfileUpdateRepoModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'username': instance.username,
      'referralCode': instance.referralCode,
      'description': instance.description,
      'email': instance.email,
      'state': instance.state,
      'district': instance.district,
      'pinCode': instance.pinCode,
      'area': instance.area,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'keepImage': instance.keepImage,
    };

_$ProfileUpdateModelImpl _$$ProfileUpdateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileUpdateModelImpl(
      user: (json['user'] as List<dynamic>)
          .map((e) => UpdatedUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProfileUpdateModelImplToJson(
        _$ProfileUpdateModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

_$UpdatedUserImpl _$$UpdatedUserImplFromJson(Map<String, dynamic> json) =>
    _$UpdatedUserImpl(
      user_id: json['user_id'] as String,
      name: json['name'] as String,
      profilePic: json['profilePic'] as String?,
      description: json['description'] as String?,
      followers_count: json['followers_count'] as int?,
      following_count: json['following_count'] as int?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UpdatedUserImplToJson(_$UpdatedUserImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'name': instance.name,
      'profilePic': instance.profilePic,
      'description': instance.description,
      'followers_count': instance.followers_count,
      'following_count': instance.following_count,
      'address': instance.address,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      state: json['state'] as String?,
      district: json['district'] as String?,
      pinCode: json['pinCode'] as String?,
      area: json['area'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'district': instance.district,
      'pinCode': instance.pinCode,
      'area': instance.area,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
