import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/controller/station/state/selected_station_state.dart';

import '../../model/station/near_by_station_list_model.dart';

final selectedKisaanStationProvider =
    StateNotifierProvider.autoDispose<SelectedKisaanStationProvider, SelectedStationState>(
        (ref) {
  return SelectedKisaanStationProvider();
});

class SelectedKisaanStationProvider
    extends StateNotifier<SelectedStationState> {
  SelectedKisaanStationProvider() : super(const SelectedStationState.alreadySelected());

  editAddress({required NearByStaionListModel nearByStaionListModel}) {
    state = SelectedStationState.new(nearByStaionListModel);
  }

  void destroy() {
    state = const SelectedStationState.alreadySelected();
  }
}
