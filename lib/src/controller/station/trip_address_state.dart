import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kisaan_station/src/infrastructure/repository/station/service/drone_service_repo.dart';

part 'trip_address_state.freezed.dart';

@freezed
class TripAddressState with _$TripAddressState {
  const factory TripAddressState.loading() = Loading;
  const factory TripAddressState.data(TripLocationData data) = Data;
}