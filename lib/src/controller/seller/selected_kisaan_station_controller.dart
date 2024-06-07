// The StateNotifier class that will be passed to our StateNotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/station/near_by_station_list_model.dart';

class StationNotifier extends StateNotifier<List<NearByStaionListModel>> {
  // We initialize the list of todos to an empty list
  StationNotifier() : super([]);

  // Let's allow the UI to add todos.
  void addTodo(NearByStaionListModel station) {
    // Since our state is immutable, we are not allowed to do `state.add(todo)`.
    // Instead, we should create a new list of todos which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    state = [...state, station];
    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
  }

  // Let's allow removing todos
  void removeTodo(String selectstationId) {
    // Again, our state is immutable. So we're making a new list instead of
    // changing the existing list.
    state = [
      for (final stationList in state)
        if (stationList.id != selectstationId) stationList,
    ];
  }
}

final selectedStatusProvider =
    Provider.family.autoDispose<bool, String>((ref, id) {
  return ref.watch(stationsProvider).any((element) => element.id == id);
});

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final stationsProvider =
    StateNotifierProvider<StationNotifier, List<NearByStaionListModel>>((ref) {
  return StationNotifier();
});
