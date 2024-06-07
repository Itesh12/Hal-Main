// // To parse this JSON data, do
// //
// //     final farmDetail = farmDetailFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:kisaan_station/src/model/farm/irrigation_details.dart';
//
// part 'farm_detail.freezed.dart';
// part 'farm_detail.g.dart';
//
// FarmDetail farmDetailFromJson(String str) => FarmDetail.fromJson(json.decode(str));
//
// String farmDetailToJson(FarmDetail data) => json.encode(data.toJson());
//
// @freezed
// abstract class FarmDetail with _$FarmDetail {
//     const factory FarmDetail({
//         required String type,
//         required List<double> coordinates,
//         required String farmName,
//         required String farmStatus,
//         @JsonKey(name: 'irrigation')
//         required IrrigationDetails irrigation,
//         required double farmArea,
//         required String farmAreaUnit,
//         required String address,
//         required String state,
//         required int pincode,
//     }) = _FarmDetail;
//
//     factory FarmDetail.fromJson(Map<String, dynamic> json) => _$FarmDetailFromJson(json);
// }
