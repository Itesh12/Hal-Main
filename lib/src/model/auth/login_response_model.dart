import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    String? userId,
    String? message,
    String? authToken,
    bool? hasRegistered,
    List<String>? hasDcAccess,
    String? fcm_token,
  }) = _LoginResponse;

  const LoginResponse._();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
