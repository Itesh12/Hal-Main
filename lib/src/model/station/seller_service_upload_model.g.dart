// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_service_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellerServiceUploadModelImpl _$$SellerServiceUploadModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerServiceUploadModelImpl(
      sellerId: json['sellerId'] as String,
      kisaanStations: (json['kisaanStations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      droneRegNo: json['droneRegNo'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$SellerServiceUploadModelImplToJson(
        _$SellerServiceUploadModelImpl instance) =>
    <String, dynamic>{
      'sellerId': instance.sellerId,
      'kisaanStations': instance.kisaanStations,
      'droneRegNo': instance.droneRegNo,
      'description': instance.description,
    };
