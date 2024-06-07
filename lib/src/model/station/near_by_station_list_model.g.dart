// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'near_by_station_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearByStaionListModelImpl _$$NearByStaionListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NearByStaionListModelImpl(
      id: json['_id'] as String,
      distance: (json['distance'] as num).toDouble(),
      ksLocation: StationPartnerAddressModel.fromJson(
          json['ksLocation'] as Map<String, dynamic>),
      ksId: json['ksId'] as String,
      ksName: json['ksName'] as String,
    );

Map<String, dynamic> _$$NearByStaionListModelImplToJson(
        _$NearByStaionListModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'distance': instance.distance,
      'ksLocation': instance.ksLocation,
      'ksId': instance.ksId,
      'ksName': instance.ksName,
    };
