//
//
// import 'dart:convert';
//
// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'irrigation_details.freezed.dart';
// part 'irrigation_details.g.dart';
//
// IrrigationDetails IrrigationDetailsFromJson(String str) => IrrigationDetails.fromJson(json.decode(str));
//
// String IrrigationDetailsToJson(IrrigationDetails data) => json.encode(data.toJson());
// @freezed
// abstract class IrrigationDetails with _$IrrigationDetails {
//   const factory IrrigationDetails({
//     required String status,
//      String? period,
//      int? waterQuantity,
//      String? method
//   }) = _IrrigationDetails;
//
//   factory IrrigationDetails.fromJson(Map<String, dynamic> json) => _$IrrigationDetailsFromJson(json);
// }
