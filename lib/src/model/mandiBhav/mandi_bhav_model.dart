import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'mandi_bhav_model.freezed.dart';
part 'mandi_bhav_model.g.dart';

MandiBhavModel mandiBhavModelFromJson(String str) => MandiBhavModel.fromJson(json.decode(str));

String mandiBhavModelToJson(MandiBhavModel data) => json.encode(data.toJson());

@freezed
abstract class MandiBhavModel with _$MandiBhavModel {
  const factory MandiBhavModel({
    required DateTime created_date,
    required DateTime updated_date,
    required String active,
    required String source,
    required String desc,
    required String message,
    required int total,
    required int count,
    required String limit,
    required List<Record> records,
  }) = _MandiBhavModel;

  factory MandiBhavModel.fromJson(Map<String, dynamic> json) => _$MandiBhavModelFromJson(json);
}

@freezed
abstract class Record with _$Record {
  const factory Record({
    required String state,
    required String district,
    required String market,
    required String commodity,
    required String variety,
    required String arrival_date,
    required String min_price,
    required String max_price,
    required String modal_price,
  }) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
