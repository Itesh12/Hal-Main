// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobDetailsModelImpl _$$JobDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JobDetailsModelImpl(
      jobtitle: json['jobtitle'] as String?,
      location: json['location'] as String?,
      jobType: json['jobType'] as String?,
      job: json['job'] as String?,
      joinbydate: json['joinbydate'] as String?,
      jobDescription: json['jobDescription'] as String?,
    );

Map<String, dynamic> _$$JobDetailsModelImplToJson(
        _$JobDetailsModelImpl instance) =>
    <String, dynamic>{
      'jobtitle': instance.jobtitle,
      'location': instance.location,
      'jobType': instance.jobType,
      'job': instance.job,
      'joinbydate': instance.joinbydate,
      'jobDescription': instance.jobDescription,
    };
