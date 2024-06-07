import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/model/social/post/comment_model.dart';

import '../../../util/services/shared_preferences.dart';

class PerticularCommentController extends StateNotifier<Comment> {
  PerticularCommentController(
    this.ref, {
    required Comment state,
  }) : super(state);

  final Ref ref;

  final userId = UserPreferences.userId;

  void increamentReplyCount() {
    Comment cmnt = state;
    cmnt = cmnt.copyWith(repliesCount: cmnt.repliesCount + 1);
    state = cmnt;
  }

  void decrementReplyCount(int count) {
    Comment cmnt = state;
    if (cmnt.repliesCount > 0) {
      cmnt = cmnt.copyWith(repliesCount: cmnt.repliesCount - (count + 1));
    }
    state = cmnt;
  }

  Future<void> replyOnComment(
      {required String reply, required String entityId}) async {
    try {
      increamentReplyCount();
      final rpl = await ref.read(postProvider).replyOnComment(
            entityId: entityId,
            reply: reply,
            userId: userId,
          );
      if (rpl != null) {
        ref.read(replyListProvider(entityId)).addReply(rpl);
      }
    } on Exception catch (e) {
      developer.log(e.toString());
    }
  }
}
