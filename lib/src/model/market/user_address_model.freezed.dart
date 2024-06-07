// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAddressModel _$UserAddressModelFromJson(Map<String, dynamic> json) {
  return _UserAddressModel.fromJson(json);
}

/// @nodoc
mixin _$UserAddressModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  List<Address> get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAddressModelCopyWith<UserAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAddressModelCopyWith<$Res> {
  factory $UserAddressModelCopyWith(
          UserAddressModel value, $Res Function(UserAddressModel) then) =
      _$UserAddressModelCopyWithImpl<$Res, UserAddressModel>;
  @useResult
  $Res call({@JsonKey(name: "_id") String id, List<Address> address});
}

/// @nodoc
class _$UserAddressModelCopyWithImpl<$Res, $Val extends UserAddressModel>
    implements $UserAddressModelCopyWith<$Res> {
  _$UserAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as List<Address>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAddressModelImplCopyWith<$Res>
    implements $UserAddressModelCopyWith<$Res> {
  factory _$$UserAddressModelImplCopyWith(_$UserAddressModelImpl value,
          $Res Function(_$UserAddressModelImpl) then) =
      __$$UserAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String id, List<Address> address});
}

/// @nodoc
class __$$UserAddressModelImplCopyWithImpl<$Res>
    extends _$UserAddressModelCopyWithImpl<$Res, _$UserAddressModelImpl>
    implements _$$UserAddressModelImplCopyWith<$Res> {
  __$$UserAddressModelImplCopyWithImpl(_$UserAddressModelImpl _value,
      $Res Function(_$UserAddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
  }) {
    return _then(_$UserAddressModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<Address>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAddressModelImpl implements _UserAddressModel {
  const _$UserAddressModelImpl(
      {@JsonKey(name: "_id") required this.id,
      required final List<Address> address})
      : _address = address;

  factory _$UserAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAddressModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  final List<Address> _address;
  @override
  List<Address> get address {
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_address);
  }

  @override
  String toString() {
    return 'UserAddressModel(id: $id, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._address, _address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_address));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAddressModelImplCopyWith<_$UserAddressModelImpl> get copyWith =>
      __$$UserAddressModelImplCopyWithImpl<_$UserAddressModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAddressModelImplToJson(
      this,
    );
  }
}

abstract class _UserAddressModel implements UserAddressModel {
  const factory _UserAddressModel(
      {@JsonKey(name: "_id") required final String id,
      required final List<Address> address}) = _$UserAddressModelImpl;

  factory _UserAddressModel.fromJson(Map<String, dynamic> json) =
      _$UserAddressModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  List<Address> get address;
  @override
  @JsonKey(ignore: true)
  _$$UserAddressModelImplCopyWith<_$UserAddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String get state => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  String get pinCode => throw _privateConstructorUsedError;
  String get area => throw _privateConstructorUsedError;
  String get locationType => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get wtsUpMobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String state,
      String district,
      String pinCode,
      String area,
      String locationType,
      double latitude,
      double longitude,
      String? wtsUpMobileNo,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? district = null,
    Object? pinCode = null,
    Object? area = null,
    Object? locationType = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? wtsUpMobileNo = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      locationType: null == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      wtsUpMobileNo: freezed == wtsUpMobileNo
          ? _value.wtsUpMobileNo
          : wtsUpMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String state,
      String district,
      String pinCode,
      String area,
      String locationType,
      double latitude,
      double longitude,
      String? wtsUpMobileNo,
      @JsonKey(name: "_id") String id});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? district = null,
    Object? pinCode = null,
    Object? area = null,
    Object? locationType = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? wtsUpMobileNo = freezed,
    Object? id = null,
  }) {
    return _then(_$AddressImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      locationType: null == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      wtsUpMobileNo: freezed == wtsUpMobileNo
          ? _value.wtsUpMobileNo
          : wtsUpMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {required this.state,
      required this.district,
      required this.pinCode,
      required this.area,
      required this.locationType,
      required this.latitude,
      required this.longitude,
      this.wtsUpMobileNo,
      @JsonKey(name: "_id") required this.id});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String state;
  @override
  final String district;
  @override
  final String pinCode;
  @override
  final String area;
  @override
  final String locationType;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? wtsUpMobileNo;
  @override
  @JsonKey(name: "_id")
  final String id;

  @override
  String toString() {
    return 'Address(state: $state, district: $district, pinCode: $pinCode, area: $area, locationType: $locationType, latitude: $latitude, longitude: $longitude, wtsUpMobileNo: $wtsUpMobileNo, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.locationType, locationType) ||
                other.locationType == locationType) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.wtsUpMobileNo, wtsUpMobileNo) ||
                other.wtsUpMobileNo == wtsUpMobileNo) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, district, pinCode, area,
      locationType, latitude, longitude, wtsUpMobileNo, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {required final String state,
      required final String district,
      required final String pinCode,
      required final String area,
      required final String locationType,
      required final double latitude,
      required final double longitude,
      final String? wtsUpMobileNo,
      @JsonKey(name: "_id") required final String id}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String get state;
  @override
  String get district;
  @override
  String get pinCode;
  @override
  String get area;
  @override
  String get locationType;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get wtsUpMobileNo;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
