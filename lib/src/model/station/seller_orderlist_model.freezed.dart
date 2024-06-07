// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_orderlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SellerOrderlistModel _$SellerOrderlistModelFromJson(Map<String, dynamic> json) {
  return _SellerOrderlistModel.fromJson(json);
}

/// @nodoc
mixin _$SellerOrderlistModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get buyerName => throw _privateConstructorUsedError;
  String get bookingId => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  double get estimatedPrice => throw _privateConstructorUsedError;
  FarmLocation get farmLocation => throw _privateConstructorUsedError;
  String get bookingDate => throw _privateConstructorUsedError;
  String get bookingTime => throw _privateConstructorUsedError;
  List<FarmDetail> get farmDetails => throw _privateConstructorUsedError;
  String get cropType => throw _privateConstructorUsedError;
  String get sparyProduct => throw _privateConstructorUsedError;
  String get mobileNo => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  String? get buyerProfileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerOrderlistModelCopyWith<SellerOrderlistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerOrderlistModelCopyWith<$Res> {
  factory $SellerOrderlistModelCopyWith(SellerOrderlistModel value,
          $Res Function(SellerOrderlistModel) then) =
      _$SellerOrderlistModelCopyWithImpl<$Res, SellerOrderlistModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String buyerName,
      String bookingId,
      String serviceName,
      double estimatedPrice,
      FarmLocation farmLocation,
      String bookingDate,
      String bookingTime,
      List<FarmDetail> farmDetails,
      String cropType,
      String sparyProduct,
      String mobileNo,
      String orderStatus,
      String? buyerProfileImage});

  $FarmLocationCopyWith<$Res> get farmLocation;
}

/// @nodoc
class _$SellerOrderlistModelCopyWithImpl<$Res,
        $Val extends SellerOrderlistModel>
    implements $SellerOrderlistModelCopyWith<$Res> {
  _$SellerOrderlistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? buyerName = null,
    Object? bookingId = null,
    Object? serviceName = null,
    Object? estimatedPrice = null,
    Object? farmLocation = null,
    Object? bookingDate = null,
    Object? bookingTime = null,
    Object? farmDetails = null,
    Object? cropType = null,
    Object? sparyProduct = null,
    Object? mobileNo = null,
    Object? orderStatus = null,
    Object? buyerProfileImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedPrice: null == estimatedPrice
          ? _value.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      farmLocation: null == farmLocation
          ? _value.farmLocation
          : farmLocation // ignore: cast_nullable_to_non_nullable
              as FarmLocation,
      bookingDate: null == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as String,
      bookingTime: null == bookingTime
          ? _value.bookingTime
          : bookingTime // ignore: cast_nullable_to_non_nullable
              as String,
      farmDetails: null == farmDetails
          ? _value.farmDetails
          : farmDetails // ignore: cast_nullable_to_non_nullable
              as List<FarmDetail>,
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      sparyProduct: null == sparyProduct
          ? _value.sparyProduct
          : sparyProduct // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      buyerProfileImage: freezed == buyerProfileImage
          ? _value.buyerProfileImage
          : buyerProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FarmLocationCopyWith<$Res> get farmLocation {
    return $FarmLocationCopyWith<$Res>(_value.farmLocation, (value) {
      return _then(_value.copyWith(farmLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SellerOrderlistModelImplCopyWith<$Res>
    implements $SellerOrderlistModelCopyWith<$Res> {
  factory _$$SellerOrderlistModelImplCopyWith(_$SellerOrderlistModelImpl value,
          $Res Function(_$SellerOrderlistModelImpl) then) =
      __$$SellerOrderlistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String buyerName,
      String bookingId,
      String serviceName,
      double estimatedPrice,
      FarmLocation farmLocation,
      String bookingDate,
      String bookingTime,
      List<FarmDetail> farmDetails,
      String cropType,
      String sparyProduct,
      String mobileNo,
      String orderStatus,
      String? buyerProfileImage});

  @override
  $FarmLocationCopyWith<$Res> get farmLocation;
}

/// @nodoc
class __$$SellerOrderlistModelImplCopyWithImpl<$Res>
    extends _$SellerOrderlistModelCopyWithImpl<$Res, _$SellerOrderlistModelImpl>
    implements _$$SellerOrderlistModelImplCopyWith<$Res> {
  __$$SellerOrderlistModelImplCopyWithImpl(_$SellerOrderlistModelImpl _value,
      $Res Function(_$SellerOrderlistModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? buyerName = null,
    Object? bookingId = null,
    Object? serviceName = null,
    Object? estimatedPrice = null,
    Object? farmLocation = null,
    Object? bookingDate = null,
    Object? bookingTime = null,
    Object? farmDetails = null,
    Object? cropType = null,
    Object? sparyProduct = null,
    Object? mobileNo = null,
    Object? orderStatus = null,
    Object? buyerProfileImage = freezed,
  }) {
    return _then(_$SellerOrderlistModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedPrice: null == estimatedPrice
          ? _value.estimatedPrice
          : estimatedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      farmLocation: null == farmLocation
          ? _value.farmLocation
          : farmLocation // ignore: cast_nullable_to_non_nullable
              as FarmLocation,
      bookingDate: null == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as String,
      bookingTime: null == bookingTime
          ? _value.bookingTime
          : bookingTime // ignore: cast_nullable_to_non_nullable
              as String,
      farmDetails: null == farmDetails
          ? _value._farmDetails
          : farmDetails // ignore: cast_nullable_to_non_nullable
              as List<FarmDetail>,
      cropType: null == cropType
          ? _value.cropType
          : cropType // ignore: cast_nullable_to_non_nullable
              as String,
      sparyProduct: null == sparyProduct
          ? _value.sparyProduct
          : sparyProduct // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      buyerProfileImage: freezed == buyerProfileImage
          ? _value.buyerProfileImage
          : buyerProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerOrderlistModelImpl implements _SellerOrderlistModel {
  const _$SellerOrderlistModelImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.buyerName,
      required this.bookingId,
      required this.serviceName,
      required this.estimatedPrice,
      required this.farmLocation,
      required this.bookingDate,
      required this.bookingTime,
      required final List<FarmDetail> farmDetails,
      required this.cropType,
      required this.sparyProduct,
      required this.mobileNo,
      required this.orderStatus,
      this.buyerProfileImage})
      : _farmDetails = farmDetails;

  factory _$SellerOrderlistModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerOrderlistModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String buyerName;
  @override
  final String bookingId;
  @override
  final String serviceName;
  @override
  final double estimatedPrice;
  @override
  final FarmLocation farmLocation;
  @override
  final String bookingDate;
  @override
  final String bookingTime;
  final List<FarmDetail> _farmDetails;
  @override
  List<FarmDetail> get farmDetails {
    if (_farmDetails is EqualUnmodifiableListView) return _farmDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_farmDetails);
  }

  @override
  final String cropType;
  @override
  final String sparyProduct;
  @override
  final String mobileNo;
  @override
  final String orderStatus;
  @override
  final String? buyerProfileImage;

  @override
  String toString() {
    return 'SellerOrderlistModel(id: $id, buyerName: $buyerName, bookingId: $bookingId, serviceName: $serviceName, estimatedPrice: $estimatedPrice, farmLocation: $farmLocation, bookingDate: $bookingDate, bookingTime: $bookingTime, farmDetails: $farmDetails, cropType: $cropType, sparyProduct: $sparyProduct, mobileNo: $mobileNo, orderStatus: $orderStatus, buyerProfileImage: $buyerProfileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerOrderlistModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.buyerName, buyerName) ||
                other.buyerName == buyerName) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.estimatedPrice, estimatedPrice) ||
                other.estimatedPrice == estimatedPrice) &&
            (identical(other.farmLocation, farmLocation) ||
                other.farmLocation == farmLocation) &&
            (identical(other.bookingDate, bookingDate) ||
                other.bookingDate == bookingDate) &&
            (identical(other.bookingTime, bookingTime) ||
                other.bookingTime == bookingTime) &&
            const DeepCollectionEquality()
                .equals(other._farmDetails, _farmDetails) &&
            (identical(other.cropType, cropType) ||
                other.cropType == cropType) &&
            (identical(other.sparyProduct, sparyProduct) ||
                other.sparyProduct == sparyProduct) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.buyerProfileImage, buyerProfileImage) ||
                other.buyerProfileImage == buyerProfileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      buyerName,
      bookingId,
      serviceName,
      estimatedPrice,
      farmLocation,
      bookingDate,
      bookingTime,
      const DeepCollectionEquality().hash(_farmDetails),
      cropType,
      sparyProduct,
      mobileNo,
      orderStatus,
      buyerProfileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerOrderlistModelImplCopyWith<_$SellerOrderlistModelImpl>
      get copyWith =>
          __$$SellerOrderlistModelImplCopyWithImpl<_$SellerOrderlistModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerOrderlistModelImplToJson(
      this,
    );
  }
}

abstract class _SellerOrderlistModel implements SellerOrderlistModel {
  const factory _SellerOrderlistModel(
      {@JsonKey(name: "_id") required final String id,
      required final String buyerName,
      required final String bookingId,
      required final String serviceName,
      required final double estimatedPrice,
      required final FarmLocation farmLocation,
      required final String bookingDate,
      required final String bookingTime,
      required final List<FarmDetail> farmDetails,
      required final String cropType,
      required final String sparyProduct,
      required final String mobileNo,
      required final String orderStatus,
      final String? buyerProfileImage}) = _$SellerOrderlistModelImpl;

  factory _SellerOrderlistModel.fromJson(Map<String, dynamic> json) =
      _$SellerOrderlistModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get buyerName;
  @override
  String get bookingId;
  @override
  String get serviceName;
  @override
  double get estimatedPrice;
  @override
  FarmLocation get farmLocation;
  @override
  String get bookingDate;
  @override
  String get bookingTime;
  @override
  List<FarmDetail> get farmDetails;
  @override
  String get cropType;
  @override
  String get sparyProduct;
  @override
  String get mobileNo;
  @override
  String get orderStatus;
  @override
  String? get buyerProfileImage;
  @override
  @JsonKey(ignore: true)
  _$$SellerOrderlistModelImplCopyWith<_$SellerOrderlistModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FarmDetail _$FarmDetailFromJson(Map<String, dynamic> json) {
  return _FarmDetail.fromJson(json);
}

/// @nodoc
mixin _$FarmDetail {
  String get farmName => throw _privateConstructorUsedError;
  double get area => throw _privateConstructorUsedError;
  String get areaUnit => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FarmDetailCopyWith<FarmDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmDetailCopyWith<$Res> {
  factory $FarmDetailCopyWith(
          FarmDetail value, $Res Function(FarmDetail) then) =
      _$FarmDetailCopyWithImpl<$Res, FarmDetail>;
  @useResult
  $Res call(
      {String farmName,
      double area,
      String areaUnit,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$FarmDetailCopyWithImpl<$Res, $Val extends FarmDetail>
    implements $FarmDetailCopyWith<$Res> {
  _$FarmDetailCopyWithImpl(this._value, this._then);

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
abstract class _$$FarmDetailImplCopyWith<$Res>
    implements $FarmDetailCopyWith<$Res> {
  factory _$$FarmDetailImplCopyWith(
          _$FarmDetailImpl value, $Res Function(_$FarmDetailImpl) then) =
      __$$FarmDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String farmName,
      double area,
      String areaUnit,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$$FarmDetailImplCopyWithImpl<$Res>
    extends _$FarmDetailCopyWithImpl<$Res, _$FarmDetailImpl>
    implements _$$FarmDetailImplCopyWith<$Res> {
  __$$FarmDetailImplCopyWithImpl(
      _$FarmDetailImpl _value, $Res Function(_$FarmDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmName = null,
    Object? area = null,
    Object? areaUnit = null,
    Object? id = null,
  }) {
    return _then(_$FarmDetailImpl(
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
class _$FarmDetailImpl implements _FarmDetail {
  const _$FarmDetailImpl(
      {required this.farmName,
      required this.area,
      required this.areaUnit,
      @JsonKey(name: "_id") required this.id});

  factory _$FarmDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmDetailImplFromJson(json);

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
    return 'FarmDetail(farmName: $farmName, area: $area, areaUnit: $areaUnit, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmDetailImpl &&
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
  _$$FarmDetailImplCopyWith<_$FarmDetailImpl> get copyWith =>
      __$$FarmDetailImplCopyWithImpl<_$FarmDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmDetailImplToJson(
      this,
    );
  }
}

abstract class _FarmDetail implements FarmDetail {
  const factory _FarmDetail(
      {required final String farmName,
      required final double area,
      required final String areaUnit,
      @JsonKey(name: "_id") required final String id}) = _$FarmDetailImpl;

  factory _FarmDetail.fromJson(Map<String, dynamic> json) =
      _$FarmDetailImpl.fromJson;

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
  _$$FarmDetailImplCopyWith<_$FarmDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FarmLocation _$FarmLocationFromJson(Map<String, dynamic> json) {
  return _FarmLocation.fromJson(json);
}

/// @nodoc
mixin _$FarmLocation {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FarmLocationCopyWith<FarmLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmLocationCopyWith<$Res> {
  factory $FarmLocationCopyWith(
          FarmLocation value, $Res Function(FarmLocation) then) =
      _$FarmLocationCopyWithImpl<$Res, FarmLocation>;
  @useResult
  $Res call({String latitude, String longitude, String address});
}

/// @nodoc
class _$FarmLocationCopyWithImpl<$Res, $Val extends FarmLocation>
    implements $FarmLocationCopyWith<$Res> {
  _$FarmLocationCopyWithImpl(this._value, this._then);

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
abstract class _$$FarmLocationImplCopyWith<$Res>
    implements $FarmLocationCopyWith<$Res> {
  factory _$$FarmLocationImplCopyWith(
          _$FarmLocationImpl value, $Res Function(_$FarmLocationImpl) then) =
      __$$FarmLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latitude, String longitude, String address});
}

/// @nodoc
class __$$FarmLocationImplCopyWithImpl<$Res>
    extends _$FarmLocationCopyWithImpl<$Res, _$FarmLocationImpl>
    implements _$$FarmLocationImplCopyWith<$Res> {
  __$$FarmLocationImplCopyWithImpl(
      _$FarmLocationImpl _value, $Res Function(_$FarmLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
  }) {
    return _then(_$FarmLocationImpl(
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
class _$FarmLocationImpl implements _FarmLocation {
  const _$FarmLocationImpl(
      {required this.latitude, required this.longitude, required this.address});

  factory _$FarmLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmLocationImplFromJson(json);

  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String address;

  @override
  String toString() {
    return 'FarmLocation(latitude: $latitude, longitude: $longitude, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmLocationImpl &&
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
  _$$FarmLocationImplCopyWith<_$FarmLocationImpl> get copyWith =>
      __$$FarmLocationImplCopyWithImpl<_$FarmLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmLocationImplToJson(
      this,
    );
  }
}

abstract class _FarmLocation implements FarmLocation {
  const factory _FarmLocation(
      {required final String latitude,
      required final String longitude,
      required final String address}) = _$FarmLocationImpl;

  factory _FarmLocation.fromJson(Map<String, dynamic> json) =
      _$FarmLocationImpl.fromJson;

  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$FarmLocationImplCopyWith<_$FarmLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
