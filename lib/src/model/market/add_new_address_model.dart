
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_new_address_model.freezed.dart';
part 'add_new_address_model.g.dart';


@freezed
abstract class AddNewAddressModel with _$AddNewAddressModel {
  const factory AddNewAddressModel({
 required String userId,
    required String state,
    required String district,
    required String pinCode,
    required String area,
    required String locationType,
     String? landMark,
     String? wtsUpMobileNo,
    required double latitude,
    required double longitude,
  }) = _AddNewAddressModel;

  factory AddNewAddressModel.fromJson(Map<String, dynamic> json) => _$AddNewAddressModelFromJson(json);
}
