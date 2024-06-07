// To parse this JSON data, do
//
//     final listingproductDetailsModel = listingproductDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'listingproduct_details_model.freezed.dart';
part 'listingproduct_details_model.g.dart';

List<ListingproductDetailsModel> listingproductDetailsModelFromJson(
        String str) =>
    List<ListingproductDetailsModel>.from(
        json.decode(str).map((x) => ListingproductDetailsModel.fromJson(x)));

String listingproductDetailsModelToJson(
        List<ListingproductDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class ListingproductDetailsModel with _$ListingproductDetailsModel {
  const factory ListingproductDetailsModel({
    @JsonKey(name: "_id") required String id,
    required String serviceName,
    required String sellingProductId,
    required String droneRegNo,
    required List<String> droneImages,
    required String serviceDescription,
    required List<SelectedStation> selectedStations,
  }) = _ListingproductDetailsModel;

  factory ListingproductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ListingproductDetailsModelFromJson(json);
}

@freezed
abstract class SelectedStation with _$SelectedStation {
  const factory SelectedStation({
    required KsLocation ksLocation,
    required String ksName,
  }) = _SelectedStation;

  factory SelectedStation.fromJson(Map<String, dynamic> json) =>
      _$SelectedStationFromJson(json);
}

@freezed
abstract class KsLocation with _$KsLocation {
  const factory KsLocation({
    required String address,
    required String state,
  }) = _KsLocation;

  factory KsLocation.fromJson(Map<String, dynamic> json) =>
      _$KsLocationFromJson(json);
}
