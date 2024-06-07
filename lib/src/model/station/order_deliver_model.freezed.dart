// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_deliver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDeliverdModel _$OrderDeliverdModelFromJson(Map<String, dynamic> json) {
  return _OrderDeliverdModel.fromJson(json);
}

/// @nodoc
mixin _$OrderDeliverdModel {
  @JsonKey(name: "buyId")
  String? get id => throw _privateConstructorUsedError;
  String get estimatedPrice => throw _privateConstructorUsedError;
  String get paymentReceived => throw _privateConstructorUsedError;
  String get remainingPayment => throw _privateConstructorUsedError;
  String get OCLocation => throw _privateConstructorUsedError;
  String get addFarmDetails => throw _privateConstructorUsedError;
  String get equipmentNo => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDeliverdModelCopyWith<OrderDeliverdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDeliverdModelCopyWith<$Res> {
  factory $OrderDeliverdModelCopyWith(
          OrderDeliverdModel value, $Res Function(OrderDeliverdModel) then) =
      _$OrderDeliverdModelCopyWithImpl<$Res, OrderDeliverdModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "buyId") String? id,
      String estimatedPrice,
      String paymentReceived,
      String remainingPayment,
      String OCLocation,
      String addFarmDetails,
      String equipmentNo,
      String? remarks});
}

/// @nodoc
class _$OrderDeliverdModelCopyWithImpl<$Res, $Val extends OrderDeliverdModel>
    implements $OrderDeliverdModelCopyWith<$Res> {
  _$OrderDeliverdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estimatedPrice = null,
    Object? paymentReceived = null,
    Object? remainingPayment = null,
    Object? OCLocation = null,
    Object? addFarmDetails = null,
    Object? equipmentNo = null,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedPrice: null == estimatedPrice
          ? _value.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      paymentReceived: null == paymentReceived
          ? _value.paymentReceived
          : paymentReceived // ignore: cast_nullable_to_non_nullable
              as String,
      remainingPayment: null == remainingPayment
          ? _value.remainingPayment
          : remainingPayment // ignore: cast_nullable_to_non_nullable
              as String,
      OCLocation: null == OCLocation
          ? _value.OCLocation
          : OCLocation // ignore: cast_nullable_to_non_nullable
              as String,
      addFarmDetails: null == addFarmDetails
          ? _value.addFarmDetails
          : addFarmDetails // ignore: cast_nullable_to_non_nullable
              as String,
      equipmentNo: null == equipmentNo
          ? _value.equipmentNo
          : equipmentNo // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDeliverdModelImplCopyWith<$Res>
    implements $OrderDeliverdModelCopyWith<$Res> {
  factory _$$OrderDeliverdModelImplCopyWith(_$OrderDeliverdModelImpl value,
          $Res Function(_$OrderDeliverdModelImpl) then) =
      __$$OrderDeliverdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "buyId") String? id,
      String estimatedPrice,
      String paymentReceived,
      String remainingPayment,
      String OCLocation,
      String addFarmDetails,
      String equipmentNo,
      String? remarks});
}

/// @nodoc
class __$$OrderDeliverdModelImplCopyWithImpl<$Res>
    extends _$OrderDeliverdModelCopyWithImpl<$Res, _$OrderDeliverdModelImpl>
    implements _$$OrderDeliverdModelImplCopyWith<$Res> {
  __$$OrderDeliverdModelImplCopyWithImpl(_$OrderDeliverdModelImpl _value,
      $Res Function(_$OrderDeliverdModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estimatedPrice = null,
    Object? paymentReceived = null,
    Object? remainingPayment = null,
    Object? OCLocation = null,
    Object? addFarmDetails = null,
    Object? equipmentNo = null,
    Object? remarks = freezed,
  }) {
    return _then(_$OrderDeliverdModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedPrice: null == estimatedPrice
          ? _value.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      paymentReceived: null == paymentReceived
          ? _value.paymentReceived
          : paymentReceived // ignore: cast_nullable_to_non_nullable
              as String,
      remainingPayment: null == remainingPayment
          ? _value.remainingPayment
          : remainingPayment // ignore: cast_nullable_to_non_nullable
              as String,
      OCLocation: null == OCLocation
          ? _value.OCLocation
          : OCLocation // ignore: cast_nullable_to_non_nullable
              as String,
      addFarmDetails: null == addFarmDetails
          ? _value.addFarmDetails
          : addFarmDetails // ignore: cast_nullable_to_non_nullable
              as String,
      equipmentNo: null == equipmentNo
          ? _value.equipmentNo
          : equipmentNo // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDeliverdModelImpl implements _OrderDeliverdModel {
  const _$OrderDeliverdModelImpl(
      {@JsonKey(name: "buyId") this.id,
      required this.estimatedPrice,
      required this.paymentReceived,
      required this.remainingPayment,
      required this.OCLocation,
      required this.addFarmDetails,
      required this.equipmentNo,
      this.remarks});

  factory _$OrderDeliverdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDeliverdModelImplFromJson(json);

  @override
  @JsonKey(name: "buyId")
  final String? id;
  @override
  final String estimatedPrice;
  @override
  final String paymentReceived;
  @override
  final String remainingPayment;
  @override
  final String OCLocation;
  @override
  final String addFarmDetails;
  @override
  final String equipmentNo;
  @override
  final String? remarks;

  @override
  String toString() {
    return 'OrderDeliverdModel(id: $id, estimatedPrice: $estimatedPrice, paymentReceived: $paymentReceived, remainingPayment: $remainingPayment, OCLocation: $OCLocation, addFarmDetails: $addFarmDetails, equipmentNo: $equipmentNo, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDeliverdModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estimatedPrice, estimatedPrice) ||
                other.estimatedPrice == estimatedPrice) &&
            (identical(other.paymentReceived, paymentReceived) ||
                other.paymentReceived == paymentReceived) &&
            (identical(other.remainingPayment, remainingPayment) ||
                other.remainingPayment == remainingPayment) &&
            (identical(other.OCLocation, OCLocation) ||
                other.OCLocation == OCLocation) &&
            (identical(other.addFarmDetails, addFarmDetails) ||
                other.addFarmDetails == addFarmDetails) &&
            (identical(other.equipmentNo, equipmentNo) ||
                other.equipmentNo == equipmentNo) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      estimatedPrice,
      paymentReceived,
      remainingPayment,
      OCLocation,
      addFarmDetails,
      equipmentNo,
      remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDeliverdModelImplCopyWith<_$OrderDeliverdModelImpl> get copyWith =>
      __$$OrderDeliverdModelImplCopyWithImpl<_$OrderDeliverdModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDeliverdModelImplToJson(
      this,
    );
  }
}

abstract class _OrderDeliverdModel implements OrderDeliverdModel {
  const factory _OrderDeliverdModel(
      {@JsonKey(name: "buyId") final String? id,
      required final String estimatedPrice,
      required final String paymentReceived,
      required final String remainingPayment,
      required final String OCLocation,
      required final String addFarmDetails,
      required final String equipmentNo,
      final String? remarks}) = _$OrderDeliverdModelImpl;

  factory _OrderDeliverdModel.fromJson(Map<String, dynamic> json) =
      _$OrderDeliverdModelImpl.fromJson;

  @override
  @JsonKey(name: "buyId")
  String? get id;
  @override
  String get estimatedPrice;
  @override
  String get paymentReceived;
  @override
  String get remainingPayment;
  @override
  String get OCLocation;
  @override
  String get addFarmDetails;
  @override
  String get equipmentNo;
  @override
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$$OrderDeliverdModelImplCopyWith<_$OrderDeliverdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FarmDetailOrder _$FarmDetailOrderFromJson(Map<String, dynamic> json) {
  return _FarmDetailOrder.fromJson(json);
}

/// @nodoc
mixin _$FarmDetailOrder {
  String get farmName => throw _privateConstructorUsedError;
  double get area => throw _privateConstructorUsedError;
  String get areaUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FarmDetailOrderCopyWith<FarmDetailOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmDetailOrderCopyWith<$Res> {
  factory $FarmDetailOrderCopyWith(
          FarmDetailOrder value, $Res Function(FarmDetailOrder) then) =
      _$FarmDetailOrderCopyWithImpl<$Res, FarmDetailOrder>;
  @useResult
  $Res call({String farmName, double area, String areaUnit});
}

/// @nodoc
class _$FarmDetailOrderCopyWithImpl<$Res, $Val extends FarmDetailOrder>
    implements $FarmDetailOrderCopyWith<$Res> {
  _$FarmDetailOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmName = null,
    Object? area = null,
    Object? areaUnit = null,
  }) {
    return _then(_value.copyWith(
      farmName: null == farmName
          ? _value.farmName
          : farmName // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      areaUnit: null == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FarmDetailOrderImplCopyWith<$Res>
    implements $FarmDetailOrderCopyWith<$Res> {
  factory _$$FarmDetailOrderImplCopyWith(_$FarmDetailOrderImpl value,
          $Res Function(_$FarmDetailOrderImpl) then) =
      __$$FarmDetailOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String farmName, double area, String areaUnit});
}

/// @nodoc
class __$$FarmDetailOrderImplCopyWithImpl<$Res>
    extends _$FarmDetailOrderCopyWithImpl<$Res, _$FarmDetailOrderImpl>
    implements _$$FarmDetailOrderImplCopyWith<$Res> {
  __$$FarmDetailOrderImplCopyWithImpl(
      _$FarmDetailOrderImpl _value, $Res Function(_$FarmDetailOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmName = null,
    Object? area = null,
    Object? areaUnit = null,
  }) {
    return _then(_$FarmDetailOrderImpl(
      farmName: null == farmName
          ? _value.farmName
          : farmName // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      areaUnit: null == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FarmDetailOrderImpl implements _FarmDetailOrder {
  const _$FarmDetailOrderImpl(
      {required this.farmName, required this.area, required this.areaUnit});

  factory _$FarmDetailOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmDetailOrderImplFromJson(json);

  @override
  final String farmName;
  @override
  final double area;
  @override
  final String areaUnit;

  @override
  String toString() {
    return 'FarmDetailOrder(farmName: $farmName, area: $area, areaUnit: $areaUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmDetailOrderImpl &&
            (identical(other.farmName, farmName) ||
                other.farmName == farmName) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, farmName, area, areaUnit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmDetailOrderImplCopyWith<_$FarmDetailOrderImpl> get copyWith =>
      __$$FarmDetailOrderImplCopyWithImpl<_$FarmDetailOrderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmDetailOrderImplToJson(
      this,
    );
  }
}

abstract class _FarmDetailOrder implements FarmDetailOrder {
  const factory _FarmDetailOrder(
      {required final String farmName,
      required final double area,
      required final String areaUnit}) = _$FarmDetailOrderImpl;

  factory _FarmDetailOrder.fromJson(Map<String, dynamic> json) =
      _$FarmDetailOrderImpl.fromJson;

  @override
  String get farmName;
  @override
  double get area;
  @override
  String get areaUnit;
  @override
  @JsonKey(ignore: true)
  _$$FarmDetailOrderImplCopyWith<_$FarmDetailOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OcLocation _$OcLocationFromJson(Map<String, dynamic> json) {
  return _OcLocation.fromJson(json);
}

/// @nodoc
mixin _$OcLocation {
  String get address => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OcLocationCopyWith<OcLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OcLocationCopyWith<$Res> {
  factory $OcLocationCopyWith(
          OcLocation value, $Res Function(OcLocation) then) =
      _$OcLocationCopyWithImpl<$Res, OcLocation>;
  @useResult
  $Res call({String address, String latitude, String longitude});
}

/// @nodoc
class _$OcLocationCopyWithImpl<$Res, $Val extends OcLocation>
    implements $OcLocationCopyWith<$Res> {
  _$OcLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OcLocationImplCopyWith<$Res>
    implements $OcLocationCopyWith<$Res> {
  factory _$$OcLocationImplCopyWith(
          _$OcLocationImpl value, $Res Function(_$OcLocationImpl) then) =
      __$$OcLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, String latitude, String longitude});
}

/// @nodoc
class __$$OcLocationImplCopyWithImpl<$Res>
    extends _$OcLocationCopyWithImpl<$Res, _$OcLocationImpl>
    implements _$$OcLocationImplCopyWith<$Res> {
  __$$OcLocationImplCopyWithImpl(
      _$OcLocationImpl _value, $Res Function(_$OcLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$OcLocationImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OcLocationImpl implements _OcLocation {
  const _$OcLocationImpl(
      {required this.address, required this.latitude, required this.longitude});

  factory _$OcLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OcLocationImplFromJson(json);

  @override
  final String address;
  @override
  final String latitude;
  @override
  final String longitude;

  @override
  String toString() {
    return 'OcLocation(address: $address, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OcLocationImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OcLocationImplCopyWith<_$OcLocationImpl> get copyWith =>
      __$$OcLocationImplCopyWithImpl<_$OcLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OcLocationImplToJson(
      this,
    );
  }
}

abstract class _OcLocation implements OcLocation {
  const factory _OcLocation(
      {required final String address,
      required final String latitude,
      required final String longitude}) = _$OcLocationImpl;

  factory _OcLocation.fromJson(Map<String, dynamic> json) =
      _$OcLocationImpl.fromJson;

  @override
  String get address;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  @JsonKey(ignore: true)
  _$$OcLocationImplCopyWith<_$OcLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
