import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../model/social/post/comment_model.dart';
import '../../../model/social/post/post_model.dart';
import '../../http/api_provider.dart';

class PostRepository {
  PostRepository(this.ref);

  final Ref ref;

  Future<void> createPost({
    required List<File> images,
    File? video,
    String? url,
    String? desc,
    String? type,
    required double latitude,
    required double longitude,
  }) async {
    final FormData formData = FormData.fromMap({
      "userId": UserPreferences.userId,
      "postDescription": desc,
      "postType": type,
      "latitude": latitude,
      "longitude": longitude,
    });

    if (images.isNotEmpty) {
      final List<MapEntry<String, MultipartFile>> formImages = [];
      for (final image in images) {
        final fileName = image.path.split('/').last;
        final ms = MapEntry(
          'files',
          await MultipartFile.fromFile(image.path, filename: fileName),
        );
        formImages.add(ms);
      }

      formData.files.addAll(formImages);
    } else if (video != null) {
      final fileName = video.path.split('/').last;

      final MultipartFile formImage =
          await MultipartFile.fromFile(video.path, filename: fileName);
      formData.files.add(MapEntry("files", formImage));
    } else if (url != null) {
      formData.fields.add(MapEntry("link", url));
    }

    final res = await ref.read(apiProvider).post(
          '/post/createPost',
          body: formData,
          contentType: ContentType.multipart,
        );

    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<List<Post>> getPosts(int page) async {
    final userId = UserPreferences.userId;

    List<Post> posts = [];
    final res = await ref
        .read(apiProvider)
        .get('/post/getPosts/', query: {"page": page, "stalkerId": userId, "size":10});

    res.when(
      success: (source) {
        posts = List<Post>.from(source.map((x) => Post.fromJson(x)));
      },
      error: (error) {
        throw error;
      },
    );
    return posts;
  }

  Future<List<Post>> getUserPosts(
      {required int page, required String userId}) async {
    final stakerId = UserPreferences.userId;

    List<Post> posts = [];
    final res = await ref.read(apiProvider).get('/post/userPosts/',
        query: {"page": page, "stalkerId": stakerId, "userId": userId});

    res.when(
      success: (source) {
        posts = List<Post>.from(source.map((x) => Post.fromJson(x)));
      },
      error: (error) {
        throw error;
      },
    );
    return posts;
  }

  Future<Post?> getPostDetail({
    required String postId,
    required String stalkerId,
  }) async {
    final userId = UserPreferences.userId;

    Post? post;
    final res = await ref.read(apiProvider).get('/post/getPostDetail',
        query: {"postId": postId, "stalkerId": userId});

    res.when(
      success: (source) {
        print("This");
        debugPrint(source.toString());
        post = Post.fromJson(source);
      },
      error: (error) {
        print("Errror");
        print(error.toString());
        return null;
      },
    );
    return post;
  }

  Future<List<Comment>> getComments({
    required int page,
    required String postId,
  }) async {
    List<Comment> comments = [];
    final res = await ref.read(apiProvider).get('/post/getComments_replies/',
        query: {"page": page, "entityId": postId});

    res.when(
      success: (source) {
        comments = List<Comment>.from(source.map((x) => Comment.fromJson(x)));
      },
      error: (error) {
        throw error;
      },
    );
    return comments;
  }

  Future<List<Comment>> getOneReply({
    required int page,
    required String commentId,
  }) async {
    List<Comment> replies = [];
    final res = await ref.read(apiProvider).get('/post/getComments_replies/',
        query: {"page": page, "entityId": commentId, "size": 1});

    res.when(
      success: (source) {
        replies = List<Comment>.from(source.map((x) => Comment.fromJson(x)));
      },
      error: (error) {
        throw error;
      },
    );
    return replies;
  }

  Future<List<Comment>> getReplies({
    required int page,
    required String commentId,
  }) async {
    List<Comment> replies = [];
    final res = await ref.read(apiProvider).get('/post/getComments_replies/',
        query: {"page": page, "entityId": commentId});

    res.when(
      success: (source) {
        replies = List<Comment>.from(source.map((x) => Comment.fromJson(x)));
      },
      error: (error) {
        throw error;
      },
    );
    return replies;
  }

  Future<bool> likePost({
    required String entityId,
    required String userId,
    required bool like,
  }) async {
    bool liked = false;

    final res = await ref.read(apiProvider).post('/post/postLike',
        body: {"entityId": entityId, "userId": userId, "like": like});

    res.when(
      success: (source) {
        debugPrint(source["message"]);

        liked = true;
      },
      error: (error) {
        throw error;
      },
    );
    return liked;
  }

  Future<Comment?> commentOnPost({
    required String entityId,
    required String comment,
    required String userId,
  }) async {
    Comment? commentRes;

    final FormData formData = FormData.fromMap({
      "entityId": entityId,
      "userId": userId,
      "message": comment,
    });

    final res = await ref.read(apiProvider).post(
          '/post/comment_replies',
          body: formData,
          contentType: ContentType.multipart,
        );

    res.when(
      success: (source) {
        commentRes = Comment(
          id: source["id"],
          entityId: entityId,
          userId: userId,
          name: UserPreferences.userName,
          userProfileImage: UserPreferences.profilePic,
          message: source["comment"],
          repliesCount: 0,
          createdAt: DateTime.now().toUtc(),
        );
      },
      error: (error) {
        throw error;
      },
    );
    return commentRes;
  }

  Future<Comment?> replyOnComment({
    required String entityId,
    required String userId,
    required String reply,
  }) async {
    Comment? replyRes;

    final FormData formData = FormData.fromMap({
      "entityId": entityId,
      "userId": userId,
      "message": reply,
    });

    final res = await ref.read(apiProvider).post(
          '/post/comment_replies',
          body: formData,
          contentType: ContentType.multipart,
        );

    res.when(
      success: (source) {
        replyRes = Comment(
          id: source["id"],
          entityId: entityId,
          userId: userId,
          name: UserPreferences.userName,
          userProfileImage: UserPreferences.profilePic,
          message: source["reply"],
          repliesCount: 0,
          createdAt: DateTime.now().toUtc(),
        );
      },
      error: (error) {
        throw error;
      },
    );
    return replyRes;
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

  Future<void> removeFollower({
    required String otherUserId,
    required String userId,
  }) async {
    final res = await ref.read(apiProvider).post('/unfollow_user',
        body: {"follower_id": otherUserId, "followed_id": userId});
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<void> deletePost({
    required String postId,
  }) async {
    final res = await ref.read(apiProvider).delete(
          '/post/$postId/${UserPreferences.userId}',
        );
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<void> hidePost({
    required String userId,
    required String otherUserId,
    required String postId,
  }) async {
    final res = await ref.read(apiProvider).post('/post/hide-post', body: {
      "reportedUserId": otherUserId,
      "reporterUserId": userId,
      "postId": postId
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

  Future<void> deleteComment({
    required String commentId,
    required String postId,
  }) async {
    final res = await ref.read(apiProvider).delete(
          '/post/deleteComment_replies/$postId/${UserPreferences.userId}/$commentId',
        );
    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }
}


