// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_active_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SellerActiveModel _$SellerActiveModelFromJson(Map<String, dynamic> json) {
  return _SellerActiveModel.fromJson(json);
}

/// @nodoc
mixin _$SellerActiveModel {
  String get sellerId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerActiveModelCopyWith<SellerActiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerActiveModelCopyWith<$Res> {
  factory $SellerActiveModelCopyWith(
          SellerActiveModel value, $Res Function(SellerActiveModel) then) =
      _$SellerActiveModelCopyWithImpl<$Res, SellerActiveModel>;
  @useResult
  $Res call({String sellerId, String status});
}

/// @nodoc
class _$SellerActiveModelCopyWithImpl<$Res, $Val extends SellerActiveModel>
    implements $SellerActiveModelCopyWith<$Res> {
  _$SellerActiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerActiveModelImplCopyWith<$Res>
    implements $SellerActiveModelCopyWith<$Res> {
  factory _$$SellerActiveModelImplCopyWith(_$SellerActiveModelImpl value,
          $Res Function(_$SellerActiveModelImpl) then) =
      __$$SellerActiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sellerId, String status});
}

/// @nodoc
class __$$SellerActiveModelImplCopyWithImpl<$Res>
    extends _$SellerActiveModelCopyWithImpl<$Res, _$SellerActiveModelImpl>
    implements _$$SellerActiveModelImplCopyWith<$Res> {
  __$$SellerActiveModelImplCopyWithImpl(_$SellerActiveModelImpl _value,
      $Res Function(_$SellerActiveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? status = null,
  }) {
    return _then(_$SellerActiveModelImpl(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
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
class _$SellerActiveModelImpl implements _SellerActiveModel {
  const _$SellerActiveModelImpl({required this.sellerId, required this.status});

  factory _$SellerActiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerActiveModelImplFromJson(json);

  @override
  final String sellerId;
  @override
  final String status;

  @override
  String toString() {
    return 'SellerActiveModel(sellerId: $sellerId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerActiveModelImpl &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sellerId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerActiveModelImplCopyWith<_$SellerActiveModelImpl> get copyWith =>
      __$$SellerActiveModelImplCopyWithImpl<_$SellerActiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerActiveModelImplToJson(
      this,
    );
  }
}

abstract class _SellerActiveModel implements SellerActiveModel {
  const factory _SellerActiveModel(
      {required final String sellerId,
      required final String status}) = _$SellerActiveModelImpl;

  factory _SellerActiveModel.fromJson(Map<String, dynamic> json) =
      _$SellerActiveModelImpl.fromJson;

  @override
  String get sellerId;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$SellerActiveModelImplCopyWith<_$SellerActiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
