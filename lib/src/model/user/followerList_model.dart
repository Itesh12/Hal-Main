import 'package:freezed_annotation/freezed_annotation.dart';

part 'followerList_model.freezed.dart';
part 'followerList_model.g.dart';

@freezed
class FollowerListModel with _$FollowerListModel {
  const factory FollowerListModel({
    @JsonKey(name: "follower_id") required String followingId,
    required String name,
    required String username,
    @JsonKey(name: "following_status") required bool followingStatus,
    String? image,
  }) = _FollowerListModel;

  const FollowerListModel._();

  factory FollowerListModel.fromJson(Map<String, dynamic> json) =>
      _$FollowerListModelFromJson(json);
}

@freezed
class FollowingListModel with _$FollowingListModel {
  const factory FollowingListModel({
    @JsonKey(name: "following_id") required String followingId,
    required String name,
    required String username,
    @JsonKey(name: "following_status") required bool followingStatus,
    String? image,
  }) = _FollowingListModel;

  const FollowingListModel._();

  factory FollowingListModel.fromJson(Map<String, dynamic> json) =>
      _$FollowingListModelFromJson(json);
}
