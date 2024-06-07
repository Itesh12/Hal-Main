// // To parse this JSON data, do
// //
// //     final cropDetail = cropDetailFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import 'crop_report_model.dart';
//
// part 'crop_detail.freezed.dart';
// part 'crop_detail.g.dart';
//
// List<CropDetail> cropDetailFromJson(String str) =>
//     List<CropDetail>.from(json.decode(str).map((x) => CropDetail.fromJson(x)));
//
// String cropDetailToJson(List<CropDetail> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// @freezed
// abstract class CropDetail with _$CropDetail {
//   const factory CropDetail({
//     required String nameOfCrop,
//     required DateTime sowingDate,
//     required double cropArea,
//     required String cropAreaUnit,
//     required String cropDescription,
//     required String cropReportStatus,
//     @JsonKey(name: '_id', includeIfNull: false) String? id,
//   }) = _CropDetail;
//
//   factory CropDetail.fromJson(Map<String, dynamic> json) =>
//       _$CropDetailFromJson(json);
// }
