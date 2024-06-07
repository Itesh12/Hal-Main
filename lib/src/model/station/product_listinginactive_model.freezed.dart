// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_listinginactive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductListinginactiveModel _$ProductListinginactiveModelFromJson(
    Map<String, dynamic> json) {
  return _ProductListinginactiveModel.fromJson(json);
}

/// @nodoc
mixin _$ProductListinginactiveModel {
  String get sellerId => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductListinginactiveModelCopyWith<ProductListinginactiveModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListinginactiveModelCopyWith<$Res> {
  factory $ProductListinginactiveModelCopyWith(
          ProductListinginactiveModel value,
          $Res Function(ProductListinginactiveModel) then) =
      _$ProductListinginactiveModelCopyWithImpl<$Res,
          ProductListinginactiveModel>;
  @useResult
  $Res call({String sellerId, String productId, String status});
}

/// @nodoc
class _$ProductListinginactiveModelCopyWithImpl<$Res,
        $Val extends ProductListinginactiveModel>
    implements $ProductListinginactiveModelCopyWith<$Res> {
  _$ProductListinginactiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? productId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductListinginactiveModelImplCopyWith<$Res>
    implements $ProductListinginactiveModelCopyWith<$Res> {
  factory _$$ProductListinginactiveModelImplCopyWith(
          _$ProductListinginactiveModelImpl value,
          $Res Function(_$ProductListinginactiveModelImpl) then) =
      __$$ProductListinginactiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sellerId, String productId, String status});
}

/// @nodoc
class __$$ProductListinginactiveModelImplCopyWithImpl<$Res>
    extends _$ProductListinginactiveModelCopyWithImpl<$Res,
        _$ProductListinginactiveModelImpl>
    implements _$$ProductListinginactiveModelImplCopyWith<$Res> {
  __$$ProductListinginactiveModelImplCopyWithImpl(
      _$ProductListinginactiveModelImpl _value,
      $Res Function(_$ProductListinginactiveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? productId = null,
    Object? status = null,
  }) {
    return _then(_$ProductListinginactiveModelImpl(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductListinginactiveModelImpl
    implements _ProductListinginactiveModel {
  const _$ProductListinginactiveModelImpl(
      {required this.sellerId, required this.productId, required this.status});

  factory _$ProductListinginactiveModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProductListinginactiveModelImplFromJson(json);

  @override
  final String sellerId;
  @override
  final String productId;
  @override
  final String status;

  @override
  String toString() {
    return 'ProductListinginactiveModel(sellerId: $sellerId, productId: $productId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListinginactiveModelImpl &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sellerId, productId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListinginactiveModelImplCopyWith<_$ProductListinginactiveModelImpl>
      get copyWith => __$$ProductListinginactiveModelImplCopyWithImpl<
          _$ProductListinginactiveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductListinginactiveModelImplToJson(
      this,
    );
  }
}

abstract class _ProductListinginactiveModel
    implements ProductListinginactiveModel {
  const factory _ProductListinginactiveModel(
      {required final String sellerId,
      required final String productId,
      required final String status}) = _$ProductListinginactiveModelImpl;

  factory _ProductListinginactiveModel.fromJson(Map<String, dynamic> json) =
      _$ProductListinginactiveModelImpl.fromJson;

  @override
  String get sellerId;
  @override
  String get productId;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$ProductListinginactiveModelImplCopyWith<_$ProductListinginactiveModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
