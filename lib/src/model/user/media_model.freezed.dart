// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  @HiveField(0)
  String get mediaUrl => throw _privateConstructorUsedError;
  @HiveField(1)
  String get mediaType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call({@HiveField(0) String mediaUrl, @HiveField(1) String mediaType});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrl = null,
    Object? mediaType = null,
  }) {
    return _then(_value.copyWith(
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaImplCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$MediaImplCopyWith(
          _$MediaImpl value, $Res Function(_$MediaImpl) then) =
      __$$MediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String mediaUrl, @HiveField(1) String mediaType});
}

/// @nodoc
class __$$MediaImplCopyWithImpl<$Res>
    extends _$MediaCopyWithImpl<$Res, _$MediaImpl>
    implements _$$MediaImplCopyWith<$Res> {
  __$$MediaImplCopyWithImpl(
      _$MediaImpl _value, $Res Function(_$MediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrl = null,
    Object? mediaType = null,
  }) {
    return _then(_$MediaImpl(
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaImpl implements _Media {
  const _$MediaImpl(
      {@HiveField(0) required this.mediaUrl,
      @HiveField(1) required this.mediaType});

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

  @override
  @HiveField(0)
  final String mediaUrl;
  @override
  @HiveField(1)
  final String mediaType;

  @override
  String toString() {
    return 'Media(mediaUrl: $mediaUrl, mediaType: $mediaType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaImpl &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mediaUrl, mediaType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      __$$MediaImplCopyWithImpl<_$MediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaImplToJson(
      this,
    );
  }
}

abstract class _Media implements Media {
  const factory _Media(
      {@HiveField(0) required final String mediaUrl,
      @HiveField(1) required final String mediaType}) = _$MediaImpl;

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  @HiveField(0)
  String get mediaUrl;
  @override
  @HiveField(1)
  String get mediaType;
  @override
  @JsonKey(ignore: true)
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
