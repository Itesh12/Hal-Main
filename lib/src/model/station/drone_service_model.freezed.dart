// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drone_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DroneServiceModel _$DroneServiceModelFromJson(Map<String, dynamic> json) {
  return _DroneServiceModel.fromJson(json);
}

/// @nodoc
mixin _$DroneServiceModel {
  AddFarmLocation get addFarmLocation => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get reqUserId => throw _privateConstructorUsedError;
  String get stationId => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get mobileNo => throw _privateConstructorUsedError;
  String get bookingDate => throw _privateConstructorUsedError;
  String get bookingStartTime => throw _privateConstructorUsedError;
  List<AddFarmDetail> get addFarmDetails => throw _privateConstructorUsedError;
  String get cropType => throw _privateConstructorUsedError;
  String get sparyProduct => throw _privateConstructorUsedError;
  String get bookingId => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  double get estimatedPrice => throw _privateConstructorUsedError;
  int get paymentReceived => throw _privateConstructorUsedError;
  int get remainingPayment => throw _privateConstructorUsedError;
  String? get sellerName => throw _privateConstructorUsedError;
  String? get sellerContactNo => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DroneServiceModelCopyWith<DroneServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DroneServiceModelCopyWith<$Res> {
  factory $DroneServiceModelCopyWith(
          DroneServiceModel value, $Res Function(DroneServiceModel) then) =
      _$DroneServiceModelCopyWithImpl<$Res, DroneServiceModel>;
  @useResult
  $Res call(
      {AddFarmLocation addFarmLocation,
      @JsonKey(name: "_id") String id,
      String reqUserId,
      String stationId,
      String serviceName,
      String name,
      String mobileNo,
      String bookingDate,
      String bookingStartTime,
      List<AddFarmDetail> addFarmDetails,
      String cropType,
      String sparyProduct,
      String bookingId,
      String orderStatus,
      double estimatedPrice,
      int paymentReceived,
      int remainingPayment,
      String? sellerName,
      String? sellerContactNo,
      String? remarks,
      DateTime createdAt,
      DateTime updatedAt});

  $AddFarmLocationCopyWith<$Res> get addFarmLocation;
}

/// @nodoc
class _$DroneServiceModelCopyWithImpl<$Res, $Val extends DroneServiceModel>
    implements $DroneServiceModelCopyWith<$Res> {
  _$DroneServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFarmLocation = null,
    Object? id = null,
    Object? reqUserId = null,
    Object? stationId = null,
    Object? serviceName = null,
    Object? name = null,
    Object? mobileNo = null,
    Object? bookingDate = null,
    Object? bookingStartTime = null,
    Object? addFarmDetails = null,
    Object? cropType = null,
    Object? sparyProduct = null,
    Object? bookingId = null,
    Object? orderStatus = null,
    Object? estimatedPrice = null,
    Object? paymentReceived = null,
    Object? remainingPayment = null,
    Object? sellerName = freezed,
    Object? sellerContactNo = freezed,
    Object? remarks = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      addFarmLocation: null == addFarmLocation
          ? _value.addFarmLocation
          : addFarmLocation // ignore: cast_nullable_to_non_nullable
              as AddFarmLocation,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reqUserId: null == reqUserId
          ? _value.reqUserId
          : reqUserId // ignore: cast_nullable_to_non_nullable
              as String,
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      bookingDate: null == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as String,
      bookingStartTime: null == bookingStartTime
          ? _value.bookingStartTime
          : bookingStartTime // ignore: cast_nullable_to_non_nullable
              as String,
      addFarmDetails: null == addFarmDetails
          ? _value.addFarmDetails
          : addFarmDetails // ignore: cast_nullable_to_non_nullable
              as List<AddFarmDetail>,
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      sparyProduct: null == sparyProduct
          ? _value.sparyProduct
          : sparyProduct // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedPrice: null == estimatedPrice
          ? _value.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      paymentReceived: null == paymentReceived
          ? _value.paymentReceived
          : paymentReceived // ignore: cast_nullable_to_non_nullable
              as int,
      remainingPayment: null == remainingPayment
          ? _value.remainingPayment
          : remainingPayment // ignore: cast_nullable_to_non_nullable
              as int,
      sellerName: freezed == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerContactNo: freezed == sellerContactNo
          ? _value.sellerContactNo
          : sellerContactNo // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddFarmLocationCopyWith<$Res> get addFarmLocation {
    return $AddFarmLocationCopyWith<$Res>(_value.addFarmLocation, (value) {
      return _then(_value.copyWith(addFarmLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DroneServiceModelImplCopyWith<$Res>
    implements $DroneServiceModelCopyWith<$Res> {
  factory _$$DroneServiceModelImplCopyWith(_$DroneServiceModelImpl value,
          $Res Function(_$DroneServiceModelImpl) then) =
      __$$DroneServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddFarmLocation addFarmLocation,
      @JsonKey(name: "_id") String id,
      String reqUserId,
      String stationId,
      String serviceName,
      String name,
      String mobileNo,
      String bookingDate,
      String bookingStartTime,
      List<AddFarmDetail> addFarmDetails,
      String cropType,
      String sparyProduct,
      String bookingId,
      String orderStatus,
      double estimatedPrice,
      int paymentReceived,
      int remainingPayment,
      String? sellerName,
      String? sellerContactNo,
      String? remarks,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $AddFarmLocationCopyWith<$Res> get addFarmLocation;
}

/// @nodoc
class __$$DroneServiceModelImplCopyWithImpl<$Res>
    extends _$DroneServiceModelCopyWithImpl<$Res, _$DroneServiceModelImpl>
    implements _$$DroneServiceModelImplCopyWith<$Res> {
  __$$DroneServiceModelImplCopyWithImpl(_$DroneServiceModelImpl _value,
      $Res Function(_$DroneServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFarmLocation = null,
    Object? id = null,
    Object? reqUserId = null,
    Object? stationId = null,
    Object? serviceName = null,
    Object? name = null,
    Object? mobileNo = null,
    Object? bookingDate = null,
    Object? bookingStartTime = null,
    Object? addFarmDetails = null,
    Object? cropType = null,
    Object? sparyProduct = null,
    Object? bookingId = null,
    Object? orderStatus = null,
    Object? estimatedPrice = null,
    Object? paymentReceived = null,
    Object? remainingPayment = null,
    Object? sellerName = freezed,
    Object? sellerContactNo = freezed,
    Object? remarks = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DroneServiceModelImpl(
      addFarmLocation: null == addFarmLocation
          ? _value.addFarmLocation
          : addFarmLocation // ignore: cast_nullable_to_non_nullable
              as AddFarmLocation,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reqUserId: null == reqUserId
          ? _value.reqUserId
          : reqUserId // ignore: cast_nullable_to_non_nullable
              as String,
      stationId: null == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      bookingDate: null == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as String,
      bookingStartTime: null == bookingStartTime
          ? _value.bookingStartTime
          : bookingStartTime // ignore: cast_nullable_to_non_nullable
              as String,
      addFarmDetails: null == addFarmDetails
          ? _value._addFarmDetails
          : addFarmDetails // ignore: cast_nullable_to_non_nullable
              as List<AddFarmDetail>,
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      sparyProduct: null == sparyProduct
          ? _value.sparyProduct
          : sparyProduct // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedPrice: null == estimatedPrice
          ? _value.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      paymentReceived: null == paymentReceived
          ? _value.paymentReceived
          : paymentReceived // ignore: cast_nullable_to_non_nullable
              as int,
      remainingPayment: null == remainingPayment
          ? _value.remainingPayment
          : remainingPayment // ignore: cast_nullable_to_non_nullable
              as int,
      sellerName: freezed == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerContactNo: freezed == sellerContactNo
          ? _value.sellerContactNo
          : sellerContactNo // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DroneServiceModelImpl implements _DroneServiceModel {
  const _$DroneServiceModelImpl(
      {required this.addFarmLocation,
      @JsonKey(name: "_id") required this.id,
      required this.reqUserId,
      required this.stationId,
      required this.serviceName,
      required this.name,
      required this.mobileNo,
      required this.bookingDate,
      required this.bookingStartTime,
      required final List<AddFarmDetail> addFarmDetails,
      required this.cropType,
      required this.sparyProduct,
      required this.bookingId,
      required this.orderStatus,
      required this.estimatedPrice,
      required this.paymentReceived,
      required this.remainingPayment,
      this.sellerName,
      this.sellerContactNo,
      this.remarks,
      required this.createdAt,
      required this.updatedAt})
      : _addFarmDetails = addFarmDetails;

  factory _$DroneServiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DroneServiceModelImplFromJson(json);

  @override
  final AddFarmLocation addFarmLocation;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String reqUserId;
  @override
  final String stationId;
  @override
  final String serviceName;
  @override
  final String name;
  @override
  final String mobileNo;
  @override
  final String bookingDate;
  @override
  final String bookingStartTime;
  final List<AddFarmDetail> _addFarmDetails;
  @override
  List<AddFarmDetail> get addFarmDetails {
    if (_addFarmDetails is EqualUnmodifiableListView) return _addFarmDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addFarmDetails);
  }

  @override
  final String cropType;
  @override
  final String sparyProduct;
  @override
  final String bookingId;
  @override
  final String orderStatus;
  @override
  final double estimatedPrice;
  @override
  final int paymentReceived;
  @override
  final int remainingPayment;
  @override
  final String? sellerName;
  @override
  final String? sellerContactNo;
  @override
  final String? remarks;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DroneServiceModel(addFarmLocation: $addFarmLocation, id: $id, reqUserId: $reqUserId, stationId: $stationId, serviceName: $serviceName, name: $name, mobileNo: $mobileNo, bookingDate: $bookingDate, bookingStartTime: $bookingStartTime, addFarmDetails: $addFarmDetails, cropType: $cropType, sparyProduct: $sparyProduct, bookingId: $bookingId, orderStatus: $orderStatus, estimatedPrice: $estimatedPrice, paymentReceived: $paymentReceived, remainingPayment: $remainingPayment, sellerName: $sellerName, sellerContactNo: $sellerContactNo, remarks: $remarks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DroneServiceModelImpl &&
            (identical(other.addFarmLocation, addFarmLocation) ||
                other.addFarmLocation == addFarmLocation) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reqUserId, reqUserId) ||
                other.reqUserId == reqUserId) &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.bookingDate, bookingDate) ||
                other.bookingDate == bookingDate) &&
            (identical(other.bookingStartTime, bookingStartTime) ||
                other.bookingStartTime == bookingStartTime) &&
            const DeepCollectionEquality()
                .equals(other._addFarmDetails, _addFarmDetails) &&
            (identical(other.cropType, cropType) ||
                other.cropType == cropType) &&
            (identical(other.sparyProduct, sparyProduct) ||
                other.sparyProduct == sparyProduct) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.estimatedPrice, estimatedPrice) ||
                other.estimatedPrice == estimatedPrice) &&
            (identical(other.paymentReceived, paymentReceived) ||
                other.paymentReceived == paymentReceived) &&
            (identical(other.remainingPayment, remainingPayment) ||
                other.remainingPayment == remainingPayment) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sellerContactNo, sellerContactNo) ||
                other.sellerContactNo == sellerContactNo) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        addFarmLocation,
        id,
        reqUserId,
        stationId,
        serviceName,
        name,
        mobileNo,
        bookingDate,
        bookingStartTime,
        const DeepCollectionEquality().hash(_addFarmDetails),
        cropType,
        sparyProduct,
        bookingId,
        orderStatus,
        estimatedPrice,
        paymentReceived,
        remainingPayment,
        sellerName,
        sellerContactNo,
        remarks,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DroneServiceModelImplCopyWith<_$DroneServiceModelImpl> get copyWith =>
      __$$DroneServiceModelImplCopyWithImpl<_$DroneServiceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DroneServiceModelImplToJson(
      this,
    );
  }
}

abstract class _DroneServiceModel implements DroneServiceModel {
  const factory _DroneServiceModel(
      {required final AddFarmLocation addFarmLocation,
      @JsonKey(name: "_id") required final String id,
      required final String reqUserId,
      required final String stationId,
      required final String serviceName,
      required final String name,
      required final String mobileNo,
      required final String bookingDate,
      required final String bookingStartTime,
      required final List<AddFarmDetail> addFarmDetails,
      required final String cropType,
      required final String sparyProduct,
      required final String bookingId,
      required final String orderStatus,
      required final double estimatedPrice,
      required final int paymentReceived,
      required final int remainingPayment,
      final String? sellerName,
      final String? sellerContactNo,
      final String? remarks,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DroneServiceModelImpl;

  factory _DroneServiceModel.fromJson(Map<String, dynamic> json) =
      _$DroneServiceModelImpl.fromJson;

  @override
  AddFarmLocation get addFarmLocation;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get reqUserId;
  @override
  String get stationId;
  @override
  String get serviceName;
  @override
  String get name;
  @override
  String get mobileNo;
  @override
  String get bookingDate;
  @override
  String get bookingStartTime;
  @override
  List<AddFarmDetail> get addFarmDetails;
  @override
  String get cropType;
  @override
  String get sparyProduct;
  @override
  String get bookingId;
  @override
  String get orderStatus;
  @override
  double get estimatedPrice;
  @override
  int get paymentReceived;
  @override
  int get remainingPayment;
  @override
  String? get sellerName;
  @override
  String? get sellerContactNo;
  @override
  String? get remarks;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DroneServiceModelImplCopyWith<_$DroneServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddFarmDetail _$AddFarmDetailFromJson(Map<String, dynamic> json) {
  return _AddFarmDetail.fromJson(json);
}

/// @nodoc
mixin _$AddFarmDetail {
  String get farmName => throw _privateConstructorUsedError;
  double get area => throw _privateConstructorUsedError;
  String get areaUnit => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddFarmDetailCopyWith<AddFarmDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFarmDetailCopyWith<$Res> {
  factory $AddFarmDetailCopyWith(
          AddFarmDetail value, $Res Function(AddFarmDetail) then) =
      _$AddFarmDetailCopyWithImpl<$Res, AddFarmDetail>;
  @useResult
  $Res call(
      {String farmName,
      double area,
      String areaUnit,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$AddFarmDetailCopyWithImpl<$Res, $Val extends AddFarmDetail>
    implements $AddFarmDetailCopyWith<$Res> {
  _$AddFarmDetailCopyWithImpl(this._value, this._then);

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
    Object? id = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddFarmDetailImplCopyWith<$Res>
    implements $AddFarmDetailCopyWith<$Res> {
  factory _$$AddFarmDetailImplCopyWith(
          _$AddFarmDetailImpl value, $Res Function(_$AddFarmDetailImpl) then) =
      __$$AddFarmDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String farmName,
      double area,
      String areaUnit,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$$AddFarmDetailImplCopyWithImpl<$Res>
    extends _$AddFarmDetailCopyWithImpl<$Res, _$AddFarmDetailImpl>
    implements _$$AddFarmDetailImplCopyWith<$Res> {
  __$$AddFarmDetailImplCopyWithImpl(
      _$AddFarmDetailImpl _value, $Res Function(_$AddFarmDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmName = null,
    Object? area = null,
    Object? areaUnit = null,
    Object? id = null,
  }) {
    return _then(_$AddFarmDetailImpl(
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddFarmDetailImpl implements _AddFarmDetail {
  const _$AddFarmDetailImpl(
      {required this.farmName,
      required this.area,
      required this.areaUnit,
      @JsonKey(name: "_id") required this.id});

  factory _$AddFarmDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddFarmDetailImplFromJson(json);

  @override
  final String farmName;
  @override
  final double area;
  @override
  final String areaUnit;
  @override
  @JsonKey(name: "_id")
  final String id;

  @override
  String toString() {
    return 'AddFarmDetail(farmName: $farmName, area: $area, areaUnit: $areaUnit, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFarmDetailImpl &&
            (identical(other.farmName, farmName) ||
                other.farmName == farmName) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, farmName, area, areaUnit, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFarmDetailImplCopyWith<_$AddFarmDetailImpl> get copyWith =>
      __$$AddFarmDetailImplCopyWithImpl<_$AddFarmDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddFarmDetailImplToJson(
      this,
    );
  }
}

abstract class _AddFarmDetail implements AddFarmDetail {
  const factory _AddFarmDetail(
      {required final String farmName,
      required final double area,
      required final String areaUnit,
      @JsonKey(name: "_id") required final String id}) = _$AddFarmDetailImpl;

  factory _AddFarmDetail.fromJson(Map<String, dynamic> json) =
      _$AddFarmDetailImpl.fromJson;

  @override
  String get farmName;
  @override
  double get area;
  @override
  String get areaUnit;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$AddFarmDetailImplCopyWith<_$AddFarmDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddFarmLocation _$AddFarmLocationFromJson(Map<String, dynamic> json) {
  return _AddFarmLocation.fromJson(json);
}

/// @nodoc
mixin _$AddFarmLocation {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddFarmLocationCopyWith<AddFarmLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFarmLocationCopyWith<$Res> {
  factory $AddFarmLocationCopyWith(
          AddFarmLocation value, $Res Function(AddFarmLocation) then) =
      _$AddFarmLocationCopyWithImpl<$Res, AddFarmLocation>;
  @useResult
  $Res call({String latitude, String longitude, String address});
}

/// @nodoc
class _$AddFarmLocationCopyWithImpl<$Res, $Val extends AddFarmLocation>
    implements $AddFarmLocationCopyWith<$Res> {
  _$AddFarmLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddFarmLocationImplCopyWith<$Res>
    implements $AddFarmLocationCopyWith<$Res> {
  factory _$$AddFarmLocationImplCopyWith(_$AddFarmLocationImpl value,
          $Res Function(_$AddFarmLocationImpl) then) =
      __$$AddFarmLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latitude, String longitude, String address});
}

/// @nodoc
class __$$AddFarmLocationImplCopyWithImpl<$Res>
    extends _$AddFarmLocationCopyWithImpl<$Res, _$AddFarmLocationImpl>
    implements _$$AddFarmLocationImplCopyWith<$Res> {
  __$$AddFarmLocationImplCopyWithImpl(
      _$AddFarmLocationImpl _value, $Res Function(_$AddFarmLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
  }) {
    return _then(_$AddFarmLocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddFarmLocationImpl implements _AddFarmLocation {
  const _$AddFarmLocationImpl(
      {required this.latitude, required this.longitude, required this.address});

  factory _$AddFarmLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddFarmLocationImplFromJson(json);

  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String address;

  @override
  String toString() {
    return 'AddFarmLocation(latitude: $latitude, longitude: $longitude, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFarmLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFarmLocationImplCopyWith<_$AddFarmLocationImpl> get copyWith =>
      __$$AddFarmLocationImplCopyWithImpl<_$AddFarmLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddFarmLocationImplToJson(
      this,
    );
  }
}

abstract class _AddFarmLocation implements AddFarmLocation {
  const factory _AddFarmLocation(
      {required final String latitude,
      required final String longitude,
      required final String address}) = _$AddFarmLocationImpl;

  factory _AddFarmLocation.fromJson(Map<String, dynamic> json) =
      _$AddFarmLocationImpl.fromJson;

  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$AddFarmLocationImplCopyWith<_$AddFarmLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SparyProduct _$SparyProductFromJson(Map<String, dynamic> json) {
  return _SparyProduct.fromJson(json);
}

/// @nodoc
mixin _$SparyProduct {
  String get productName => throw _privateConstructorUsedError;
  int get productPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get qtyUnit => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SparyProductCopyWith<SparyProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SparyProductCopyWith<$Res> {
  factory $SparyProductCopyWith(
          SparyProduct value, $Res Function(SparyProduct) then) =
      _$SparyProductCopyWithImpl<$Res, SparyProduct>;
  @useResult
  $Res call(
      {String productName,
      int productPrice,
      int quantity,
      String qtyUnit,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$SparyProductCopyWithImpl<$Res, $Val extends SparyProduct>
    implements $SparyProductCopyWith<$Res> {
  _$SparyProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? productPrice = null,
    Object? quantity = null,
    Object? qtyUnit = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SparyProductImplCopyWith<$Res>
    implements $SparyProductCopyWith<$Res> {
  factory _$$SparyProductImplCopyWith(
          _$SparyProductImpl value, $Res Function(_$SparyProductImpl) then) =
      __$$SparyProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      int productPrice,
      int quantity,
      String qtyUnit,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$$SparyProductImplCopyWithImpl<$Res>
    extends _$SparyProductCopyWithImpl<$Res, _$SparyProductImpl>
    implements _$$SparyProductImplCopyWith<$Res> {
  __$$SparyProductImplCopyWithImpl(
      _$SparyProductImpl _value, $Res Function(_$SparyProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? productPrice = null,
    Object? quantity = null,
    Object? qtyUnit = null,
    Object? id = null,
  }) {
    return _then(_$SparyProductImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      qtyUnit: null == qtyUnit
          ? _value.qtyUnit
          : qtyUnit // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SparyProductImpl implements _SparyProduct {
  const _$SparyProductImpl(
      {required this.productName,
      required this.productPrice,
      required this.quantity,
      required this.qtyUnit,
      @JsonKey(name: "_id") required this.id});

  factory _$SparyProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$SparyProductImplFromJson(json);

  @override
  final String productName;
  @override
  final int productPrice;
  @override
  final int quantity;
  @override
  final String qtyUnit;
  @override
  @JsonKey(name: "_id")
  final String id;

  @override
  String toString() {
    return 'SparyProduct(productName: $productName, productPrice: $productPrice, quantity: $quantity, qtyUnit: $qtyUnit, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SparyProductImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.qtyUnit, qtyUnit) || other.qtyUnit == qtyUnit) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, productName, productPrice, quantity, qtyUnit, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SparyProductImplCopyWith<_$SparyProductImpl> get copyWith =>
      __$$SparyProductImplCopyWithImpl<_$SparyProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SparyProductImplToJson(
      this,
    );
  }
}

abstract class _SparyProduct implements SparyProduct {
  const factory _SparyProduct(
      {required final String productName,
      required final int productPrice,
      required final int quantity,
      required final String qtyUnit,
      @JsonKey(name: "_id") required final String id}) = _$SparyProductImpl;

  factory _SparyProduct.fromJson(Map<String, dynamic> json) =
      _$SparyProductImpl.fromJson;

  @override
  String get productName;
  @override
  int get productPrice;
  @override
  int get quantity;
  @override
  String get qtyUnit;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$SparyProductImplCopyWith<_$SparyProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
