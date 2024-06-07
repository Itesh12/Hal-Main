import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../global_providers.dart';
import '../../../model/registration/registration_form_model.dart';
import '../../../util/services/shared_preferences.dart';
import '../state/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref) : super(const AuthState.signOut()) {
    _initState();
  }

  final Ref ref;

  void _initState() {
    state = UserPreferences.authToken.isNotEmpty
        ? const AuthState.signIn()
        : const AuthState.signOut();
  }

  Future<String?> signup(String mobileNo) async {
    return ref.read(authProvider).signup(mobileNo);
  }

  Future<String?> login(String mobileNo) async {
    return ref.read(authProvider).login(mobileNo);
  }

  Future<void> signupVerifyOTP({
    required String mobileNo,
    required String otp,
    required String smstoken,
    required String fcmToken
  }) async {
    final authRes = await ref.read(authProvider).signupVerifyOTP(
        mobileNo: mobileNo, otp: otp, smstoken: smstoken, fcm_token: fcmToken);

    if (authRes.isNotEmpty) {
      await UserPreferences.setUser(
        mobileNo: mobileNo,
        userId: authRes.first.userId,
        authToken: authRes.first.authToken,
        hasDcAccess: authRes.first.hasDcAccess
      );
      state = const AuthState.signIn();
    }
  }

  Future<void> loginVerifyOTP({
    required String mobileNo,
    required String otp,
    required String smstoken,
    required String fcmToken
  }) async {
    final res = await ref.read(authProvider).loginVerifyOTP(
        mobileNo: mobileNo, otp: otp, smstoken: smstoken, fcm_token: fcmToken);
    if (res != null) {
      await UserPreferences.setUser(
        mobileNo: mobileNo,
        userId: res.userId,
        authToken: res.authToken,
        hasDcAccess: res.hasDcAccess
      );
      await UserPreferences.setRegistered(
        registered: res.hasRegistered ?? false,
      );
      state = const AuthState.signIn();
    }
  }

  Future<void> setProfilePic(File? image) async {
    await ref.read(authProvider).setProfileImage(image);
  }

  Future<void> registrationForm(
      {required RegistrationFormModel user, File? image}) async {
    await ref.read(authProvider).registrationForm(user: user, image: image);
  }

  Future<bool> checkReferral(String referralCode) async {
    return ref.read(authProvider).checkReferral(referralCode);
  }

  Future<List<dynamic>> getUsernameSuggestions({required String name}) async {
    List<dynamic> _nameList = [];
    _nameList = await ref.read(authProvider).getUsernameSuggestions(name: name);
    return _nameList;
  }

  Future<void> logout() async {
    await FirebaseMessaging.instance.deleteToken();
    await UserPreferences.removeUser();
    state = const AuthState.signOut();
  }
}
