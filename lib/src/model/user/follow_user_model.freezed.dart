// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowParam _$FollowParamFromJson(Map<String, dynamic> json) {
  return _FollowParam.fromJson(json);
}

/// @nodoc
mixin _$FollowParam {
  String get userId => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowParamCopyWith<FollowParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowParamCopyWith<$Res> {
  factory $FollowParamCopyWith(
          FollowParam value, $Res Function(FollowParam) then) =
      _$FollowParamCopyWithImpl<$Res, FollowParam>;
  @useResult
  $Res call({String userId, bool isFollowing});
}

/// @nodoc
class _$FollowParamCopyWithImpl<$Res, $Val extends FollowParam>
    implements $FollowParamCopyWith<$Res> {
  _$FollowParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isFollowing = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowParamImplCopyWith<$Res>
    implements $FollowParamCopyWith<$Res> {
  factory _$$FollowParamImplCopyWith(
          _$FollowParamImpl value, $Res Function(_$FollowParamImpl) then) =
      __$$FollowParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, bool isFollowing});
}

/// @nodoc
class __$$FollowParamImplCopyWithImpl<$Res>
    extends _$FollowParamCopyWithImpl<$Res, _$FollowParamImpl>
    implements _$$FollowParamImplCopyWith<$Res> {
  __$$FollowParamImplCopyWithImpl(
      _$FollowParamImpl _value, $Res Function(_$FollowParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isFollowing = null,
  }) {
    return _then(_$FollowParamImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowParamImpl implements _FollowParam {
  const _$FollowParamImpl({required this.userId, required this.isFollowing});

  factory _$FollowParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowParamImplFromJson(json);

  @override
  final String userId;
  @override
  final bool isFollowing;

  @override
  String toString() {
    return 'FollowParam(userId: $userId, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowParamImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, isFollowing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowParamImplCopyWith<_$FollowParamImpl> get copyWith =>
      __$$FollowParamImplCopyWithImpl<_$FollowParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowParamImplToJson(
      this,
    );
  }
}

abstract class _FollowParam implements FollowParam {
  const factory _FollowParam(
      {required final String userId,
      required final bool isFollowing}) = _$FollowParamImpl;

  factory _FollowParam.fromJson(Map<String, dynamic> json) =
      _$FollowParamImpl.fromJson;

  @override
  String get userId;
  @override
  bool get isFollowing;
  @override
  @JsonKey(ignore: true)
  _$$FollowParamImplCopyWith<_$FollowParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
