// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherResponseModel _$WeatherResponseModelFromJson(Map<String, dynamic> json) {
  return _WeatherResponseModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherResponseModel {
  String? get date => throw _privateConstructorUsedError;
  double? get location => throw _privateConstructorUsedError;
  double? get tempMin => throw _privateConstructorUsedError;
  double? get tempMax => throw _privateConstructorUsedError;
  int? get pressure => throw _privateConstructorUsedError;
  int? get humidity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherResponseModelCopyWith<WeatherResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherResponseModelCopyWith<$Res> {
  factory $WeatherResponseModelCopyWith(WeatherResponseModel value,
          $Res Function(WeatherResponseModel) then) =
      _$WeatherResponseModelCopyWithImpl<$Res, WeatherResponseModel>;
  @useResult
  $Res call(
      {String? date,
      double? location,
      double? tempMin,
      double? tempMax,
      int? pressure,
      int? humidity});
}

/// @nodoc
class _$WeatherResponseModelCopyWithImpl<$Res,
        $Val extends WeatherResponseModel>
    implements $WeatherResponseModelCopyWith<$Res> {
  _$WeatherResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? location = freezed,
    Object? tempMin = freezed,
    Object? tempMax = freezed,
    Object? pressure = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as double?,
      tempMin: freezed == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as double?,
      tempMax: freezed == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as double?,
      pressure: freezed == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherResponseModelImplCopyWith<$Res>
    implements $WeatherResponseModelCopyWith<$Res> {
  factory _$$WeatherResponseModelImplCopyWith(_$WeatherResponseModelImpl value,
          $Res Function(_$WeatherResponseModelImpl) then) =
      __$$WeatherResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? date,
      double? location,
      double? tempMin,
      double? tempMax,
      int? pressure,
      int? humidity});
}

/// @nodoc
class __$$WeatherResponseModelImplCopyWithImpl<$Res>
    extends _$WeatherResponseModelCopyWithImpl<$Res, _$WeatherResponseModelImpl>
    implements _$$WeatherResponseModelImplCopyWith<$Res> {
  __$$WeatherResponseModelImplCopyWithImpl(_$WeatherResponseModelImpl _value,
      $Res Function(_$WeatherResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? location = freezed,
    Object? tempMin = freezed,
    Object? tempMax = freezed,
    Object? pressure = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_$WeatherResponseModelImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as double?,
      tempMin: freezed == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as double?,
      tempMax: freezed == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as double?,
      pressure: freezed == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherResponseModelImpl extends _WeatherResponseModel {
  const _$WeatherResponseModelImpl(
      {this.date,
      this.location,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity})
      : super._();

  factory _$WeatherResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherResponseModelImplFromJson(json);

  @override
  final String? date;
  @override
  final double? location;
  @override
  final double? tempMin;
  @override
  final double? tempMax;
  @override
  final int? pressure;
  @override
  final int? humidity;

  @override
  String toString() {
    return 'WeatherResponseModel(date: $date, location: $location, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherResponseModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.tempMin, tempMin) || other.tempMin == tempMin) &&
            (identical(other.tempMax, tempMax) || other.tempMax == tempMax) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, location, tempMin, tempMax, pressure, humidity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherResponseModelImplCopyWith<_$WeatherResponseModelImpl>
      get copyWith =>
          __$$WeatherResponseModelImplCopyWithImpl<_$WeatherResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherResponseModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherResponseModel extends WeatherResponseModel {
  const factory _WeatherResponseModel(
      {final String? date,
      final double? location,
      final double? tempMin,
      final double? tempMax,
      final int? pressure,
      final int? humidity}) = _$WeatherResponseModelImpl;
  const _WeatherResponseModel._() : super._();

  factory _WeatherResponseModel.fromJson(Map<String, dynamic> json) =
      _$WeatherResponseModelImpl.fromJson;

  @override
  String? get date;
  @override
  double? get location;
  @override
  double? get tempMin;
  @override
  double? get tempMax;
  @override
  int? get pressure;
  @override
  int? get humidity;
  @override
  @JsonKey(ignore: true)
  _$$WeatherResponseModelImplCopyWith<_$WeatherResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
