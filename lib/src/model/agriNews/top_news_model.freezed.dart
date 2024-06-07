// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopNewsModel _$TopNewsModelFromJson(Map<String, dynamic> json) {
  return _TopNewsModel.fromJson(json);
}

/// @nodoc
mixin _$TopNewsModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<Image>? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopNewsModelCopyWith<TopNewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopNewsModelCopyWith<$Res> {
  factory $TopNewsModelCopyWith(
          TopNewsModel value, $Res Function(TopNewsModel) then) =
      _$TopNewsModelCopyWithImpl<$Res, TopNewsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? title,
      List<Image>? image,
      String? description,
      int viewCount,
      DateTime createdAt,
      String status});
}

/// @nodoc
class _$TopNewsModelCopyWithImpl<$Res, $Val extends TopNewsModel>
    implements $TopNewsModelCopyWith<$Res> {
  _$TopNewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? viewCount = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopNewsModelImplCopyWith<$Res>
    implements $TopNewsModelCopyWith<$Res> {
  factory _$$TopNewsModelImplCopyWith(
          _$TopNewsModelImpl value, $Res Function(_$TopNewsModelImpl) then) =
      __$$TopNewsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? title,
      List<Image>? image,
      String? description,
      int viewCount,
      DateTime createdAt,
      String status});
}

/// @nodoc
class __$$TopNewsModelImplCopyWithImpl<$Res>
    extends _$TopNewsModelCopyWithImpl<$Res, _$TopNewsModelImpl>
    implements _$$TopNewsModelImplCopyWith<$Res> {
  __$$TopNewsModelImplCopyWithImpl(
      _$TopNewsModelImpl _value, $Res Function(_$TopNewsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? viewCount = null,
    Object? createdAt = null,
    Object? status = null,
  }) {
    return _then(_$TopNewsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopNewsModelImpl implements _TopNewsModel {
  const _$TopNewsModelImpl(
      {@JsonKey(name: "_id") required this.id,
      this.title,
      final List<Image>? image,
      this.description,
      required this.viewCount,
      required this.createdAt,
      required this.status})
      : _image = image;

  factory _$TopNewsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopNewsModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String? title;
  final List<Image>? _image;
  @override
  List<Image>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;
  @override
  final int viewCount;
  @override
  final DateTime createdAt;
  @override
  final String status;

  @override
  String toString() {
    return 'TopNewsModel(id: $id, title: $title, image: $image, description: $description, viewCount: $viewCount, createdAt: $createdAt, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopNewsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_image),
      description,
      viewCount,
      createdAt,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopNewsModelImplCopyWith<_$TopNewsModelImpl> get copyWith =>
      __$$TopNewsModelImplCopyWithImpl<_$TopNewsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopNewsModelImplToJson(
      this,
    );
  }
}

abstract class _TopNewsModel implements TopNewsModel {
  const factory _TopNewsModel(
      {@JsonKey(name: "_id") required final String id,
      final String? title,
      final List<Image>? image,
      final String? description,
      required final int viewCount,
      required final DateTime createdAt,
      required final String status}) = _$TopNewsModelImpl;

  factory _TopNewsModel.fromJson(Map<String, dynamic> json) =
      _$TopNewsModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String? get title;
  @override
  List<Image>? get image;
  @override
  String? get description;
  @override
  int get viewCount;
  @override
  DateTime get createdAt;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$TopNewsModelImplCopyWith<_$TopNewsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  String get mediaUrl => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
  @useResult
  $Res call({String mediaUrl, String mediaType});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

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
abstract class _$$ImageImplCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$ImageImplCopyWith(
          _$ImageImpl value, $Res Function(_$ImageImpl) then) =
      __$$ImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mediaUrl, String mediaType});
}

/// @nodoc
class __$$ImageImplCopyWithImpl<$Res>
    extends _$ImageCopyWithImpl<$Res, _$ImageImpl>
    implements _$$ImageImplCopyWith<$Res> {
  __$$ImageImplCopyWithImpl(
      _$ImageImpl _value, $Res Function(_$ImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrl = null,
    Object? mediaType = null,
  }) {
    return _then(_$ImageImpl(
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
class _$ImageImpl implements _Image {
  const _$ImageImpl({required this.mediaUrl, required this.mediaType});

  factory _$ImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageImplFromJson(json);

  @override
  final String mediaUrl;
  @override
  final String mediaType;

  @override
  String toString() {
    return 'Image(mediaUrl: $mediaUrl, mediaType: $mediaType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageImpl &&
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
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      __$$ImageImplCopyWithImpl<_$ImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageImplToJson(
      this,
    );
  }
}

abstract class _Image implements Image {
  const factory _Image(
      {required final String mediaUrl,
      required final String mediaType}) = _$ImageImpl;

  factory _Image.fromJson(Map<String, dynamic> json) = _$ImageImpl.fromJson;

  @override
  String get mediaUrl;
  @override
  String get mediaType;
  @override
  @JsonKey(ignore: true)
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
