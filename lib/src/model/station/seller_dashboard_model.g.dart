// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellerDashboardModelImpl _$$SellerDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerDashboardModelImpl(
      TotalPaymentReceived: (json['TotalPaymentReceived'] as num).toDouble(),
      TotalRemainingPayment: (json['TotalRemainingPayment'] as num).toDouble(),
      TotalOrders: json['TotalOrders'] as int,
      TotalAreaCovered: (json['TotalAreaCovered'] as num).toDouble(),
      TotalPending: json['TotalPending'] as int,
      TotalDelivered: json['TotalDelivered'] as int,
      TotalCancelled: json['TotalCancelled'] as int,
      TotalListings: json['TotalListings'] as int,
    );

Map<String, dynamic> _$$SellerDashboardModelImplToJson(
        _$SellerDashboardModelImpl instance) =>
    <String, dynamic>{
      'TotalPaymentReceived': instance.TotalPaymentReceived,
      'TotalRemainingPayment': instance.TotalRemainingPayment,
      'TotalOrders': instance.TotalOrders,
      'TotalAreaCovered': instance.TotalAreaCovered,
      'TotalPending': instance.TotalPending,
      'TotalDelivered': instance.TotalDelivered,
      'TotalCancelled': instance.TotalCancelled,
      'TotalListings': instance.TotalListings,
    };
