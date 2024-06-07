import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_user_model.freezed.dart';
part 'follow_user_model.g.dart';

@freezed
abstract class FollowParam with _$FollowParam {
  const factory FollowParam({
    required String userId,
    required bool isFollowing,
  }) = _FollowParam;

  factory FollowParam.fromJson(Map<String, dynamic> json) =>
      _$FollowParamFromJson(json);
}
