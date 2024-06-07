import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/station/near_by_station_list_model.dart';

part 'selected_station_state.freezed.dart';

@freezed
class SelectedStationState with _$SelectedStationState {
  const factory SelectedStationState.alreadySelected() = AlreadySelected;

  const factory SelectedStationState.new(NearByStaionListModel nearByStation) =
      Selected;
}
