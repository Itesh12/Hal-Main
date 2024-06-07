// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OTPState {
  int? get timeUp => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OTPStateCopyWith<OTPState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTPStateCopyWith<$Res> {
  factory $OTPStateCopyWith(OTPState value, $Res Function(OTPState) then) =
      _$OTPStateCopyWithImpl<$Res, OTPState>;
  @useResult
  $Res call({int? timeUp, String otp});
}

/// @nodoc
class _$OTPStateCopyWithImpl<$Res, $Val extends OTPState>
    implements $OTPStateCopyWith<$Res> {
  _$OTPStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeUp = freezed,
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      timeUp: freezed == timeUp
          ? _value.timeUp
          : timeUp // ignore: cast_nullable_to_non_nullable
              as int?,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OTPStateImplCopyWith<$Res>
    implements $OTPStateCopyWith<$Res> {
  factory _$$OTPStateImplCopyWith(
          _$OTPStateImpl value, $Res Function(_$OTPStateImpl) then) =
      __$$OTPStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? timeUp, String otp});
}

/// @nodoc
class __$$OTPStateImplCopyWithImpl<$Res>
    extends _$OTPStateCopyWithImpl<$Res, _$OTPStateImpl>
    implements _$$OTPStateImplCopyWith<$Res> {
  __$$OTPStateImplCopyWithImpl(
      _$OTPStateImpl _value, $Res Function(_$OTPStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeUp = freezed,
    Object? otp = null,
  }) {
    return _then(_$OTPStateImpl(
      timeUp: freezed == timeUp
          ? _value.timeUp
          : timeUp // ignore: cast_nullable_to_non_nullable
              as int?,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OTPStateImpl implements _OTPState {
  const _$OTPStateImpl({this.timeUp = 30, this.otp = ""});

  @override
  @JsonKey()
  final int? timeUp;
  @override
  @JsonKey()
  final String otp;

  @override
  String toString() {
    return 'OTPState(timeUp: $timeUp, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OTPStateImpl &&
            (identical(other.timeUp, timeUp) || other.timeUp == timeUp) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeUp, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OTPStateImplCopyWith<_$OTPStateImpl> get copyWith =>
      __$$OTPStateImplCopyWithImpl<_$OTPStateImpl>(this, _$identity);
}

abstract class _OTPState implements OTPState {
  const factory _OTPState({final int? timeUp, final String otp}) =
      _$OTPStateImpl;

  @override
  int? get timeUp;
  @override
  String get otp;
  @override
  @JsonKey(ignore: true)
  _$$OTPStateImplCopyWith<_$OTPStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
