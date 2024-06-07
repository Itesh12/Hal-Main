// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellerStatusModelImpl _$$SellerStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerStatusModelImpl(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      businessDetails: json['businessDetails'] as String,
      documents: (json['documents'] as List<dynamic>)
          .map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasRegistered: json['hasRegistered'] as bool,
      spid: json['SPID'] as String,
      status: json['status'] as String,
      sellerStatus: json['sellerStatus'] as String,
      sellerType: json['sellerType'] as String?,
      rejectReason: json['rejectReason'] as String?,
      inActiveReason: json['inActiveReason'] as String?,
    );

Map<String, dynamic> _$$SellerStatusModelImplToJson(
        _$SellerStatusModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'businessDetails': instance.businessDetails,
      'documents': instance.documents,
      'hasRegistered': instance.hasRegistered,
      'SPID': instance.spid,
      'status': instance.status,
      'sellerStatus': instance.sellerStatus,
      'sellerType': instance.sellerType,
      'rejectReason': instance.rejectReason,
      'inActiveReason': instance.inActiveReason,
    };

_$DocumentImpl _$$DocumentImplFromJson(Map<String, dynamic> json) =>
    _$DocumentImpl(
      mediaUrl: json['mediaUrl'] as String,
    );

Map<String, dynamic> _$$DocumentImplToJson(_$DocumentImpl instance) =>
    <String, dynamic>{
      'mediaUrl': instance.mediaUrl,
    };
