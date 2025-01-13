import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/infrastructure/repository/station/service/drone_service_repo.dart';
// import 'package:kisaan_station/src/infrastructure/repository/station/service/logistic_service_repo.dart';
import 'package:kisaan_station/src/model/station/logistics/service/logistics_service_model.dart';

// import '../../auth/state/address_state.dart';
// import '../trip_address_state.dart';

// final tripLocationProvider =
// StateNotifierProvider.autoDispose<TripAddressNotifier, AddressState>((ref) {
//   return TripAddressNotifier(ref);
// });

final tripStartLocationProvider = StateProvider<TripLocationData?>((ref) {
  return null;
});
//
final tripDropLocationProvider = StateProvider<TripLocationData?>((ref) {
  return null;
});

final bookLogisticsProvider = StateProvider<BookLogisticsModel?>((ref) {
  return null;
});

// class TripAddressNotifier extends StateNotifier<TripAddressState> {
//   TripAddressNotifier(this.ref) : super(const TripAddressState.loading());
//
//   final Ref ref;
//
//   Future<void> getStartAddress() async {
//     try {
//       final address = ref.read(tripStartLocationProvider);
//       if (address != null) {
//         state = TripAddressState.data(address);
//       }
//     } catch (e) {
//       state = const TripAddressState.loading();
//     }
//   }
//
//   Future<void> getDropAddress() async {
//     try {
//       final address = ref.read(tripDropLocationProvider);
//       if (address != null) {
//         state = TripAddressState.data(address);
//       }
//     } catch (e) {
//       state = const TripAddressState.loading();
//     }
//   }
//
//   void destroy() {
//     state = const TripAddressState.loading();
//   }
// }
