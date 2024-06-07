// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  String? get userId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get authToken => throw _privateConstructorUsedError;
  bool? get hasRegistered => throw _privateConstructorUsedError;
  List<String>? get hasDcAccess => throw _privateConstructorUsedError;
  String? get fcm_token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {String? userId,
      String? message,
      String? authToken,
      bool? hasRegistered,
      List<String>? hasDcAccess,
      String? fcm_token});
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? message = freezed,
    Object? authToken = freezed,
    Object? hasRegistered = freezed,
    Object? hasDcAccess = freezed,
    Object? fcm_token = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      hasRegistered: freezed == hasRegistered
          ? _value.hasRegistered
          : hasRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasDcAccess: freezed == hasDcAccess
          ? _value.hasDcAccess
          : hasDcAccess // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fcm_token: freezed == fcm_token
          ? _value.fcm_token
          : fcm_token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? message,
      String? authToken,
      bool? hasRegistered,
      List<String>? hasDcAccess,
      String? fcm_token});
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? message = freezed,
    Object? authToken = freezed,
    Object? hasRegistered = freezed,
    Object? hasDcAccess = freezed,
    Object? fcm_token = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
      hasRegistered: freezed == hasRegistered
          ? _value.hasRegistered
          : hasRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasDcAccess: freezed == hasDcAccess
          ? _value._hasDcAccess
          : hasDcAccess // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fcm_token: freezed == fcm_token
          ? _value.fcm_token
          : fcm_token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl extends _LoginResponse {
  const _$LoginResponseImpl(
      {this.userId,
      this.message,
      this.authToken,
      this.hasRegistered,
      final List<String>? hasDcAccess,
      this.fcm_token})
      : _hasDcAccess = hasDcAccess,
        super._();

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? message;
  @override
  final String? authToken;
  @override
  final bool? hasRegistered;
  final List<String>? _hasDcAccess;
  @override
  List<String>? get hasDcAccess {
    final value = _hasDcAccess;
    if (value == null) return null;
    if (_hasDcAccess is EqualUnmodifiableListView) return _hasDcAccess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? fcm_token;

  @override
  String toString() {
    return 'LoginResponse(userId: $userId, message: $message, authToken: $authToken, hasRegistered: $hasRegistered, hasDcAccess: $hasDcAccess, fcm_token: $fcm_token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.hasRegistered, hasRegistered) ||
                other.hasRegistered == hasRegistered) &&
            const DeepCollectionEquality()
                .equals(other._hasDcAccess, _hasDcAccess) &&
            (identical(other.fcm_token, fcm_token) ||
                other.fcm_token == fcm_token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      message,
      authToken,
      hasRegistered,
      const DeepCollectionEquality().hash(_hasDcAccess),
      fcm_token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse extends LoginResponse {
  const factory _LoginResponse(
      {final String? userId,
      final String? message,
      final String? authToken,
      final bool? hasRegistered,
      final List<String>? hasDcAccess,
      final String? fcm_token}) = _$LoginResponseImpl;
  const _LoginResponse._() : super._();

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get message;
  @override
  String? get authToken;
  @override
  bool? get hasRegistered;
  @override
  List<String>? get hasDcAccess;
  @override
  String? get fcm_token;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
