// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  @HiveField(0)
  String get postId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get postType => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get userProfileImage => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get link => throw _privateConstructorUsedError;
  @HiveField(5)
  String get name => throw _privateConstructorUsedError;
  @HiveField(6)
  String get postDescription => throw _privateConstructorUsedError;
  @HiveField(7)
  List<Media> get media => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(9)
  int get totalLikes => throw _privateConstructorUsedError;
  @HiveField(10)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(11)
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "like_dislike")
  @HiveField(12)
  bool get likeDislike => throw _privateConstructorUsedError;
  @JsonKey(name: "comment_count")
  @HiveField(13)
  int get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: "report_count")
  @HiveField(14)
  int get reportCount => throw _privateConstructorUsedError;
  @JsonKey(name: "following_status")
  @HiveField(15)
  bool get followingStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {@HiveField(0) String postId,
      @HiveField(1) String userId,
      @HiveField(2) String postType,
      @HiveField(3) String? userProfileImage,
      @HiveField(4) String? link,
      @HiveField(5) String name,
      @HiveField(6) String postDescription,
      @HiveField(7) List<Media> media,
      @HiveField(8) DateTime createdAt,
      @HiveField(9) int totalLikes,
      @HiveField(10) double latitude,
      @HiveField(11) double longitude,
      @JsonKey(name: "like_dislike") @HiveField(12) bool likeDislike,
      @JsonKey(name: "comment_count") @HiveField(13) int commentCount,
      @JsonKey(name: "report_count") @HiveField(14) int reportCount,
      @JsonKey(name: "following_status") @HiveField(15) bool followingStatus});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? userId = null,
    Object? postType = null,
    Object? userProfileImage = freezed,
    Object? link = freezed,
    Object? name = null,
    Object? postDescription = null,
    Object? media = null,
    Object? createdAt = null,
    Object? totalLikes = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? likeDislike = null,
    Object? commentCount = null,
    Object? reportCount = null,
    Object? followingStatus = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postType: null == postType
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      postDescription: null == postDescription
          ? _value.postDescription
          : postDescription // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalLikes: null == totalLikes
          ? _value.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      likeDislike: null == likeDislike
          ? _value.likeDislike
          : likeDislike // ignore: cast_nullable_to_non_nullable
              as bool,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingStatus: null == followingStatus
          ? _value.followingStatus
          : followingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String postId,
      @HiveField(1) String userId,
      @HiveField(2) String postType,
      @HiveField(3) String? userProfileImage,
      @HiveField(4) String? link,
      @HiveField(5) String name,
      @HiveField(6) String postDescription,
      @HiveField(7) List<Media> media,
      @HiveField(8) DateTime createdAt,
      @HiveField(9) int totalLikes,
      @HiveField(10) double latitude,
      @HiveField(11) double longitude,
      @JsonKey(name: "like_dislike") @HiveField(12) bool likeDislike,
      @JsonKey(name: "comment_count") @HiveField(13) int commentCount,
      @JsonKey(name: "report_count") @HiveField(14) int reportCount,
      @JsonKey(name: "following_status") @HiveField(15) bool followingStatus});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? userId = null,
    Object? postType = null,
    Object? userProfileImage = freezed,
    Object? link = freezed,
    Object? name = null,
    Object? postDescription = null,
    Object? media = null,
    Object? createdAt = null,
    Object? totalLikes = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? likeDislike = null,
    Object? commentCount = null,
    Object? reportCount = null,
    Object? followingStatus = null,
  }) {
    return _then(_$PostImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postType: null == postType
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      postDescription: null == postDescription
          ? _value.postDescription
          : postDescription // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalLikes: null == totalLikes
          ? _value.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      likeDislike: null == likeDislike
          ? _value.likeDislike
          : likeDislike // ignore: cast_nullable_to_non_nullable
              as bool,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingStatus: null == followingStatus
          ? _value.followingStatus
          : followingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {@HiveField(0) required this.postId,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.postType,
      @HiveField(3) this.userProfileImage,
      @HiveField(4) this.link,
      @HiveField(5) required this.name,
      @HiveField(6) required this.postDescription,
      @HiveField(7) required final List<Media> media,
      @HiveField(8) required this.createdAt,
      @HiveField(9) required this.totalLikes,
      @HiveField(10) required this.latitude,
      @HiveField(11) required this.longitude,
      @JsonKey(name: "like_dislike") @HiveField(12) required this.likeDislike,
      @JsonKey(name: "comment_count") @HiveField(13) required this.commentCount,
      @JsonKey(name: "report_count") @HiveField(14) required this.reportCount,
      @JsonKey(name: "following_status")
      @HiveField(15)
      required this.followingStatus})
      : _media = media;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  @HiveField(0)
  final String postId;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final String postType;
  @override
  @HiveField(3)
  final String? userProfileImage;
  @override
  @HiveField(4)
  final String? link;
  @override
  @HiveField(5)
  final String name;
  @override
  @HiveField(6)
  final String postDescription;
  final List<Media> _media;
  @override
  @HiveField(7)
  List<Media> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  @HiveField(8)
  final DateTime createdAt;
  @override
  @HiveField(9)
  final int totalLikes;
  @override
  @HiveField(10)
  final double latitude;
  @override
  @HiveField(11)
  final double longitude;
  @override
  @JsonKey(name: "like_dislike")
  @HiveField(12)
  final bool likeDislike;
  @override
  @JsonKey(name: "comment_count")
  @HiveField(13)
  final int commentCount;
  @override
  @JsonKey(name: "report_count")
  @HiveField(14)
  final int reportCount;
  @override
  @JsonKey(name: "following_status")
  @HiveField(15)
  final bool followingStatus;

  @override
  String toString() {
    return 'Post(postId: $postId, userId: $userId, postType: $postType, userProfileImage: $userProfileImage, link: $link, name: $name, postDescription: $postDescription, media: $media, createdAt: $createdAt, totalLikes: $totalLikes, latitude: $latitude, longitude: $longitude, likeDislike: $likeDislike, commentCount: $commentCount, reportCount: $reportCount, followingStatus: $followingStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.postType, postType) ||
                other.postType == postType) &&
            (identical(other.userProfileImage, userProfileImage) ||
                other.userProfileImage == userProfileImage) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.postDescription, postDescription) ||
                other.postDescription == postDescription) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.totalLikes, totalLikes) ||
                other.totalLikes == totalLikes) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.likeDislike, likeDislike) ||
                other.likeDislike == likeDislike) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.reportCount, reportCount) ||
                other.reportCount == reportCount) &&
            (identical(other.followingStatus, followingStatus) ||
                other.followingStatus == followingStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postId,
      userId,
      postType,
      userProfileImage,
      link,
      name,
      postDescription,
      const DeepCollectionEquality().hash(_media),
      createdAt,
      totalLikes,
      latitude,
      longitude,
      likeDislike,
      commentCount,
      reportCount,
      followingStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {@HiveField(0) required final String postId,
      @HiveField(1) required final String userId,
      @HiveField(2) required final String postType,
      @HiveField(3) final String? userProfileImage,
      @HiveField(4) final String? link,
      @HiveField(5) required final String name,
      @HiveField(6) required final String postDescription,
      @HiveField(7) required final List<Media> media,
      @HiveField(8) required final DateTime createdAt,
      @HiveField(9) required final int totalLikes,
      @HiveField(10) required final double latitude,
      @HiveField(11) required final double longitude,
      @JsonKey(name: "like_dislike")
      @HiveField(12)
      required final bool likeDislike,
      @JsonKey(name: "comment_count")
      @HiveField(13)
      required final int commentCount,
      @JsonKey(name: "report_count")
      @HiveField(14)
      required final int reportCount,
      @JsonKey(name: "following_status")
      @HiveField(15)
      required final bool followingStatus}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  @HiveField(0)
  String get postId;
  @override
  @HiveField(1)
  String get userId;
  @override
  @HiveField(2)
  String get postType;
  @override
  @HiveField(3)
  String? get userProfileImage;
  @override
  @HiveField(4)
  String? get link;
  @override
  @HiveField(5)
  String get name;
  @override
  @HiveField(6)
  String get postDescription;
  @override
  @HiveField(7)
  List<Media> get media;
  @override
  @HiveField(8)
  DateTime get createdAt;
  @override
  @HiveField(9)
  int get totalLikes;
  @override
  @HiveField(10)
  double get latitude;
  @override
  @HiveField(11)
  double get longitude;
  @override
  @JsonKey(name: "like_dislike")
  @HiveField(12)
  bool get likeDislike;
  @override
  @JsonKey(name: "comment_count")
  @HiveField(13)
  int get commentCount;
  @override
  @JsonKey(name: "report_count")
  @HiveField(14)
  int get reportCount;
  @override
  @JsonKey(name: "following_status")
  @HiveField(15)
  bool get followingStatus;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
