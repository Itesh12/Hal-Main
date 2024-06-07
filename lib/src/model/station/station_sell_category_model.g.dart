// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_sell_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationSellCategoryModelImpl _$$StationSellCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StationSellCategoryModelImpl(
      id: json['_id'] as String,
      title: json['title'] as String?,
      image: json['image'] as String?,
      parentId: json['parentId'] as String?,
      trading: json['trading'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$$StationSellCategoryModelImplToJson(
        _$StationSellCategoryModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'parentId': instance.parentId,
      'trading': instance.trading,
      'source': instance.source,
    };
