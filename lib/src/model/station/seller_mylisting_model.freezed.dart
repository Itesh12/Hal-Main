// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_mylisting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SellerMylistingModel _$SellerMylistingModelFromJson(Map<String, dynamic> json) {
  return _SellerMylistingModel.fromJson(json);
}

/// @nodoc
mixin _$SellerMylistingModel {
  String get sellingProductId => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  String get sellingStatus => throw _privateConstructorUsedError;
  DateTime get modifiedTime => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerMylistingModelCopyWith<SellerMylistingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerMylistingModelCopyWith<$Res> {
  factory $SellerMylistingModelCopyWith(SellerMylistingModel value,
          $Res Function(SellerMylistingModel) then) =
      _$SellerMylistingModelCopyWithImpl<$Res, SellerMylistingModel>;
  @useResult
  $Res call(
      {String sellingProductId,
      String serviceName,
      String sellingStatus,
      DateTime modifiedTime,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$SellerMylistingModelCopyWithImpl<$Res,
        $Val extends SellerMylistingModel>
    implements $SellerMylistingModelCopyWith<$Res> {
  _$SellerMylistingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellingProductId = null,
    Object? serviceName = null,
    Object? sellingStatus = null,
    Object? modifiedTime = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      sellingProductId: null == sellingProductId
          ? _value.sellingProductId
          : sellingProductId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      sellingStatus: null == sellingStatus
          ? _value.sellingStatus
          : sellingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedTime: null == modifiedTime
          ? _value.modifiedTime
          : modifiedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerMylistingModelImplCopyWith<$Res>
    implements $SellerMylistingModelCopyWith<$Res> {
  factory _$$SellerMylistingModelImplCopyWith(_$SellerMylistingModelImpl value,
          $Res Function(_$SellerMylistingModelImpl) then) =
      __$$SellerMylistingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sellingProductId,
      String serviceName,
      String sellingStatus,
      DateTime modifiedTime,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$$SellerMylistingModelImplCopyWithImpl<$Res>
    extends _$SellerMylistingModelCopyWithImpl<$Res, _$SellerMylistingModelImpl>
    implements _$$SellerMylistingModelImplCopyWith<$Res> {
  __$$SellerMylistingModelImplCopyWithImpl(_$SellerMylistingModelImpl _value,
      $Res Function(_$SellerMylistingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellingProductId = null,
    Object? serviceName = null,
    Object? sellingStatus = null,
    Object? modifiedTime = null,
    Object? id = null,
  }) {
    return _then(_$SellerMylistingModelImpl(
      sellingProductId: null == sellingProductId
          ? _value.sellingProductId
          : sellingProductId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      sellingStatus: null == sellingStatus
          ? _value.sellingStatus
          : sellingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedTime: null == modifiedTime
          ? _value.modifiedTime
          : modifiedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerMylistingModelImpl implements _SellerMylistingModel {
  const _$SellerMylistingModelImpl(
      {required this.sellingProductId,
      required this.serviceName,
      required this.sellingStatus,
      required this.modifiedTime,
      @JsonKey(name: "_id") required this.id});

  factory _$SellerMylistingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerMylistingModelImplFromJson(json);

  @override
  final String sellingProductId;
  @override
  final String serviceName;
  @override
  final String sellingStatus;
  @override
  final DateTime modifiedTime;
  @override
  @JsonKey(name: "_id")
  final String id;

  @override
  String toString() {
    return 'SellerMylistingModel(sellingProductId: $sellingProductId, serviceName: $serviceName, sellingStatus: $sellingStatus, modifiedTime: $modifiedTime, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerMylistingModelImpl &&
            (identical(other.sellingProductId, sellingProductId) ||
                other.sellingProductId == sellingProductId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.sellingStatus, sellingStatus) ||
                other.sellingStatus == sellingStatus) &&
            (identical(other.modifiedTime, modifiedTime) ||
                other.modifiedTime == modifiedTime) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sellingProductId, serviceName,
      sellingStatus, modifiedTime, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerMylistingModelImplCopyWith<_$SellerMylistingModelImpl>
      get copyWith =>
          __$$SellerMylistingModelImplCopyWithImpl<_$SellerMylistingModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerMylistingModelImplToJson(
      this,
    );
  }
}

abstract class _SellerMylistingModel implements SellerMylistingModel {
  const factory _SellerMylistingModel(
          {required final String sellingProductId,
          required final String serviceName,
          required final String sellingStatus,
          required final DateTime modifiedTime,
          @JsonKey(name: "_id") required final String id}) =
      _$SellerMylistingModelImpl;

  factory _SellerMylistingModel.fromJson(Map<String, dynamic> json) =
      _$SellerMylistingModelImpl.fromJson;

  @override
  String get sellingProductId;
  @override
  String get serviceName;
  @override
  String get sellingStatus;
  @override
  DateTime get modifiedTime;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$SellerMylistingModelImplCopyWith<_$SellerMylistingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
