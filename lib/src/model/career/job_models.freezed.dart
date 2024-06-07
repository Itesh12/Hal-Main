// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobModel _$JobModelFromJson(Map<String, dynamic> json) {
  return _JobModel.fromJson(json);
}

/// @nodoc
mixin _$JobModel {
  String? get jobtitle => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobModelCopyWith<JobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobModelCopyWith<$Res> {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) then) =
      _$JobModelCopyWithImpl<$Res, JobModel>;
  @useResult
  $Res call({String? jobtitle, String? location});
}

/// @nodoc
class _$JobModelCopyWithImpl<$Res, $Val extends JobModel>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobtitle = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      jobtitle: freezed == jobtitle
          ? _value.jobtitle
          : jobtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobModelImplCopyWith<$Res>
    implements $JobModelCopyWith<$Res> {
  factory _$$JobModelImplCopyWith(
          _$JobModelImpl value, $Res Function(_$JobModelImpl) then) =
      __$$JobModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? jobtitle, String? location});
}

/// @nodoc
class __$$JobModelImplCopyWithImpl<$Res>
    extends _$JobModelCopyWithImpl<$Res, _$JobModelImpl>
    implements _$$JobModelImplCopyWith<$Res> {
  __$$JobModelImplCopyWithImpl(
      _$JobModelImpl _value, $Res Function(_$JobModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobtitle = freezed,
    Object? location = freezed,
  }) {
    return _then(_$JobModelImpl(
      jobtitle: freezed == jobtitle
          ? _value.jobtitle
          : jobtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobModelImpl extends _JobModel {
  const _$JobModelImpl({this.jobtitle, this.location}) : super._();

  factory _$JobModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobModelImplFromJson(json);

  @override
  final String? jobtitle;
  @override
  final String? location;

  @override
  String toString() {
    return 'JobModel(jobtitle: $jobtitle, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobModelImpl &&
            (identical(other.jobtitle, jobtitle) ||
                other.jobtitle == jobtitle) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jobtitle, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobModelImplCopyWith<_$JobModelImpl> get copyWith =>
      __$$JobModelImplCopyWithImpl<_$JobModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobModelImplToJson(
      this,
    );
  }
}

abstract class _JobModel extends JobModel {
  const factory _JobModel({final String? jobtitle, final String? location}) =
      _$JobModelImpl;
  const _JobModel._() : super._();

  factory _JobModel.fromJson(Map<String, dynamic> json) =
      _$JobModelImpl.fromJson;

  @override
  String? get jobtitle;
  @override
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$JobModelImplCopyWith<_$JobModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
