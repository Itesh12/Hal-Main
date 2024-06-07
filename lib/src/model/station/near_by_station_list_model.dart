import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../drawer/station_partner_form_model.dart';

part 'near_by_station_list_model.freezed.dart';
part 'near_by_station_list_model.g.dart';

List<NearByStaionListModel> nearByStaionListModelFromJson(String str) =>
    List<NearByStaionListModel>.from(
        json.decode(str).map((x) => NearByStaionListModel.fromJson(x)));

@freezed
abstract class NearByStaionListModel with _$NearByStaionListModel {
  const factory NearByStaionListModel(
      {@JsonKey(name: "_id") required String id,
      required double distance,
      required StationPartnerAddressModel ksLocation,
      required String ksId,
      required String ksName}) = _NearByStaionListModel;

  factory NearByStaionListModel.fromJson(Map<String, dynamic> json) =>
      _$NearByStaionListModelFromJson(json);
}
