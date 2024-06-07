// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get entityId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get userProfileImage => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get mimetype => throw _privateConstructorUsedError;
  @JsonKey(name: "replies_count")
  int get repliesCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String entityId,
      String userId,
      String name,
      String? userProfileImage,
      String? message,
      String? image,
      String? mimetype,
      @JsonKey(name: "replies_count") int repliesCount,
      DateTime createdAt});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entityId = null,
    Object? userId = null,
    Object? name = null,
    Object? userProfileImage = freezed,
    Object? message = freezed,
    Object? image = freezed,
    Object? mimetype = freezed,
    Object? repliesCount = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      mimetype: freezed == mimetype
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String?,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String entityId,
      String userId,
      String name,
      String? userProfileImage,
      String? message,
      String? image,
      String? mimetype,
      @JsonKey(name: "replies_count") int repliesCount,
      DateTime createdAt});
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entityId = null,
    Object? userId = null,
    Object? name = null,
    Object? userProfileImage = freezed,
    Object? message = freezed,
    Object? image = freezed,
    Object? mimetype = freezed,
    Object? repliesCount = null,
    Object? createdAt = null,
  }) {
    return _then(_$CommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      mimetype: freezed == mimetype
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String?,
      repliesCount: null == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.entityId,
      required this.userId,
      required this.name,
      this.userProfileImage,
      this.message,
      this.image,
      this.mimetype,
      @JsonKey(name: "replies_count") required this.repliesCount,
      required this.createdAt});

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String entityId;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String? userProfileImage;
  @override
  final String? message;
  @override
  final String? image;
  @override
  final String? mimetype;
  @override
  @JsonKey(name: "replies_count")
  final int repliesCount;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Comment(id: $id, entityId: $entityId, userId: $userId, name: $name, userProfileImage: $userProfileImage, message: $message, image: $image, mimetype: $mimetype, repliesCount: $repliesCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userProfileImage, userProfileImage) ||
                other.userProfileImage == userProfileImage) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.mimetype, mimetype) ||
                other.mimetype == mimetype) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, entityId, userId, name,
      userProfileImage, message, image, mimetype, repliesCount, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {@JsonKey(name: "_id") required final String id,
      required final String entityId,
      required final String userId,
      required final String name,
      final String? userProfileImage,
      final String? message,
      final String? image,
      final String? mimetype,
      @JsonKey(name: "replies_count") required final int repliesCount,
      required final DateTime createdAt}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get entityId;
  @override
  String get userId;
  @override
  String get name;
  @override
  String? get userProfileImage;
  @override
  String? get message;
  @override
  String? get image;
  @override
  String? get mimetype;
  @override
  @JsonKey(name: "replies_count")
  int get repliesCount;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
