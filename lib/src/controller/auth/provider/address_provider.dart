import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

import '../../../../global_providers.dart';
import '../state/address_state.dart';

class AddressNotifier extends StateNotifier<AddressState> {
  AddressNotifier(this.ref) : super(const AddressState.loading());

  final Ref ref;

  Future<void> getAddress(LocationData position) async {
    try {
      final address =
          await ref.read(locationProvider).getPlaceMark(locationData: position);
      if (address != null) {
        state = AddressState.data(address);
      }
    } catch (e) {
      state = const AddressState.loading();
    }
  }

  void destroy() {
    state = const AddressState.loading();
  }
}
