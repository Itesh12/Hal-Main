import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/drawer/station_partner_form_model.dart';

final stationPartnerAddressProvider =
    StateNotifierProvider<StationPartnerAddress, String>((ref) {
  return StationPartnerAddress();
});

final latLongProvider =
    StateNotifierProvider<LatLong, StationPartnerAddressModel>((ref) {
  return LatLong();
});

final stationPartnerAddressStringProvider =
    StateNotifierProvider.autoDispose<StationPartnerAddressString, String>(
        (ref) {
  return StationPartnerAddressString();
});

class StationPartnerAddress extends StateNotifier<String> {
  StationPartnerAddress() : super("");

  editAddress(String address) {
    state = address;
  }
}

class LatLong extends StateNotifier<StationPartnerAddressModel> {
  LatLong()
      : super(const StationPartnerAddressModel(
            type: '', address: '', state: '', pinCode: '', coordinates: [0,0]));

  editAddress({required double long, required double lat}) {
    final List<double> coord = [];
    coord.insert(0, lat);
    coord.insert(1, long);
    state = state.copyWith(coordinates: coord, type: 'Point');
  }
}

class StationPartnerAddressString extends StateNotifier<String> {
  StationPartnerAddressString() : super("");

  editAddress(String address) {
    state = address;
  }
}
