import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.loading() = Loading;
  const factory AddressState.data(Placemark address) = Data;
}
