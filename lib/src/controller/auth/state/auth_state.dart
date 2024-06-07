import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.signIn() = _SignedIn;
  const factory AuthState.signOut() = _SignOut;
}
