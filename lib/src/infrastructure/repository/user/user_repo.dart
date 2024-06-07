import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/user/blocked_list_model.dart';
import '../../../model/user/followerList_model.dart';
import '../../../model/user/profile_update_model.dart';
import '../../../model/user/user_model.dart';
import '../../http/api_provider.dart';

class UserRepository {
  UserRepository(this.ref);

  final Ref ref;


  Future<User?> getUserDetail(
      {required String userId, required String stalkerId}) async {
    User? _user;
    final res = await ref.read(apiProvider).get(
      '/registration/userdetails',
      query: {"userId": userId, "stalkerId": stalkerId},
    );

    res.when(
      success: (source) {
        _user = User.fromJson(source);
      },
      error: (error) {
        debugPrint(error.toString());
        throw error;
      },
    );
    return _user;
  }

  Future<void> followUser({
    required String otherUserId,
    required String userId,
  }) async {
    final res = await ref.read(apiProvider).post('/follow_user',
        body: {"follower_id": userId, "followed_id": otherUserId});
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<void> blockUser({
    required String blockedByUserId,
    required String blockedUserId,
  }) async {
    final res = await ref.read(apiProvider).post('/post/block-user/', body: {
      "blockedByUserId": blockedByUserId,
      "blockedUserId": blockedUserId
    });
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<void> reportUser({
    required String otherUserId,
    required String userId,
    required String postId,
    required String reportReason,
  }) async {
    final res = await ref.read(apiProvider).post('/post/report-post', body: {
      "reporterUserId": userId,
      "reportedUserId": otherUserId,
      "postId": postId,
      "reportReason": reportReason
    });
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  // ignore: non_constant_identifier_names

  Future<void> reportAccount({
    required String reporterUserId,
    required String reportedUserId,
    required String reportReason,
  }) async {
    final res = await ref.read(apiProvider).post('/report-user-account', body: {
      "reporterUserId": reporterUserId,
      "reportedUserId": reportedUserId,
      "reportReason": reportReason
    });
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<ProfileUpdateModel?> updateProfile(
      {required ProfileUpdateRepoModel user, File? image}) async {
    ProfileUpdateModel? _user;
    final FormData formData = FormData.fromMap(user.toJson());


    if (image != null) {
      final fileName = image.path.split('/').last;
      debugPrint('inside repo${image.path}');

      final MultipartFile formImage =
          await MultipartFile.fromFile(image.path, filename: fileName);
      formData.files.add(MapEntry("profile", formImage));
    }

    final res = await ref.read(apiProvider).put(
          '/registration/updateProfile/',
          body: formData,
          contentType: ContentType.multipart,
        );

    res.when(
      success: (source) {
        _user = ProfileUpdateModel.fromJson(source);

        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
    return _user;
  }

  Future<void> unFollowUser({
    required String otherUserId,
    required String userId,
  }) async {
    final res = await ref.read(apiProvider).post('/unfollow_user',
        body: {"follower_id": userId, "followed_id": otherUserId});
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<dynamic> unBlockUser(
      {required String stalkerId, required String blockedUserId}) async {
    final res = await ref.read(apiProvider).delete('/post/unblock-user/',
        body: {"stalkerId": stalkerId, "blockedUserId": blockedUserId});
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<List<FollowerListModel>> getFollowerList({
    required int page,
    required String stalkerId,
    required String userId,
  }) async {
    List<FollowerListModel> followerList = [];

    final res = await ref.read(apiProvider).get('/followers',
        query: {"stalkerId": stalkerId, "userId": userId, "page": page});

    res.when(
      success: (source) {
        final List<FollowerListModel> data = List<FollowerListModel>.from(
            source.map((x) => FollowerListModel.fromJson(x)));


        debugPrint(data.toString());
        followerList = data;
      },
      error: (error) {
        throw error;
      },
    );
    return followerList;
  }

  Future<List<FollowingListModel>> getFollowingList({
    required int page,
    required String stalkerId,
    required String userId,
  }) async {
    List<FollowingListModel> followingList = [];

    final res = await ref.read(apiProvider).get('/following',
        query: {"stalkerId": stalkerId, "userId": userId, "page": page});
    res.when(
      success: (source) {
        final List<FollowingListModel> data = List<FollowingListModel>.from(
            source.map((x) => FollowingListModel.fromJson(x)));

        debugPrint(data.toString());
        followingList = data;
      },
      error: (error) {
        throw error;
      },
    );
    return followingList;
  }

  Future<List<BlockedListModel>> getBlockedList({
    required String stalkerId,
  }) async {
    List<BlockedListModel> blockedList = [];

    final res = await ref
        .read(apiProvider)
        .get('/post/block-users-list/', query: {"stalkerId": stalkerId});
    res.when(
      success: (source) {
        final List<BlockedListModel> data = List<BlockedListModel>.from(
            source.map((x) => BlockedListModel.fromJson(x)));

        debugPrint(data.toString());
        blockedList = data;
      },
      error: (error) {
        throw error;
      },
    );
    return blockedList;
  }
}
