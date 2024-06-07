// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rent_item_textField_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RentItemTextFieldModel _$RentItemTextFieldModelFromJson(
    Map<String, dynamic> json) {
  return _RentItemTextFieldModel.fromJson(json);
}

/// @nodoc
mixin _$RentItemTextFieldModel {
  String get userId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get subCategory => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentItemTextFieldModelCopyWith<RentItemTextFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentItemTextFieldModelCopyWith<$Res> {
  factory $RentItemTextFieldModelCopyWith(RentItemTextFieldModel value,
          $Res Function(RentItemTextFieldModel) then) =
      _$RentItemTextFieldModelCopyWithImpl<$Res, RentItemTextFieldModel>;
  @useResult
  $Res call(
      {String userId,
      String category,
      String? subCategory,
      String? brand,
      String price,
      String? description});
}

/// @nodoc
class _$RentItemTextFieldModelCopyWithImpl<$Res,
        $Val extends RentItemTextFieldModel>
    implements $RentItemTextFieldModelCopyWith<$Res> {
  _$RentItemTextFieldModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? category = null,
    Object? subCategory = freezed,
    Object? brand = freezed,
    Object? price = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentItemTextFieldModelImplCopyWith<$Res>
    implements $RentItemTextFieldModelCopyWith<$Res> {
  factory _$$RentItemTextFieldModelImplCopyWith(
          _$RentItemTextFieldModelImpl value,
          $Res Function(_$RentItemTextFieldModelImpl) then) =
      __$$RentItemTextFieldModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String category,
      String? subCategory,
      String? brand,
      String price,
      String? description});
}

/// @nodoc
class __$$RentItemTextFieldModelImplCopyWithImpl<$Res>
    extends _$RentItemTextFieldModelCopyWithImpl<$Res,
        _$RentItemTextFieldModelImpl>
    implements _$$RentItemTextFieldModelImplCopyWith<$Res> {
  __$$RentItemTextFieldModelImplCopyWithImpl(
      _$RentItemTextFieldModelImpl _value,
      $Res Function(_$RentItemTextFieldModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? category = null,
    Object? subCategory = freezed,
    Object? brand = freezed,
    Object? price = null,
    Object? description = freezed,
  }) {
    return _then(_$RentItemTextFieldModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentItemTextFieldModelImpl implements _RentItemTextFieldModel {
  const _$RentItemTextFieldModelImpl(
      {required this.userId,
      required this.category,
      this.subCategory,
      this.brand,
      required this.price,
      this.description});

  factory _$RentItemTextFieldModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentItemTextFieldModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String category;
  @override
  final String? subCategory;
  @override
  final String? brand;
  @override
  final String price;
  @override
  final String? description;

  @override
  String toString() {
    return 'RentItemTextFieldModel(userId: $userId, category: $category, subCategory: $subCategory, brand: $brand, price: $price, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentItemTextFieldModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, category, subCategory, brand, price, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentItemTextFieldModelImplCopyWith<_$RentItemTextFieldModelImpl>
      get copyWith => __$$RentItemTextFieldModelImplCopyWithImpl<
          _$RentItemTextFieldModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentItemTextFieldModelImplToJson(
      this,
    );
  }
}

abstract class _RentItemTextFieldModel implements RentItemTextFieldModel {
  const factory _RentItemTextFieldModel(
      {required final String userId,
      required final String category,
      final String? subCategory,
      final String? brand,
      required final String price,
      final String? description}) = _$RentItemTextFieldModelImpl;

  factory _RentItemTextFieldModel.fromJson(Map<String, dynamic> json) =
      _$RentItemTextFieldModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get category;
  @override
  String? get subCategory;
  @override
  String? get brand;
  @override
  String get price;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$RentItemTextFieldModelImplCopyWith<_$RentItemTextFieldModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
