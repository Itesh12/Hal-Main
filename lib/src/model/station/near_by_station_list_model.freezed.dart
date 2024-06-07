// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'near_by_station_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NearByStaionListModel _$NearByStaionListModelFromJson(
    Map<String, dynamic> json) {
  return _NearByStaionListModel.fromJson(json);
}

/// @nodoc
mixin _$NearByStaionListModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  StationPartnerAddressModel get ksLocation =>
      throw _privateConstructorUsedError;
  String get ksId => throw _privateConstructorUsedError;
  String get ksName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearByStaionListModelCopyWith<NearByStaionListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearByStaionListModelCopyWith<$Res> {
  factory $NearByStaionListModelCopyWith(NearByStaionListModel value,
          $Res Function(NearByStaionListModel) then) =
      _$NearByStaionListModelCopyWithImpl<$Res, NearByStaionListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      double distance,
      StationPartnerAddressModel ksLocation,
      String ksId,
      String ksName});

  $StationPartnerAddressModelCopyWith<$Res> get ksLocation;
}

/// @nodoc
class _$NearByStaionListModelCopyWithImpl<$Res,
        $Val extends NearByStaionListModel>
    implements $NearByStaionListModelCopyWith<$Res> {
  _$NearByStaionListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? distance = null,
    Object? ksLocation = null,
    Object? ksId = null,
    Object? ksName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      ksLocation: null == ksLocation
          ? _value.ksLocation
          : ksLocation // ignore: cast_nullable_to_non_nullable
              as StationPartnerAddressModel,
      ksId: null == ksId
          ? _value.ksId
          : ksId // ignore: cast_nullable_to_non_nullable
              as String,
      ksName: null == ksName
          ? _value.ksName
          : ksName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StationPartnerAddressModelCopyWith<$Res> get ksLocation {
    return $StationPartnerAddressModelCopyWith<$Res>(_value.ksLocation,
        (value) {
      return _then(_value.copyWith(ksLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NearByStaionListModelImplCopyWith<$Res>
    implements $NearByStaionListModelCopyWith<$Res> {
  factory _$$NearByStaionListModelImplCopyWith(
          _$NearByStaionListModelImpl value,
          $Res Function(_$NearByStaionListModelImpl) then) =
      __$$NearByStaionListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      double distance,
      StationPartnerAddressModel ksLocation,
      String ksId,
      String ksName});

  @override
  $StationPartnerAddressModelCopyWith<$Res> get ksLocation;
}

/// @nodoc
class __$$NearByStaionListModelImplCopyWithImpl<$Res>
    extends _$NearByStaionListModelCopyWithImpl<$Res,
        _$NearByStaionListModelImpl>
    implements _$$NearByStaionListModelImplCopyWith<$Res> {
  __$$NearByStaionListModelImplCopyWithImpl(_$NearByStaionListModelImpl _value,
      $Res Function(_$NearByStaionListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? distance = null,
    Object? ksLocation = null,
    Object? ksId = null,
    Object? ksName = null,
  }) {
    return _then(_$NearByStaionListModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      ksLocation: null == ksLocation
          ? _value.ksLocation
          : ksLocation // ignore: cast_nullable_to_non_nullable
              as StationPartnerAddressModel,
      ksId: null == ksId
          ? _value.ksId
          : ksId // ignore: cast_nullable_to_non_nullable
              as String,
      ksName: null == ksName
          ? _value.ksName
          : ksName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearByStaionListModelImpl implements _NearByStaionListModel {
  const _$NearByStaionListModelImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.distance,
      required this.ksLocation,
      required this.ksId,
      required this.ksName});

  factory _$NearByStaionListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearByStaionListModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final double distance;
  @override
  final StationPartnerAddressModel ksLocation;
  @override
  final String ksId;
  @override
  final String ksName;

  @override
  String toString() {
    return 'NearByStaionListModel(id: $id, distance: $distance, ksLocation: $ksLocation, ksId: $ksId, ksName: $ksName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearByStaionListModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.ksLocation, ksLocation) ||
                other.ksLocation == ksLocation) &&
            (identical(other.ksId, ksId) || other.ksId == ksId) &&
            (identical(other.ksName, ksName) || other.ksName == ksName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, distance, ksLocation, ksId, ksName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NearByStaionListModelImplCopyWith<_$NearByStaionListModelImpl>
      get copyWith => __$$NearByStaionListModelImplCopyWithImpl<
          _$NearByStaionListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearByStaionListModelImplToJson(
      this,
    );
  }
}

abstract class _NearByStaionListModel implements NearByStaionListModel {
  const factory _NearByStaionListModel(
      {@JsonKey(name: "_id") required final String id,
      required final double distance,
      required final StationPartnerAddressModel ksLocation,
      required final String ksId,
      required final String ksName}) = _$NearByStaionListModelImpl;

  factory _NearByStaionListModel.fromJson(Map<String, dynamic> json) =
      _$NearByStaionListModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  double get distance;
  @override
  StationPartnerAddressModel get ksLocation;
  @override
  String get ksId;
  @override
  String get ksName;
  @override
  @JsonKey(ignore: true)
  _$$NearByStaionListModelImplCopyWith<_$NearByStaionListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
