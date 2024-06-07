// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followerList_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowerListModel _$FollowerListModelFromJson(Map<String, dynamic> json) {
  return _FollowerListModel.fromJson(json);
}

/// @nodoc
mixin _$FollowerListModel {
  @JsonKey(name: "follower_id")
  String get followingId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "following_status")
  bool get followingStatus => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowerListModelCopyWith<FollowerListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowerListModelCopyWith<$Res> {
  factory $FollowerListModelCopyWith(
          FollowerListModel value, $Res Function(FollowerListModel) then) =
      _$FollowerListModelCopyWithImpl<$Res, FollowerListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "follower_id") String followingId,
      String name,
      String username,
      @JsonKey(name: "following_status") bool followingStatus,
      String? image});
}

/// @nodoc
class _$FollowerListModelCopyWithImpl<$Res, $Val extends FollowerListModel>
    implements $FollowerListModelCopyWith<$Res> {
  _$FollowerListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingId = null,
    Object? name = null,
    Object? username = null,
    Object? followingStatus = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      followingId: null == followingId
          ? _value.followingId
          : followingId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      followingStatus: null == followingStatus
          ? _value.followingStatus
          : followingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowerListModelImplCopyWith<$Res>
    implements $FollowerListModelCopyWith<$Res> {
  factory _$$FollowerListModelImplCopyWith(_$FollowerListModelImpl value,
          $Res Function(_$FollowerListModelImpl) then) =
      __$$FollowerListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "follower_id") String followingId,
      String name,
      String username,
      @JsonKey(name: "following_status") bool followingStatus,
      String? image});
}

/// @nodoc
class __$$FollowerListModelImplCopyWithImpl<$Res>
    extends _$FollowerListModelCopyWithImpl<$Res, _$FollowerListModelImpl>
    implements _$$FollowerListModelImplCopyWith<$Res> {
  __$$FollowerListModelImplCopyWithImpl(_$FollowerListModelImpl _value,
      $Res Function(_$FollowerListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingId = null,
    Object? name = null,
    Object? username = null,
    Object? followingStatus = null,
    Object? image = freezed,
  }) {
    return _then(_$FollowerListModelImpl(
      followingId: null == followingId
          ? _value.followingId
          : followingId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      followingStatus: null == followingStatus
          ? _value.followingStatus
          : followingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowerListModelImpl extends _FollowerListModel {
  const _$FollowerListModelImpl(
      {@JsonKey(name: "follower_id") required this.followingId,
      required this.name,
      required this.username,
      @JsonKey(name: "following_status") required this.followingStatus,
      this.image})
      : super._();

  factory _$FollowerListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowerListModelImplFromJson(json);

  @override
  @JsonKey(name: "follower_id")
  final String followingId;
  @override
  final String name;
  @override
  final String username;
  @override
  @JsonKey(name: "following_status")
  final bool followingStatus;
  @override
  final String? image;

  @override
  String toString() {
    return 'FollowerListModel(followingId: $followingId, name: $name, username: $username, followingStatus: $followingStatus, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowerListModelImpl &&
            (identical(other.followingId, followingId) ||
                other.followingId == followingId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.followingStatus, followingStatus) ||
                other.followingStatus == followingStatus) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, followingId, name, username, followingStatus, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowerListModelImplCopyWith<_$FollowerListModelImpl> get copyWith =>
      __$$FollowerListModelImplCopyWithImpl<_$FollowerListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowerListModelImplToJson(
      this,
    );
  }
}

abstract class _FollowerListModel extends FollowerListModel {
  const factory _FollowerListModel(
      {@JsonKey(name: "follower_id") required final String followingId,
      required final String name,
      required final String username,
      @JsonKey(name: "following_status") required final bool followingStatus,
      final String? image}) = _$FollowerListModelImpl;
  const _FollowerListModel._() : super._();

  factory _FollowerListModel.fromJson(Map<String, dynamic> json) =
      _$FollowerListModelImpl.fromJson;

  @override
  @JsonKey(name: "follower_id")
  String get followingId;
  @override
  String get name;
  @override
  String get username;
  @override
  @JsonKey(name: "following_status")
  bool get followingStatus;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$FollowerListModelImplCopyWith<_$FollowerListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingListModel _$FollowingListModelFromJson(Map<String, dynamic> json) {
  return _FollowingListModel.fromJson(json);
}

/// @nodoc
mixin _$FollowingListModel {
  @JsonKey(name: "following_id")
  String get followingId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: "following_status")
  bool get followingStatus => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingListModelCopyWith<FollowingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingListModelCopyWith<$Res> {
  factory $FollowingListModelCopyWith(
          FollowingListModel value, $Res Function(FollowingListModel) then) =
      _$FollowingListModelCopyWithImpl<$Res, FollowingListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "following_id") String followingId,
      String name,
      String username,
      @JsonKey(name: "following_status") bool followingStatus,
      String? image});
}

/// @nodoc
class _$FollowingListModelCopyWithImpl<$Res, $Val extends FollowingListModel>
    implements $FollowingListModelCopyWith<$Res> {
  _$FollowingListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingId = null,
    Object? name = null,
    Object? username = null,
    Object? followingStatus = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      followingId: null == followingId
          ? _value.followingId
          : followingId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      followingStatus: null == followingStatus
          ? _value.followingStatus
          : followingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingListModelImplCopyWith<$Res>
    implements $FollowingListModelCopyWith<$Res> {
  factory _$$FollowingListModelImplCopyWith(_$FollowingListModelImpl value,
          $Res Function(_$FollowingListModelImpl) then) =
      __$$FollowingListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "following_id") String followingId,
      String name,
      String username,
      @JsonKey(name: "following_status") bool followingStatus,
      String? image});
}

/// @nodoc
class __$$FollowingListModelImplCopyWithImpl<$Res>
    extends _$FollowingListModelCopyWithImpl<$Res, _$FollowingListModelImpl>
    implements _$$FollowingListModelImplCopyWith<$Res> {
  __$$FollowingListModelImplCopyWithImpl(_$FollowingListModelImpl _value,
      $Res Function(_$FollowingListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingId = null,
    Object? name = null,
    Object? username = null,
    Object? followingStatus = null,
    Object? image = freezed,
  }) {
    return _then(_$FollowingListModelImpl(
      followingId: null == followingId
          ? _value.followingId
          : followingId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      followingStatus: null == followingStatus
          ? _value.followingStatus
          : followingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingListModelImpl extends _FollowingListModel {
  const _$FollowingListModelImpl(
      {@JsonKey(name: "following_id") required this.followingId,
      required this.name,
      required this.username,
      @JsonKey(name: "following_status") required this.followingStatus,
      this.image})
      : super._();

  factory _$FollowingListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingListModelImplFromJson(json);

  @override
  @JsonKey(name: "following_id")
  final String followingId;
  @override
  final String name;
  @override
  final String username;
  @override
  @JsonKey(name: "following_status")
  final bool followingStatus;
  @override
  final String? image;

  @override
  String toString() {
    return 'FollowingListModel(followingId: $followingId, name: $name, username: $username, followingStatus: $followingStatus, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingListModelImpl &&
            (identical(other.followingId, followingId) ||
                other.followingId == followingId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.followingStatus, followingStatus) ||
                other.followingStatus == followingStatus) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, followingId, name, username, followingStatus, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingListModelImplCopyWith<_$FollowingListModelImpl> get copyWith =>
      __$$FollowingListModelImplCopyWithImpl<_$FollowingListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingListModelImplToJson(
      this,
    );
  }
}

abstract class _FollowingListModel extends FollowingListModel {
  const factory _FollowingListModel(
      {@JsonKey(name: "following_id") required final String followingId,
      required final String name,
      required final String username,
      @JsonKey(name: "following_status") required final bool followingStatus,
      final String? image}) = _$FollowingListModelImpl;
  const _FollowingListModel._() : super._();

  factory _FollowingListModel.fromJson(Map<String, dynamic> json) =
      _$FollowingListModelImpl.fromJson;

  @override
  @JsonKey(name: "following_id")
  String get followingId;
  @override
  String get name;
  @override
  String get username;
  @override
  @JsonKey(name: "following_status")
  bool get followingStatus;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$FollowingListModelImplCopyWith<_$FollowingListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
