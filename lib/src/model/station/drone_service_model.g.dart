// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drone_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DroneServiceModelImpl _$$DroneServiceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DroneServiceModelImpl(
      addFarmLocation: AddFarmLocation.fromJson(
          json['addFarmLocation'] as Map<String, dynamic>),
      id: json['_id'] as String,
      reqUserId: json['reqUserId'] as String,
      stationId: json['stationId'] as String,
      serviceName: json['serviceName'] as String,
      name: json['name'] as String,
      mobileNo: json['mobileNo'] as String,
      bookingDate: json['bookingDate'] as String,
      bookingStartTime: json['bookingStartTime'] as String,
      addFarmDetails: (json['addFarmDetails'] as List<dynamic>)
          .map((e) => AddFarmDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      cropType: json['cropType'] as String,
      sparyProduct: json['sparyProduct'] as String,
      bookingId: json['bookingId'] as String,
      orderStatus: json['orderStatus'] as String,
      estimatedPrice: (json['estimatedPrice'] as num).toDouble(),
      paymentReceived: json['paymentReceived'] as int,
      remainingPayment: json['remainingPayment'] as int,
      sellerName: json['sellerName'] as String?,
      sellerContactNo: json['sellerContactNo'] as String?,
      remarks: json['remarks'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DroneServiceModelImplToJson(
        _$DroneServiceModelImpl instance) =>
    <String, dynamic>{
      'addFarmLocation': instance.addFarmLocation,
      '_id': instance.id,
      'reqUserId': instance.reqUserId,
      'stationId': instance.stationId,
      'serviceName': instance.serviceName,
      'name': instance.name,
      'mobileNo': instance.mobileNo,
      'bookingDate': instance.bookingDate,
      'bookingStartTime': instance.bookingStartTime,
      'addFarmDetails': instance.addFarmDetails,
      'cropType': instance.cropType,
      'sparyProduct': instance.sparyProduct,
      'bookingId': instance.bookingId,
      'orderStatus': instance.orderStatus,
      'estimatedPrice': instance.estimatedPrice,
      'paymentReceived': instance.paymentReceived,
      'remainingPayment': instance.remainingPayment,
      'sellerName': instance.sellerName,
      'sellerContactNo': instance.sellerContactNo,
      'remarks': instance.remarks,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$AddFarmDetailImpl _$$AddFarmDetailImplFromJson(Map<String, dynamic> json) =>
    _$AddFarmDetailImpl(
      farmName: json['farmName'] as String,
      area: (json['area'] as num).toDouble(),
      areaUnit: json['areaUnit'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$AddFarmDetailImplToJson(_$AddFarmDetailImpl instance) =>
    <String, dynamic>{
      'farmName': instance.farmName,
      'area': instance.area,
      'areaUnit': instance.areaUnit,
      '_id': instance.id,
    };

_$AddFarmLocationImpl _$$AddFarmLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$AddFarmLocationImpl(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$AddFarmLocationImplToJson(
        _$AddFarmLocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };

_$SparyProductImpl _$$SparyProductImplFromJson(Map<String, dynamic> json) =>
    _$SparyProductImpl(
      productName: json['productName'] as String,
      productPrice: json['productPrice'] as int,
      quantity: json['quantity'] as int,
      qtyUnit: json['qtyUnit'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$SparyProductImplToJson(_$SparyProductImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'quantity': instance.quantity,
      'qtyUnit': instance.qtyUnit,
      '_id': instance.id,
    };
