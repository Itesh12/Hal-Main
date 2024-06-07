import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_details_model.freezed.dart';
part 'job_details_model.g.dart';

@freezed
class JobDetailsModel with _$JobDetailsModel {
  const factory JobDetailsModel({
    String? jobtitle,
    String? location,
    String? jobType,
    String? job,
    String? joinbydate,
    String? jobDescription,
  }) = _JobDetailsModel;

  const JobDetailsModel._();

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$JobDetailsModelFromJson(json);
}
