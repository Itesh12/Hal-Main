import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';

import '../../../model/social/post/post_model.dart';
import '../../../util/services/shared_preferences.dart';

class PerticularPostController extends StateNotifier<Post> {
  PerticularPostController(
    this.ref, {
    required Post state,
  }) : super(state);

  final Ref ref;

  final userId = UserPreferences.userId;

  void increamentCommentCount() {
    Post pst = state;
    pst = pst.copyWith(commentCount: pst.commentCount + 1);
    state = pst;
  }

  void decrementCommentCount(int count) {
    Post pst = state;
    if (pst.commentCount > 0) {
      pst = pst.copyWith(commentCount: pst.commentCount - (count + 1));
    }
    state = pst;
  }

  void increamentLikeCount() {
    Post pst = state;
    pst = pst.copyWith(totalLikes: pst.totalLikes + 1, likeDislike: true);
    state = pst;
  }

  void decrementLikeCount() {
    Post pst = state;
    if (pst.totalLikes > 0) {
      pst = pst.copyWith(totalLikes: pst.totalLikes - 1, likeDislike: false);
    }
    state = pst;
  }

  Future<void> likePost(
      {required bool likeStat, required String entityId}) async {
    try {
      if (likeStat) {
        increamentLikeCount();

        await ref
            .read(postProvider)
            .likePost(entityId: entityId, userId: userId, like: likeStat);
      } else {
        decrementLikeCount();
        await ref
            .read(postProvider)
            .likePost(entityId: entityId, userId: userId, like: likeStat);
      }
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> reportUser({
    required String otherUserId,
    required String postId,
    required String reportReason,
  }) async {
    try {
      await ref.read(userRepoProvider).reportUser(
          otherUserId: otherUserId,
          userId: userId,
          postId: postId,
          reportReason: reportReason);
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> followUser({
    required String otherUserId,
  }) async {
    try {
      await ref
          .read(postProvider)
          .followUser(otherUserId: otherUserId, userId: userId);
      follow();
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> unfollowUser({
    required String otherUserId,
  }) async {
    try {
      await ref
          .read(postProvider)
          .unFollowUser(otherUserId: otherUserId, userId: userId);
      unfollow();
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  void follow() {
    Post pst = state;
    if (!pst.followingStatus) {
      pst = pst.copyWith(followingStatus: true);
      state = pst;
    }
  }

  void unfollow() {
    Post pst = state;
    if (pst.followingStatus) {
      pst = pst.copyWith(followingStatus: false);
      state = pst;
    }
  }

  Future<void> addComment(
      {required String comment, required String entityId}) async {
    try {
      increamentCommentCount();
      final cmt = await ref.read(postProvider).commentOnPost(
            entityId: entityId,
            comment: comment,
            userId: userId,
          );
      if (cmt != null) {
        ref.read(commentListProvider(entityId)).addComment(cmt);
      }
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> deleteComment(
      {required String postId, required String commentId}) async {
    try {
      await ref
          .read(postProvider)
          .deleteComment(commentId: commentId, postId: postId);
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }
}
