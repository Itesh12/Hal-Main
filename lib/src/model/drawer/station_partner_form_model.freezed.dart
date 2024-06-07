// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_partner_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StationPartnerAddressModel _$StationPartnerAddressModelFromJson(
    Map<String, dynamic> json) {
  return _StationPartnerAddressModel.fromJson(json);
}

/// @nodoc
mixin _$StationPartnerAddressModel {
  String get address => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get pinCode => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationPartnerAddressModelCopyWith<StationPartnerAddressModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationPartnerAddressModelCopyWith<$Res> {
  factory $StationPartnerAddressModelCopyWith(StationPartnerAddressModel value,
          $Res Function(StationPartnerAddressModel) then) =
      _$StationPartnerAddressModelCopyWithImpl<$Res,
          StationPartnerAddressModel>;
  @useResult
  $Res call(
      {String address,
      String state,
      String pinCode,
      String type,
      List<double> coordinates});
}

/// @nodoc
class _$StationPartnerAddressModelCopyWithImpl<$Res,
        $Val extends StationPartnerAddressModel>
    implements $StationPartnerAddressModelCopyWith<$Res> {
  _$StationPartnerAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? state = null,
    Object? pinCode = null,
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationPartnerAddressModelImplCopyWith<$Res>
    implements $StationPartnerAddressModelCopyWith<$Res> {
  factory _$$StationPartnerAddressModelImplCopyWith(
          _$StationPartnerAddressModelImpl value,
          $Res Function(_$StationPartnerAddressModelImpl) then) =
      __$$StationPartnerAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String state,
      String pinCode,
      String type,
      List<double> coordinates});
}

/// @nodoc
class __$$StationPartnerAddressModelImplCopyWithImpl<$Res>
    extends _$StationPartnerAddressModelCopyWithImpl<$Res,
        _$StationPartnerAddressModelImpl>
    implements _$$StationPartnerAddressModelImplCopyWith<$Res> {
  __$$StationPartnerAddressModelImplCopyWithImpl(
      _$StationPartnerAddressModelImpl _value,
      $Res Function(_$StationPartnerAddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? state = null,
    Object? pinCode = null,
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_$StationPartnerAddressModelImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationPartnerAddressModelImpl extends _StationPartnerAddressModel {
  const _$StationPartnerAddressModelImpl(
      {required this.address,
      required this.state,
      required this.pinCode,
      required this.type,
      required final List<double> coordinates})
      : _coordinates = coordinates,
        super._();

  factory _$StationPartnerAddressModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$StationPartnerAddressModelImplFromJson(json);

  @override
  final String address;
  @override
  final String state;
  @override
  final String pinCode;
  @override
  final String type;
  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'StationPartnerAddressModel(address: $address, state: $state, pinCode: $pinCode, type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationPartnerAddressModelImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, state, pinCode, type,
      const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationPartnerAddressModelImplCopyWith<_$StationPartnerAddressModelImpl>
      get copyWith => __$$StationPartnerAddressModelImplCopyWithImpl<
          _$StationPartnerAddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationPartnerAddressModelImplToJson(
      this,
    );
  }
}

abstract class _StationPartnerAddressModel extends StationPartnerAddressModel {
  const factory _StationPartnerAddressModel(
          {required final String address,
          required final String state,
          required final String pinCode,
          required final String type,
          required final List<double> coordinates}) =
      _$StationPartnerAddressModelImpl;
  const _StationPartnerAddressModel._() : super._();

  factory _StationPartnerAddressModel.fromJson(Map<String, dynamic> json) =
      _$StationPartnerAddressModelImpl.fromJson;

  @override
  String get address;
  @override
  String get state;
  @override
  String get pinCode;
  @override
  String get type;
  @override
  List<double> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$StationPartnerAddressModelImplCopyWith<_$StationPartnerAddressModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StationPartnerFormModel _$StationPartnerFormModelFromJson(
    Map<String, dynamic> json) {
  return _StationPartnerFormModel.fromJson(json);
}

/// @nodoc
mixin _$StationPartnerFormModel {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get mobileNo => throw _privateConstructorUsedError;
  String get mailId => throw _privateConstructorUsedError;
  String get ksLocation => throw _privateConstructorUsedError;
  String get ksName => throw _privateConstructorUsedError;
  String get ksId => throw _privateConstructorUsedError;
  String get businessDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationPartnerFormModelCopyWith<StationPartnerFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationPartnerFormModelCopyWith<$Res> {
  factory $StationPartnerFormModelCopyWith(StationPartnerFormModel value,
          $Res Function(StationPartnerFormModel) then) =
      _$StationPartnerFormModelCopyWithImpl<$Res, StationPartnerFormModel>;
  @useResult
  $Res call(
      {String userId,
      String name,
      String mobileNo,
      String mailId,
      String ksLocation,
      String ksName,
      String ksId,
      String businessDetails});
}

/// @nodoc
class _$StationPartnerFormModelCopyWithImpl<$Res,
        $Val extends StationPartnerFormModel>
    implements $StationPartnerFormModelCopyWith<$Res> {
  _$StationPartnerFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? mobileNo = null,
    Object? mailId = null,
    Object? ksLocation = null,
    Object? ksName = null,
    Object? ksId = null,
    Object? businessDetails = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      mailId: null == mailId
          ? _value.mailId
          : mailId // ignore: cast_nullable_to_non_nullable
              as String,
      ksLocation: null == ksLocation
          ? _value.ksLocation
          : ksLocation // ignore: cast_nullable_to_non_nullable
              as String,
      ksName: null == ksName
          ? _value.ksName
          : ksName // ignore: cast_nullable_to_non_nullable
              as String,
      ksId: null == ksId
          ? _value.ksId
          : ksId // ignore: cast_nullable_to_non_nullable
              as String,
      businessDetails: null == businessDetails
          ? _value.businessDetails
          : businessDetails // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationPartnerFormModelImplCopyWith<$Res>
    implements $StationPartnerFormModelCopyWith<$Res> {
  factory _$$StationPartnerFormModelImplCopyWith(
          _$StationPartnerFormModelImpl value,
          $Res Function(_$StationPartnerFormModelImpl) then) =
      __$$StationPartnerFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String name,
      String mobileNo,
      String mailId,
      String ksLocation,
      String ksName,
      String ksId,
      String businessDetails});
}

/// @nodoc
class __$$StationPartnerFormModelImplCopyWithImpl<$Res>
    extends _$StationPartnerFormModelCopyWithImpl<$Res,
        _$StationPartnerFormModelImpl>
    implements _$$StationPartnerFormModelImplCopyWith<$Res> {
  __$$StationPartnerFormModelImplCopyWithImpl(
      _$StationPartnerFormModelImpl _value,
      $Res Function(_$StationPartnerFormModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? mobileNo = null,
    Object? mailId = null,
    Object? ksLocation = null,
    Object? ksName = null,
    Object? ksId = null,
    Object? businessDetails = null,
  }) {
    return _then(_$StationPartnerFormModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      mailId: null == mailId
          ? _value.mailId
          : mailId // ignore: cast_nullable_to_non_nullable
              as String,
      ksLocation: null == ksLocation
          ? _value.ksLocation
          : ksLocation // ignore: cast_nullable_to_non_nullable
              as String,
      ksName: null == ksName
          ? _value.ksName
          : ksName // ignore: cast_nullable_to_non_nullable
              as String,
      ksId: null == ksId
          ? _value.ksId
          : ksId // ignore: cast_nullable_to_non_nullable
              as String,
      businessDetails: null == businessDetails
          ? _value.businessDetails
          : businessDetails // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StationPartnerFormModelImpl extends _StationPartnerFormModel {
  const _$StationPartnerFormModelImpl(
      {required this.userId,
      required this.name,
      required this.mobileNo,
      required this.mailId,
      required this.ksLocation,
      required this.ksName,
      required this.ksId,
      required this.businessDetails})
      : super._();

  factory _$StationPartnerFormModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationPartnerFormModelImplFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String mobileNo;
  @override
  final String mailId;
  @override
  final String ksLocation;
  @override
  final String ksName;
  @override
  final String ksId;
  @override
  final String businessDetails;

  @override
  String toString() {
    return 'StationPartnerFormModel(userId: $userId, name: $name, mobileNo: $mobileNo, mailId: $mailId, ksLocation: $ksLocation, ksName: $ksName, ksId: $ksId, businessDetails: $businessDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationPartnerFormModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.mailId, mailId) || other.mailId == mailId) &&
            (identical(other.ksLocation, ksLocation) ||
                other.ksLocation == ksLocation) &&
            (identical(other.ksName, ksName) || other.ksName == ksName) &&
            (identical(other.ksId, ksId) || other.ksId == ksId) &&
            (identical(other.businessDetails, businessDetails) ||
                other.businessDetails == businessDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, mobileNo, mailId,
      ksLocation, ksName, ksId, businessDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StationPartnerFormModelImplCopyWith<_$StationPartnerFormModelImpl>
      get copyWith => __$$StationPartnerFormModelImplCopyWithImpl<
          _$StationPartnerFormModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationPartnerFormModelImplToJson(
      this,
    );
  }
}

abstract class _StationPartnerFormModel extends StationPartnerFormModel {
  const factory _StationPartnerFormModel(
      {required final String userId,
      required final String name,
      required final String mobileNo,
      required final String mailId,
      required final String ksLocation,
      required final String ksName,
      required final String ksId,
      required final String businessDetails}) = _$StationPartnerFormModelImpl;
  const _StationPartnerFormModel._() : super._();

  factory _StationPartnerFormModel.fromJson(Map<String, dynamic> json) =
      _$StationPartnerFormModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  String get mobileNo;
  @override
  String get mailId;
  @override
  String get ksLocation;
  @override
  String get ksName;
  @override
  String get ksId;
  @override
  String get businessDetails;
  @override
  @JsonKey(ignore: true)
  _$$StationPartnerFormModelImplCopyWith<_$StationPartnerFormModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
