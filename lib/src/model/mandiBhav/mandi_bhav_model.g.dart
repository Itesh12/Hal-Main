// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mandi_bhav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MandiBhavModelImpl _$$MandiBhavModelImplFromJson(Map<String, dynamic> json) =>
    _$MandiBhavModelImpl(
      created_date: DateTime.parse(json['created_date'] as String),
      updated_date: DateTime.parse(json['updated_date'] as String),
      active: json['active'] as String,
      source: json['source'] as String,
      desc: json['desc'] as String,
      message: json['message'] as String,
      total: json['total'] as int,
      count: json['count'] as int,
      limit: json['limit'] as String,
      records: (json['records'] as List<dynamic>)
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MandiBhavModelImplToJson(
        _$MandiBhavModelImpl instance) =>
    <String, dynamic>{
      'created_date': instance.created_date.toIso8601String(),
      'updated_date': instance.updated_date.toIso8601String(),
      'active': instance.active,
      'source': instance.source,
      'desc': instance.desc,
      'message': instance.message,
      'total': instance.total,
      'count': instance.count,
      'limit': instance.limit,
      'records': instance.records,
    };

_$RecordImpl _$$RecordImplFromJson(Map<String, dynamic> json) => _$RecordImpl(
      state: json['state'] as String,
      district: json['district'] as String,
      market: json['market'] as String,
      commodity: json['commodity'] as String,
      variety: json['variety'] as String,
      arrival_date: json['arrival_date'] as String,
      min_price: json['min_price'] as String,
      max_price: json['max_price'] as String,
      modal_price: json['modal_price'] as String,
    );

Map<String, dynamic> _$$RecordImplToJson(_$RecordImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'district': instance.district,
      'market': instance.market,
      'commodity': instance.commodity,
      'variety': instance.variety,
      'arrival_date': instance.arrival_date,
      'min_price': instance.min_price,
      'max_price': instance.max_price,
      'modal_price': instance.modal_price,
    };
