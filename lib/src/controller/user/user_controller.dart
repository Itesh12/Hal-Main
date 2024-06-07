import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/model/user/profile_update_model.dart';

import '../../../global_providers.dart';
import '../../model/user/user_model.dart';
import '../../util/services/shared_preferences.dart';
import '../../view/widget/dialogs/loading_dialog.dart';
import '../../view/widget/dialogs/success_dialog.dart';

class UserNotifier extends StateNotifier<AsyncValue<User>> {
  UserNotifier(this.ref, {required this.userId}) : super(const AsyncLoading()) {
    initUser();
  }

  final Ref ref;
  final String userId;

  final stalkerId = UserPreferences.userId;

  Future<void> initUser() async {
    final _usr = await ref
        .read(userRepoProvider)
        .getUserDetail(userId: userId, stalkerId: stalkerId);
    if (_usr != null) {
      state = AsyncData(_usr);
    }
  }

  void setUser(User user) {
    state = AsyncData(user);
  }

  ///add updateusercontroller

  Future<void> updateProfile(BuildContext context,
      {required ProfileUpdateRepoModel user, File? image}) async {
    try {
      showLoading(context);
      final editProfile = await ref
          .read(userRepoProvider)
          .updateProfile(user: user, image: image);
      User pst = state.asData!.value;
      if (editProfile != null) {
        pst = pst.copyWith(
            name: editProfile.user[0].name,
            profilePic: editProfile.user[0].profilePic,
            description: editProfile.user[0].description);
        state = AsyncValue.data(pst);
      }
      Navigator.pop(context);

      successDialog(context, message: 'Details Updated Succesfully',
          onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
      // Navigator.pop(context);

      //
      //
      //   pst = pst.copyWith(followingStatus: false);
      //   state = AsyncValue.data(pst);

    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> followUser({
    required String otherUserId,
  }) async {
    try {
      await ref
          .read(userRepoProvider)
          .followUser(otherUserId: otherUserId, userId: stalkerId);
      follow();
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> reportaccount({
    required String otherUserId,
    required String reportReason,
  }) async {
    try {
      await ref.read(userRepoProvider).reportAccount(
          reporterUserId: userId,
          reportedUserId: otherUserId,
          reportReason: reportReason);
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> blockUser({
    required String blockedByUserId,
    required String blockedUserId,
  }) async {
    try {
      await ref
          .read(userRepoProvider)
          .blockUser(blockedByUserId: userId, blockedUserId: blockedUserId);
      ref.refresh(postListProvider);
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> unfollowUser({
    required String otherUserId,
  }) async {
    try {
      await ref
          .read(userRepoProvider)
          .unFollowUser(otherUserId: otherUserId, userId: stalkerId);
      unfollow();
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> unblockUser({
    required String otherUserId,
  }) async {
    try {
      await ref
          .read(userRepoProvider)
          .unBlockUser(stalkerId: userId, blockedUserId: otherUserId);
      unfollow();
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> removeUser({
    required String otherUserId,
  }) async {
    try {
      await ref
          .read(userRepoProvider)
          .unFollowUser(otherUserId: stalkerId, userId: otherUserId);
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  void increamentFollowingCount() {
    User user = state.asData!.value;
    user = user.copyWith(followingCount: user.followingCount + 1);
    state = AsyncValue.data(user);
  }

  void decrementFollowingCount() {
    User user = state.asData!.value;
    if (user.followingCount > 0) {
      user = user.copyWith(followingCount: user.followingCount - 1);
    }
    state = AsyncValue.data(user);
  }

  void increamentFollowerCount() {
    User user = state.asData!.value;
    user = user.copyWith(followersCount: user.followersCount + 1);
    state = AsyncValue.data(user);
  }

  void decrementFollowerCount() {
    User user = state.asData!.value;
    if (user.followersCount > 0) {
      user = user.copyWith(followersCount: user.followersCount - 1);
    }
    state = AsyncValue.data(user);
  }

  void follow() {
    User user = state.asData!.value;
    if (user.followingStatus) {
      user = user.copyWith(followingStatus: true);
      state = AsyncValue.data(user);
    }
  }

  void unfollow() {
    User user = state.asData!.value;
    if (!user.followingStatus) {
      user = user.copyWith(followingStatus: false);
      state = AsyncValue.data(user);
    }
  }
}
