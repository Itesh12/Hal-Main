import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String locationType,
    required String state,
    required String district,
    required String pinCode,
    required String area,
    required double latitude,
    required double longitude,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
