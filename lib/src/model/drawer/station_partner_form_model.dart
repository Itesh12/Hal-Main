import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_partner_form_model.freezed.dart';
part 'station_partner_form_model.g.dart';

@freezed
class StationPartnerAddressModel with _$StationPartnerAddressModel {
  const factory StationPartnerAddressModel({
    required String address,
    required String state,
    required String pinCode,
    required String type,
    required List<double> coordinates,
  }) = _StationPartnerAddressModel;

  const StationPartnerAddressModel._();

  factory StationPartnerAddressModel.fromJson(Map<String, dynamic> json) =>
      _$StationPartnerAddressModelFromJson(json);
}

@freezed
class StationPartnerFormModel with _$StationPartnerFormModel {
  const factory StationPartnerFormModel({
    required String userId,
    required String name,
    required String mobileNo,
    required String mailId,
    required String ksLocation,
    required String ksName,
    required String ksId,
    required String businessDetails,
  }) = _StationPartnerFormModel;

  const StationPartnerFormModel._();

  factory StationPartnerFormModel.fromJson(Map<String, dynamic> json) =>
      _$StationPartnerFormModelFromJson(json);
}
