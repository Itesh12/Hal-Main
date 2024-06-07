import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kisaan_station/src/model/agriNews/top_news_model.dart';

part 'news_list_model.freezed.dart';
part 'news_list_model.g.dart';

@freezed
class NewsListModel with _$NewsListModel {
  const factory NewsListModel({
    required String status,
    required int totalResults,
    required List<TopNewsModel> articles,
  }) = _NewsListModel;

  const NewsListModel._();

  factory NewsListModel.fromJson(Map<String, dynamic> json) =>
      _$NewsListModelFromJson(json);
}
