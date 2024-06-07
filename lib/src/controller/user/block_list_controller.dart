import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_providers.dart';
import '../../model/user/blocked_list_model.dart';
import '../../util/services/shared_preferences.dart';

class BlockUserNotifier
    extends StateNotifier<AsyncValue<List<BlockedListModel>>> {
  BlockUserNotifier(this.ref) : super(const AsyncLoading()) {
    _initBlockUser();
  }

  final Ref ref;

  final stalkerId = UserPreferences.userId;

  // final List<BlockedListModel> _blocked = [];

  // List<BlockedListModel> get blocked => _blocked;

  Future<void> _initBlockUser() async {
    try {
      final _usr =
          await ref.read(userRepoProvider).getBlockedList(stalkerId: stalkerId);
      state = AsyncData(_usr);
    } on Exception catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> blockUser({
    required String blockedUserId,
    required String blockedByUserId,
  }) async {
    try {
      await ref
          .read(userRepoProvider)
          .blockUser(blockedByUserId: stalkerId, blockedUserId: blockedUserId);

      block(blockedUserId);
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> unblockUser({
    required String otherUserId,
    required String stalkerId,
  }) async {
    try {
      await ref
          .read(userRepoProvider)
          .unBlockUser(stalkerId: stalkerId, blockedUserId: otherUserId);
      unblock(otherUserId);
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  void block(String id) {
    final List<BlockedListModel> blockuserList = state.asData!.value;
    final newList = blockuserList;
    final newUsr = blockuserList.firstWhere((element) => element.id == id);
    final index = blockuserList.indexWhere((element) => element.id == id);
    final newusr2 = newUsr.copyWith(isBlocked: true);
    newList[index] = newusr2;

    // for (var element in newList) {
    //   if (element.id == id) {
    //     element = element.copyWith(isBlocked: false);
    //     print("unblock mein ja rha h");
    //   }
    // }
    // debugPrint(newList.toString());
    state = AsyncValue.data(newList);
  }

  void unblock(String id) {
    final List<BlockedListModel> blockuserList = state.asData!.value;
    final newList = blockuserList;
    final newUsr = blockuserList.firstWhere((element) => element.id == id);
    final index = blockuserList.indexWhere((element) => element.id == id);
    final newusr2 = newUsr.copyWith(isBlocked: false);
    newList[index] = newusr2;

    // for (var element in newList) {
    //   if (element.id == id) {
    //     element = element.copyWith(isBlocked: false);
    //     print("unblock mein ja rha h");
    //   }
    // }
    // debugPrint(newList.toString());
    state = AsyncValue.data(newList);
  }
}
