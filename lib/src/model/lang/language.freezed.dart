// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Lang {
  String get title => throw _privateConstructorUsedError;
  String get lang => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LangCopyWith<Lang> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangCopyWith<$Res> {
  factory $LangCopyWith(Lang value, $Res Function(Lang) then) =
      _$LangCopyWithImpl<$Res, Lang>;
  @useResult
  $Res call(
      {String title, String lang, String code, String avatar, bool available});
}

/// @nodoc
class _$LangCopyWithImpl<$Res, $Val extends Lang>
    implements $LangCopyWith<$Res> {
  _$LangCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lang = null,
    Object? code = null,
    Object? avatar = null,
    Object? available = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LangImplCopyWith<$Res> implements $LangCopyWith<$Res> {
  factory _$$LangImplCopyWith(
          _$LangImpl value, $Res Function(_$LangImpl) then) =
      __$$LangImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String lang, String code, String avatar, bool available});
}

/// @nodoc
class __$$LangImplCopyWithImpl<$Res>
    extends _$LangCopyWithImpl<$Res, _$LangImpl>
    implements _$$LangImplCopyWith<$Res> {
  __$$LangImplCopyWithImpl(_$LangImpl _value, $Res Function(_$LangImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lang = null,
    Object? code = null,
    Object? avatar = null,
    Object? available = null,
  }) {
    return _then(_$LangImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LangImpl implements _Lang {
  const _$LangImpl(
      {required this.title,
      required this.lang,
      required this.code,
      required this.avatar,
      this.available = false});

  @override
  final String title;
  @override
  final String lang;
  @override
  final String code;
  @override
  final String avatar;
  @override
  @JsonKey()
  final bool available;

  @override
  String toString() {
    return 'Lang(title: $title, lang: $lang, code: $code, avatar: $avatar, available: $available)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LangImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, lang, code, avatar, available);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LangImplCopyWith<_$LangImpl> get copyWith =>
      __$$LangImplCopyWithImpl<_$LangImpl>(this, _$identity);
}

abstract class _Lang implements Lang {
  const factory _Lang(
      {required final String title,
      required final String lang,
      required final String code,
      required final String avatar,
      final bool available}) = _$LangImpl;

  @override
  String get title;
  @override
  String get lang;
  @override
  String get code;
  @override
  String get avatar;
  @override
  bool get available;
  @override
  @JsonKey(ignore: true)
  _$$LangImplCopyWith<_$LangImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
