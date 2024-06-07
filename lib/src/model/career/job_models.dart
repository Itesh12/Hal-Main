import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_models.freezed.dart';
part 'job_models.g.dart';

@freezed
class JobModel with _$JobModel {
  const factory JobModel({String? jobtitle, String? location}) = _JobModel;

  const JobModel._();

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}
