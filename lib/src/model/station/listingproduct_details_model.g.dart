// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listingproduct_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListingproductDetailsModelImpl _$$ListingproductDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListingproductDetailsModelImpl(
      id: json['_id'] as String,
      serviceName: json['serviceName'] as String,
      sellingProductId: json['sellingProductId'] as String,
      droneRegNo: json['droneRegNo'] as String,
      droneImages: (json['droneImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      serviceDescription: json['serviceDescription'] as String,
      selectedStations: (json['selectedStations'] as List<dynamic>)
          .map((e) => SelectedStation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListingproductDetailsModelImplToJson(
        _$ListingproductDetailsModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'serviceName': instance.serviceName,
      'sellingProductId': instance.sellingProductId,
      'droneRegNo': instance.droneRegNo,
      'droneImages': instance.droneImages,
      'serviceDescription': instance.serviceDescription,
      'selectedStations': instance.selectedStations,
    };

_$SelectedStationImpl _$$SelectedStationImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectedStationImpl(
      ksLocation:
          KsLocation.fromJson(json['ksLocation'] as Map<String, dynamic>),
      ksName: json['ksName'] as String,
    );

Map<String, dynamic> _$$SelectedStationImplToJson(
        _$SelectedStationImpl instance) =>
    <String, dynamic>{
      'ksLocation': instance.ksLocation,
      'ksName': instance.ksName,
    };

_$KsLocationImpl _$$KsLocationImplFromJson(Map<String, dynamic> json) =>
    _$KsLocationImpl(
      address: json['address'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$$KsLocationImplToJson(_$KsLocationImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'state': instance.state,
    };
