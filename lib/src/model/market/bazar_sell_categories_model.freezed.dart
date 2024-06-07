// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bazar_sell_categories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BazarSellCategoryModel _$BazarSellCategoryModelFromJson(
    Map<String, dynamic> json) {
  return _BazarSellCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$BazarSellCategoryModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get parent_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BazarSellCategoryModelCopyWith<BazarSellCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BazarSellCategoryModelCopyWith<$Res> {
  factory $BazarSellCategoryModelCopyWith(BazarSellCategoryModel value,
          $Res Function(BazarSellCategoryModel) then) =
      _$BazarSellCategoryModelCopyWithImpl<$Res, BazarSellCategoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? name,
      String? title,
      String? icon,
      String? parent_id});
}

/// @nodoc
class _$BazarSellCategoryModelCopyWithImpl<$Res,
        $Val extends BazarSellCategoryModel>
    implements $BazarSellCategoryModelCopyWith<$Res> {
  _$BazarSellCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? title = freezed,
    Object? icon = freezed,
    Object? parent_id = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      parent_id: freezed == parent_id
          ? _value.parent_id
          : parent_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BazarSellCategoryModelImplCopyWith<$Res>
    implements $BazarSellCategoryModelCopyWith<$Res> {
  factory _$$BazarSellCategoryModelImplCopyWith(
          _$BazarSellCategoryModelImpl value,
          $Res Function(_$BazarSellCategoryModelImpl) then) =
      __$$BazarSellCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String? name,
      String? title,
      String? icon,
      String? parent_id});
}

/// @nodoc
class __$$BazarSellCategoryModelImplCopyWithImpl<$Res>
    extends _$BazarSellCategoryModelCopyWithImpl<$Res,
        _$BazarSellCategoryModelImpl>
    implements _$$BazarSellCategoryModelImplCopyWith<$Res> {
  __$$BazarSellCategoryModelImplCopyWithImpl(
      _$BazarSellCategoryModelImpl _value,
      $Res Function(_$BazarSellCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? title = freezed,
    Object? icon = freezed,
    Object? parent_id = freezed,
  }) {
    return _then(_$BazarSellCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      parent_id: freezed == parent_id
          ? _value.parent_id
          : parent_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BazarSellCategoryModelImpl implements _BazarSellCategoryModel {
  const _$BazarSellCategoryModelImpl(
      {@JsonKey(name: "_id") required this.id,
      this.name,
      this.title,
      this.icon,
      this.parent_id});

  factory _$BazarSellCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BazarSellCategoryModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String? name;
  @override
  final String? title;
  @override
  final String? icon;
  @override
  final String? parent_id;

  @override
  String toString() {
    return 'BazarSellCategoryModel(id: $id, name: $name, title: $title, icon: $icon, parent_id: $parent_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BazarSellCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.parent_id, parent_id) ||
                other.parent_id == parent_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, title, icon, parent_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BazarSellCategoryModelImplCopyWith<_$BazarSellCategoryModelImpl>
      get copyWith => __$$BazarSellCategoryModelImplCopyWithImpl<
          _$BazarSellCategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BazarSellCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _BazarSellCategoryModel implements BazarSellCategoryModel {
  const factory _BazarSellCategoryModel(
      {@JsonKey(name: "_id") required final String id,
      final String? name,
      final String? title,
      final String? icon,
      final String? parent_id}) = _$BazarSellCategoryModelImpl;

  factory _BazarSellCategoryModel.fromJson(Map<String, dynamic> json) =
      _$BazarSellCategoryModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String? get name;
  @override
  String? get title;
  @override
  String? get icon;
  @override
  String? get parent_id;
  @override
  @JsonKey(ignore: true)
  _$$BazarSellCategoryModelImplCopyWith<_$BazarSellCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
