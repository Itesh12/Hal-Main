// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_sell_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StationSellCategoryModel _$StationSellCategoryModelFromJson(
    Map<String, dynamic> json) {
  return _StationSellCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$StationSellCategoryModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  String? get trading => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationSellCategoryModelCopyWith<StationSellCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationSellCategoryModelCopyWith<$Res> {
  factory $StationSellCategoryModelCopyWith(StationSellCategoryModel value,
          $Res Function(StationSellCategoryModel) then) =
      _$StationSellCategoryModelCopyWithImpl<$Res, StationSellCategoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? title,
      String? image,
      String? parentId,
      String? trading,
      String? source});
}

/// @nodoc
class _$StationSellCategoryModelCopyWithImpl<$Res,
        $Val extends StationSellCategoryModel>
    implements $StationSellCategoryModelCopyWith<$Res> {
  _$StationSellCategoryModelCopyWithImpl(this._value, this._then);

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
    Object? parentId = freezed,
    Object? trading = freezed,
    Object? source = freezed,
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
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      trading: freezed == trading
          ? _value.trading
          : trading // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationSellCategoryModelImplCopyWith<$Res>
    implements $StationSellCategoryModelCopyWith<$Res> {
  factory _$$StationSellCategoryModelImplCopyWith(
          _$StationSellCategoryModelImpl value,
          $Res Function(_$StationSellCategoryModelImpl) then) =
      __$$StationSellCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? title,
      String? image,
      String? parentId,
      String? trading,
      String? source});
}

/// @nodoc
class __$$StationSellCategoryModelImplCopyWithImpl<$Res>
    extends _$StationSellCategoryModelCopyWithImpl<$Res,
        _$StationSellCategoryModelImpl>
    implements _$$StationSellCategoryModelImplCopyWith<$Res> {
  __$$StationSellCategoryModelImplCopyWithImpl(
      _$StationSellCategoryModelImpl _value,
      $Res Function(_$StationSellCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? image = freezed,
    Object? parentId = freezed,
    Object? trading = freezed,
    Object? source = freezed,
  }) {
    return _then(_$StationSellCategoryModelImpl(
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
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      trading: freezed == trading
          ? _value.trading
          : trading // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationSellCategoryModelImpl implements _StationSellCategoryModel {
  const _$StationSellCategoryModelImpl(
      {@JsonKey(name: "_id") required this.id,
      this.title,
      this.image,
      this.parentId,
      this.trading,
      this.source});

  factory _$StationSellCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationSellCategoryModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? parentId;
  @override
  final String? trading;
  @override
  final String? source;

  @override
  String toString() {
    return 'StationSellCategoryModel(id: $id, title: $title, image: $image, parentId: $parentId, trading: $trading, source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationSellCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.trading, trading) || other.trading == trading) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, parentId, trading, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationSellCategoryModelImplCopyWith<_$StationSellCategoryModelImpl>
      get copyWith => __$$StationSellCategoryModelImplCopyWithImpl<
          _$StationSellCategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationSellCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _StationSellCategoryModel implements StationSellCategoryModel {
  const factory _StationSellCategoryModel(
      {@JsonKey(name: "_id") required final String id,
      final String? title,
      final String? image,
      final String? parentId,
      final String? trading,
      final String? source}) = _$StationSellCategoryModelImpl;

  factory _StationSellCategoryModel.fromJson(Map<String, dynamic> json) =
      _$StationSellCategoryModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String? get title;
  @override
  String? get image;
  @override
  String? get parentId;
  @override
  String? get trading;
  @override
  String? get source;
  @override
  @JsonKey(ignore: true)
  _$$StationSellCategoryModelImplCopyWith<_$StationSellCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
