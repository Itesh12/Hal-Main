// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listingproduct_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListingproductDetailsModel _$ListingproductDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _ListingproductDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$ListingproductDetailsModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  String get sellingProductId => throw _privateConstructorUsedError;
  String get droneRegNo => throw _privateConstructorUsedError;
  List<String> get droneImages => throw _privateConstructorUsedError;
  String get serviceDescription => throw _privateConstructorUsedError;
  List<SelectedStation> get selectedStations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingproductDetailsModelCopyWith<ListingproductDetailsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingproductDetailsModelCopyWith<$Res> {
  factory $ListingproductDetailsModelCopyWith(ListingproductDetailsModel value,
          $Res Function(ListingproductDetailsModel) then) =
      _$ListingproductDetailsModelCopyWithImpl<$Res,
          ListingproductDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String serviceName,
      String sellingProductId,
      String droneRegNo,
      List<String> droneImages,
      String serviceDescription,
      List<SelectedStation> selectedStations});
}

/// @nodoc
class _$ListingproductDetailsModelCopyWithImpl<$Res,
        $Val extends ListingproductDetailsModel>
    implements $ListingproductDetailsModelCopyWith<$Res> {
  _$ListingproductDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceName = null,
    Object? sellingProductId = null,
    Object? droneRegNo = null,
    Object? droneImages = null,
    Object? serviceDescription = null,
    Object? selectedStations = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      sellingProductId: null == sellingProductId
          ? _value.sellingProductId
          : sellingProductId // ignore: cast_nullable_to_non_nullable
              as String,
      droneRegNo: null == droneRegNo
          ? _value.droneRegNo
          : droneRegNo // ignore: cast_nullable_to_non_nullable
              as String,
      droneImages: null == droneImages
          ? _value.droneImages
          : droneImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      serviceDescription: null == serviceDescription
          ? _value.serviceDescription
          : serviceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      selectedStations: null == selectedStations
          ? _value.selectedStations
          : selectedStations // ignore: cast_nullable_to_non_nullable
              as List<SelectedStation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListingproductDetailsModelImplCopyWith<$Res>
    implements $ListingproductDetailsModelCopyWith<$Res> {
  factory _$$ListingproductDetailsModelImplCopyWith(
          _$ListingproductDetailsModelImpl value,
          $Res Function(_$ListingproductDetailsModelImpl) then) =
      __$$ListingproductDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String serviceName,
      String sellingProductId,
      String droneRegNo,
      List<String> droneImages,
      String serviceDescription,
      List<SelectedStation> selectedStations});
}

/// @nodoc
class __$$ListingproductDetailsModelImplCopyWithImpl<$Res>
    extends _$ListingproductDetailsModelCopyWithImpl<$Res,
        _$ListingproductDetailsModelImpl>
    implements _$$ListingproductDetailsModelImplCopyWith<$Res> {
  __$$ListingproductDetailsModelImplCopyWithImpl(
      _$ListingproductDetailsModelImpl _value,
      $Res Function(_$ListingproductDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceName = null,
    Object? sellingProductId = null,
    Object? droneRegNo = null,
    Object? droneImages = null,
    Object? serviceDescription = null,
    Object? selectedStations = null,
  }) {
    return _then(_$ListingproductDetailsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      sellingProductId: null == sellingProductId
          ? _value.sellingProductId
          : sellingProductId // ignore: cast_nullable_to_non_nullable
              as String,
      droneRegNo: null == droneRegNo
          ? _value.droneRegNo
          : droneRegNo // ignore: cast_nullable_to_non_nullable
              as String,
      droneImages: null == droneImages
          ? _value._droneImages
          : droneImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      serviceDescription: null == serviceDescription
          ? _value.serviceDescription
          : serviceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      selectedStations: null == selectedStations
          ? _value._selectedStations
          : selectedStations // ignore: cast_nullable_to_non_nullable
              as List<SelectedStation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListingproductDetailsModelImpl implements _ListingproductDetailsModel {
  const _$ListingproductDetailsModelImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.serviceName,
      required this.sellingProductId,
      required this.droneRegNo,
      required final List<String> droneImages,
      required this.serviceDescription,
      required final List<SelectedStation> selectedStations})
      : _droneImages = droneImages,
        _selectedStations = selectedStations;

  factory _$ListingproductDetailsModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ListingproductDetailsModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String serviceName;
  @override
  final String sellingProductId;
  @override
  final String droneRegNo;
  final List<String> _droneImages;
  @override
  List<String> get droneImages {
    if (_droneImages is EqualUnmodifiableListView) return _droneImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_droneImages);
  }

  @override
  final String serviceDescription;
  final List<SelectedStation> _selectedStations;
  @override
  List<SelectedStation> get selectedStations {
    if (_selectedStations is EqualUnmodifiableListView)
      return _selectedStations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedStations);
  }

  @override
  String toString() {
    return 'ListingproductDetailsModel(id: $id, serviceName: $serviceName, sellingProductId: $sellingProductId, droneRegNo: $droneRegNo, droneImages: $droneImages, serviceDescription: $serviceDescription, selectedStations: $selectedStations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingproductDetailsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.sellingProductId, sellingProductId) ||
                other.sellingProductId == sellingProductId) &&
            (identical(other.droneRegNo, droneRegNo) ||
                other.droneRegNo == droneRegNo) &&
            const DeepCollectionEquality()
                .equals(other._droneImages, _droneImages) &&
            (identical(other.serviceDescription, serviceDescription) ||
                other.serviceDescription == serviceDescription) &&
            const DeepCollectionEquality()
                .equals(other._selectedStations, _selectedStations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      serviceName,
      sellingProductId,
      droneRegNo,
      const DeepCollectionEquality().hash(_droneImages),
      serviceDescription,
      const DeepCollectionEquality().hash(_selectedStations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingproductDetailsModelImplCopyWith<_$ListingproductDetailsModelImpl>
      get copyWith => __$$ListingproductDetailsModelImplCopyWithImpl<
          _$ListingproductDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingproductDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _ListingproductDetailsModel
    implements ListingproductDetailsModel {
  const factory _ListingproductDetailsModel(
          {@JsonKey(name: "_id") required final String id,
          required final String serviceName,
          required final String sellingProductId,
          required final String droneRegNo,
          required final List<String> droneImages,
          required final String serviceDescription,
          required final List<SelectedStation> selectedStations}) =
      _$ListingproductDetailsModelImpl;

  factory _ListingproductDetailsModel.fromJson(Map<String, dynamic> json) =
      _$ListingproductDetailsModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get serviceName;
  @override
  String get sellingProductId;
  @override
  String get droneRegNo;
  @override
  List<String> get droneImages;
  @override
  String get serviceDescription;
  @override
  List<SelectedStation> get selectedStations;
  @override
  @JsonKey(ignore: true)
  _$$ListingproductDetailsModelImplCopyWith<_$ListingproductDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SelectedStation _$SelectedStationFromJson(Map<String, dynamic> json) {
  return _SelectedStation.fromJson(json);
}

/// @nodoc
mixin _$SelectedStation {
  KsLocation get ksLocation => throw _privateConstructorUsedError;
  String get ksName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedStationCopyWith<SelectedStation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedStationCopyWith<$Res> {
  factory $SelectedStationCopyWith(
          SelectedStation value, $Res Function(SelectedStation) then) =
      _$SelectedStationCopyWithImpl<$Res, SelectedStation>;
  @useResult
  $Res call({KsLocation ksLocation, String ksName});

  $KsLocationCopyWith<$Res> get ksLocation;
}

/// @nodoc
class _$SelectedStationCopyWithImpl<$Res, $Val extends SelectedStation>
    implements $SelectedStationCopyWith<$Res> {
  _$SelectedStationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ksLocation = null,
    Object? ksName = null,
  }) {
    return _then(_value.copyWith(
      ksLocation: null == ksLocation
          ? _value.ksLocation
          : ksLocation // ignore: cast_nullable_to_non_nullable
              as KsLocation,
      ksName: null == ksName
          ? _value.ksName
          : ksName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KsLocationCopyWith<$Res> get ksLocation {
    return $KsLocationCopyWith<$Res>(_value.ksLocation, (value) {
      return _then(_value.copyWith(ksLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SelectedStationImplCopyWith<$Res>
    implements $SelectedStationCopyWith<$Res> {
  factory _$$SelectedStationImplCopyWith(_$SelectedStationImpl value,
          $Res Function(_$SelectedStationImpl) then) =
      __$$SelectedStationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({KsLocation ksLocation, String ksName});

  @override
  $KsLocationCopyWith<$Res> get ksLocation;
}

/// @nodoc
class __$$SelectedStationImplCopyWithImpl<$Res>
    extends _$SelectedStationCopyWithImpl<$Res, _$SelectedStationImpl>
    implements _$$SelectedStationImplCopyWith<$Res> {
  __$$SelectedStationImplCopyWithImpl(
      _$SelectedStationImpl _value, $Res Function(_$SelectedStationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ksLocation = null,
    Object? ksName = null,
  }) {
    return _then(_$SelectedStationImpl(
      ksLocation: null == ksLocation
          ? _value.ksLocation
          : ksLocation // ignore: cast_nullable_to_non_nullable
              as KsLocation,
      ksName: null == ksName
          ? _value.ksName
          : ksName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedStationImpl implements _SelectedStation {
  const _$SelectedStationImpl({required this.ksLocation, required this.ksName});

  factory _$SelectedStationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedStationImplFromJson(json);

  @override
  final KsLocation ksLocation;
  @override
  final String ksName;

  @override
  String toString() {
    return 'SelectedStation(ksLocation: $ksLocation, ksName: $ksName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedStationImpl &&
            (identical(other.ksLocation, ksLocation) ||
                other.ksLocation == ksLocation) &&
            (identical(other.ksName, ksName) || other.ksName == ksName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ksLocation, ksName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedStationImplCopyWith<_$SelectedStationImpl> get copyWith =>
      __$$SelectedStationImplCopyWithImpl<_$SelectedStationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedStationImplToJson(
      this,
    );
  }
}

abstract class _SelectedStation implements SelectedStation {
  const factory _SelectedStation(
      {required final KsLocation ksLocation,
      required final String ksName}) = _$SelectedStationImpl;

  factory _SelectedStation.fromJson(Map<String, dynamic> json) =
      _$SelectedStationImpl.fromJson;

  @override
  KsLocation get ksLocation;
  @override
  String get ksName;
  @override
  @JsonKey(ignore: true)
  _$$SelectedStationImplCopyWith<_$SelectedStationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KsLocation _$KsLocationFromJson(Map<String, dynamic> json) {
  return _KsLocation.fromJson(json);
}

/// @nodoc
mixin _$KsLocation {
  String get address => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KsLocationCopyWith<KsLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KsLocationCopyWith<$Res> {
  factory $KsLocationCopyWith(
          KsLocation value, $Res Function(KsLocation) then) =
      _$KsLocationCopyWithImpl<$Res, KsLocation>;
  @useResult
  $Res call({String address, String state});
}

/// @nodoc
class _$KsLocationCopyWithImpl<$Res, $Val extends KsLocation>
    implements $KsLocationCopyWith<$Res> {
  _$KsLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? state = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KsLocationImplCopyWith<$Res>
    implements $KsLocationCopyWith<$Res> {
  factory _$$KsLocationImplCopyWith(
          _$KsLocationImpl value, $Res Function(_$KsLocationImpl) then) =
      __$$KsLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, String state});
}

/// @nodoc
class __$$KsLocationImplCopyWithImpl<$Res>
    extends _$KsLocationCopyWithImpl<$Res, _$KsLocationImpl>
    implements _$$KsLocationImplCopyWith<$Res> {
  __$$KsLocationImplCopyWithImpl(
      _$KsLocationImpl _value, $Res Function(_$KsLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? state = null,
  }) {
    return _then(_$KsLocationImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KsLocationImpl implements _KsLocation {
  const _$KsLocationImpl({required this.address, required this.state});

  factory _$KsLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$KsLocationImplFromJson(json);

  @override
  final String address;
  @override
  final String state;

  @override
  String toString() {
    return 'KsLocation(address: $address, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KsLocationImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KsLocationImplCopyWith<_$KsLocationImpl> get copyWith =>
      __$$KsLocationImplCopyWithImpl<_$KsLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KsLocationImplToJson(
      this,
    );
  }
}

abstract class _KsLocation implements KsLocation {
  const factory _KsLocation(
      {required final String address,
      required final String state}) = _$KsLocationImpl;

  factory _KsLocation.fromJson(Map<String, dynamic> json) =
      _$KsLocationImpl.fromJson;

  @override
  String get address;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$$KsLocationImplCopyWith<_$KsLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
