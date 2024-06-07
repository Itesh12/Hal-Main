// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bazar_sell_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BazarSellCategoryModelImpl _$$BazarSellCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BazarSellCategoryModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String?,
      title: json['title'] as String?,
      icon: json['icon'] as String?,
      parent_id: json['parent_id'] as String?,
    );

Map<String, dynamic> _$$BazarSellCategoryModelImplToJson(
        _$BazarSellCategoryModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'icon': instance.icon,
      'parent_id': instance.parent_id,
    };
