import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/station/logistics/sell/upload_logistics_model.dart';




final logisticsOwnerDetailProvider = StateProvider<OwnerDetailsModel?>((ref) => null);

final logisticsDriverDetailProvider = StateProvider<DriverDetailsModel?>((ref) => null);

final logisticsAddressDetailProvider = StateProvider<AddressDetailsModel?>((ref) => null);


final logisticsVehicleDetailsProvider = StateProvider<VehicleDetailsModel?>((ref) => null);

final logisticsBankDetailsProvider = StateProvider<BankDetailsModel?>((ref) => null);


final logisticsKycDetailsProvider = StateProvider<KycDetailsModel?>((ref) => null);



final vehicleImageListProvider = StateProvider<List<File>>((ref) => []);
final aadhaarImageListProvider = StateProvider<List<File>>((ref) => []);
final panImageListProvider = StateProvider<List<File>>((ref) => []);
final rcImageListProvider = StateProvider<List<File>>((ref) => []);
final dlImageListProvider = StateProvider<List<File>>((ref) => []);
final insuranceImageListProvider = StateProvider<List<File>>((ref) => []);
final pucImageListProvider = StateProvider<List<File>>((ref) => []);

// final tripStartLocationProvider =
// StateNotifierProvider<StationPartnerAddress, String>((ref) {
//   return StationPartnerAddress();
// });



