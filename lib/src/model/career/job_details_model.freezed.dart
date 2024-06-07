// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobDetailsModel _$JobDetailsModelFromJson(Map<String, dynamic> json) {
  return _JobDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$JobDetailsModel {
  String? get jobtitle => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get jobType => throw _privateConstructorUsedError;
  String? get job => throw _privateConstructorUsedError;
  String? get joinbydate => throw _privateConstructorUsedError;
  String? get jobDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobDetailsModelCopyWith<JobDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobDetailsModelCopyWith<$Res> {
  factory $JobDetailsModelCopyWith(
          JobDetailsModel value, $Res Function(JobDetailsModel) then) =
      _$JobDetailsModelCopyWithImpl<$Res, JobDetailsModel>;
  @useResult
  $Res call(
      {String? jobtitle,
      String? location,
      String? jobType,
      String? job,
      String? joinbydate,
      String? jobDescription});
}

/// @nodoc
class _$JobDetailsModelCopyWithImpl<$Res, $Val extends JobDetailsModel>
    implements $JobDetailsModelCopyWith<$Res> {
  _$JobDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobtitle = freezed,
    Object? location = freezed,
    Object? jobType = freezed,
    Object? job = freezed,
    Object? joinbydate = freezed,
    Object? jobDescription = freezed,
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
      jobType: freezed == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      joinbydate: freezed == joinbydate
          ? _value.joinbydate
          : joinbydate // ignore: cast_nullable_to_non_nullable
              as String?,
      jobDescription: freezed == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobDetailsModelImplCopyWith<$Res>
    implements $JobDetailsModelCopyWith<$Res> {
  factory _$$JobDetailsModelImplCopyWith(_$JobDetailsModelImpl value,
          $Res Function(_$JobDetailsModelImpl) then) =
      __$$JobDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? jobtitle,
      String? location,
      String? jobType,
      String? job,
      String? joinbydate,
      String? jobDescription});
}

/// @nodoc
class __$$JobDetailsModelImplCopyWithImpl<$Res>
    extends _$JobDetailsModelCopyWithImpl<$Res, _$JobDetailsModelImpl>
    implements _$$JobDetailsModelImplCopyWith<$Res> {
  __$$JobDetailsModelImplCopyWithImpl(
      _$JobDetailsModelImpl _value, $Res Function(_$JobDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobtitle = freezed,
    Object? location = freezed,
    Object? jobType = freezed,
    Object? job = freezed,
    Object? joinbydate = freezed,
    Object? jobDescription = freezed,
  }) {
    return _then(_$JobDetailsModelImpl(
      jobtitle: freezed == jobtitle
          ? _value.jobtitle
          : jobtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      jobType: freezed == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      joinbydate: freezed == joinbydate
          ? _value.joinbydate
          : joinbydate // ignore: cast_nullable_to_non_nullable
              as String?,
      jobDescription: freezed == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobDetailsModelImpl extends _JobDetailsModel {
  const _$JobDetailsModelImpl(
      {this.jobtitle,
      this.location,
      this.jobType,
      this.job,
      this.joinbydate,
      this.jobDescription})
      : super._();

  factory _$JobDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobDetailsModelImplFromJson(json);

  @override
  final String? jobtitle;
  @override
  final String? location;
  @override
  final String? jobType;
  @override
  final String? job;
  @override
  final String? joinbydate;
  @override
  final String? jobDescription;

  @override
  String toString() {
    return 'JobDetailsModel(jobtitle: $jobtitle, location: $location, jobType: $jobType, job: $job, joinbydate: $joinbydate, jobDescription: $jobDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobDetailsModelImpl &&
            (identical(other.jobtitle, jobtitle) ||
                other.jobtitle == jobtitle) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.joinbydate, joinbydate) ||
                other.joinbydate == joinbydate) &&
            (identical(other.jobDescription, jobDescription) ||
                other.jobDescription == jobDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jobtitle, location, jobType, job,
      joinbydate, jobDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobDetailsModelImplCopyWith<_$JobDetailsModelImpl> get copyWith =>
      __$$JobDetailsModelImplCopyWithImpl<_$JobDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _JobDetailsModel extends JobDetailsModel {
  const factory _JobDetailsModel(
      {final String? jobtitle,
      final String? location,
      final String? jobType,
      final String? job,
      final String? joinbydate,
      final String? jobDescription}) = _$JobDetailsModelImpl;
  const _JobDetailsModel._() : super._();

  factory _JobDetailsModel.fromJson(Map<String, dynamic> json) =
      _$JobDetailsModelImpl.fromJson;

  @override
  String? get jobtitle;
  @override
  String? get location;
  @override
  String? get jobType;
  @override
  String? get job;
  @override
  String? get joinbydate;
  @override
  String? get jobDescription;
  @override
  @JsonKey(ignore: true)
  _$$JobDetailsModelImplCopyWith<_$JobDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
