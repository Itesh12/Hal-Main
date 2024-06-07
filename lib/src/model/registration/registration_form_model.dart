import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_form_model.freezed.dart';
part 'registration_form_model.g.dart';

@freezed
class RegistrationFormModel with _$RegistrationFormModel {
  const factory RegistrationFormModel({
    required String userId,
    required String name,
    required String username,
    String? referralCode,
    String? state,
    String? district,
    String? pinCode,
    String? area,
    required double latitude,
    required double longitude,
  }) = _RegistrationFormModel;

  const RegistrationFormModel._();

  factory RegistrationFormModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFormModelFromJson(json);
}
