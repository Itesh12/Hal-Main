// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsListModelImpl _$$NewsListModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsListModelImpl(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => TopNewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewsListModelImplToJson(_$NewsListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
