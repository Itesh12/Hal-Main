// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_service_upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SellerServiceUploadModel _$SellerServiceUploadModelFromJson(
    Map<String, dynamic> json) {
  return _SellerServiceUploadModel.fromJson(json);
}

/// @nodoc
mixin _$SellerServiceUploadModel {
  String get sellerId => throw _privateConstructorUsedError;
  List<String> get kisaanStations => throw _privateConstructorUsedError;
  String get droneRegNo => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerServiceUploadModelCopyWith<SellerServiceUploadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerServiceUploadModelCopyWith<$Res> {
  factory $SellerServiceUploadModelCopyWith(SellerServiceUploadModel value,
          $Res Function(SellerServiceUploadModel) then) =
      _$SellerServiceUploadModelCopyWithImpl<$Res, SellerServiceUploadModel>;
  @useResult
  $Res call(
      {String sellerId,
      List<String> kisaanStations,
      String droneRegNo,
      String description});
}

/// @nodoc
class _$SellerServiceUploadModelCopyWithImpl<$Res,
        $Val extends SellerServiceUploadModel>
    implements $SellerServiceUploadModelCopyWith<$Res> {
  _$SellerServiceUploadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? kisaanStations = null,
    Object? droneRegNo = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      kisaanStations: null == kisaanStations
          ? _value.kisaanStations
          : kisaanStations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      droneRegNo: null == droneRegNo
          ? _value.droneRegNo
          : droneRegNo // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerServiceUploadModelImplCopyWith<$Res>
    implements $SellerServiceUploadModelCopyWith<$Res> {
  factory _$$SellerServiceUploadModelImplCopyWith(
          _$SellerServiceUploadModelImpl value,
          $Res Function(_$SellerServiceUploadModelImpl) then) =
      __$$SellerServiceUploadModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sellerId,
      List<String> kisaanStations,
      String droneRegNo,
      String description});
}

/// @nodoc
class __$$SellerServiceUploadModelImplCopyWithImpl<$Res>
    extends _$SellerServiceUploadModelCopyWithImpl<$Res,
        _$SellerServiceUploadModelImpl>
    implements _$$SellerServiceUploadModelImplCopyWith<$Res> {
  __$$SellerServiceUploadModelImplCopyWithImpl(
      _$SellerServiceUploadModelImpl _value,
      $Res Function(_$SellerServiceUploadModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? kisaanStations = null,
    Object? droneRegNo = null,
    Object? description = null,
  }) {
    return _then(_$SellerServiceUploadModelImpl(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      kisaanStations: null == kisaanStations
          ? _value._kisaanStations
          : kisaanStations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      droneRegNo: null == droneRegNo
          ? _value.droneRegNo
          : droneRegNo // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerServiceUploadModelImpl implements _SellerServiceUploadModel {
  const _$SellerServiceUploadModelImpl(
      {required this.sellerId,
      required final List<String> kisaanStations,
      required this.droneRegNo,
      required this.description})
      : _kisaanStations = kisaanStations;

  factory _$SellerServiceUploadModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerServiceUploadModelImplFromJson(json);

  @override
  final String sellerId;
  final List<String> _kisaanStations;
  @override
  List<String> get kisaanStations {
    if (_kisaanStations is EqualUnmodifiableListView) return _kisaanStations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kisaanStations);
  }

  @override
  final String droneRegNo;
  @override
  final String description;

  @override
  String toString() {
    return 'SellerServiceUploadModel(sellerId: $sellerId, kisaanStations: $kisaanStations, droneRegNo: $droneRegNo, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerServiceUploadModelImpl &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            const DeepCollectionEquality()
                .equals(other._kisaanStations, _kisaanStations) &&
            (identical(other.droneRegNo, droneRegNo) ||
                other.droneRegNo == droneRegNo) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sellerId,
      const DeepCollectionEquality().hash(_kisaanStations),
      droneRegNo,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerServiceUploadModelImplCopyWith<_$SellerServiceUploadModelImpl>
      get copyWith => __$$SellerServiceUploadModelImplCopyWithImpl<
          _$SellerServiceUploadModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerServiceUploadModelImplToJson(
      this,
    );
  }
}

abstract class _SellerServiceUploadModel implements SellerServiceUploadModel {
  const factory _SellerServiceUploadModel(
      {required final String sellerId,
      required final List<String> kisaanStations,
      required final String droneRegNo,
      required final String description}) = _$SellerServiceUploadModelImpl;

  factory _SellerServiceUploadModel.fromJson(Map<String, dynamic> json) =
      _$SellerServiceUploadModelImpl.fromJson;

  @override
  String get sellerId;
  @override
  List<String> get kisaanStations;
  @override
  String get droneRegNo;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$SellerServiceUploadModelImplCopyWith<_$SellerServiceUploadModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
