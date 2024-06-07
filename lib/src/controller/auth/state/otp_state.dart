import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

@freezed
class OTPState with _$OTPState {
  const factory OTPState({
    @Default(30) int? timeUp,
    @Default("") String otp
  }) =
      _OTPState;
}
