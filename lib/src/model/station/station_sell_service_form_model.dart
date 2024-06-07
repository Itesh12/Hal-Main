
import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_sell_service_form_model.freezed.dart';
part 'station_sell_service_form_model.g.dart';


@freezed
abstract class SellDroneServicesTextFieldModel with _$SellDroneServicesTextFieldModel {
  const factory SellDroneServicesTextFieldModel({
    required String sellerUserId,
    required  String name,
    required String mobileNo,
    required String selectKs,
    required int TotalDrones,
    String? droneDetails,

  }) = _SellDroneServicesTextFieldModel;

  factory SellDroneServicesTextFieldModel.fromJson(Map<String, dynamic> json) =>
      _$SellDroneServicesTextFieldModelFromJson(json);
}

