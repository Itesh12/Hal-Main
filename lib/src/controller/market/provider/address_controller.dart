import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/model/market/user_address_model.dart';

import '../../../../global_providers.dart';

final bazarAddressProvider =
    StateNotifierProvider<BazarAddressNotifier, List<Address>>((ref) {
  return BazarAddressNotifier(ref);
});

class BazarAddressNotifier extends StateNotifier<List<Address>> {
  BazarAddressNotifier(this.ref) : super([]) {
    _initAddress();
  }

  final Ref ref;

  Future<void> _initAddress() async {
    try {
      final val = await ref.read(sellPostProvider).getUserAddress();
      state = val.address;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> refresh() async {
    try {
      final val = await ref.read(sellPostProvider).getUserAddress();
      state = val.address;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
