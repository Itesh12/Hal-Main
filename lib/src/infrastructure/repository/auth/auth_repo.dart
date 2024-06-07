import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/model/registration/registration_form_model.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/home/widget/SellerListing_pages.dart';

import '../../../model/auth/login_response_model.dart';
import '../../http/api_provider.dart';

class AuthRepository {
  AuthRepository(this.ref);

  final Ref ref;

  Future<String?> signup(String mobileNo) async {
    String? smsToken;
    final res = await ref
        .read(apiProvider)
        .post('/signup/', body: {"mobileNo": mobileNo});

    res.when(
      success: (source) {
        smsToken = source["smsToken"];
      },
      error: (error) {
        throw error;
      },
    );
    return smsToken;
  }

  Future<String?> login(String mobileNo) async {
    String? smsToken;
    final res = await ref
        .read(apiProvider)
        .post('/login', body: {"mobileNo": mobileNo});

    res.when(
      success: (source) {
        smsToken = source["smsToken"];
      },
      error: (error) {
        throw error;
      },
    );
    return smsToken;
  }

  Future<List<UserResponse>> signupVerifyOTP({
    required String mobileNo,
    required String otp,
    required String smstoken,
    required String fcm_token,
  }) async {
    final List<UserResponse> authres = [];
    final res = await ref.read(apiProvider).post('/signup/verify/', body: {
      "mobileNo": mobileNo,
      "otp": otp,
      "smsToken": smstoken,
      "fcm_token": fcm_token
    });

    res.when(
      success: (source) {
        final data = UserResponse.fromJson(source);
        authres.add(data);
      },
      error: (error) {
        throw error;
      },
    );
    return authres;
  }

  Future<LoginResponse?> loginVerifyOTP({
    required String mobileNo,
    required String otp,
    required String smstoken,
    required String fcm_token,
  }) async {
    LoginResponse? loginResponse;
    final res = await ref.read(apiProvider).post('/login/verify/', body: {
      "mobileNo": mobileNo,
      "otp": otp,
      "smsToken": smstoken,
      "fcm_token": fcm_token
    });

    res.when(
      success: (source) {
        debugPrint(source["authToken"]);
        loginResponse = LoginResponse.fromJson(source);
      },
      error: (error) {
        throw error;
      },
    );
    return loginResponse;
  }

  Future<void> setProfileImage(File? image) async {
    final FormData formData = FormData.fromMap({
      "userId": UserPreferences.userId,
    });

    if (image != null) {
      final fileName = image.path.split('/').last;
      debugPrint('inside repo${image.path}');

      final MultipartFile formImage =
          await MultipartFile.fromFile(image.path, filename: fileName);
      formData.files.add(MapEntry("profile", formImage));
    }

    final res = await ref.read(apiProvider).post(
          '/registration/profile',
          body: formData,
          contentType: ContentType.multipart,
        );

    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }

  Future<List<dynamic>> getUsernameSuggestions({
    required String name,
  }) async {
    List<dynamic> suggestedUsername = [];
    final res = await ref
        .read(apiProvider)
        .post('/registration/username/', query: {"username": name});

    res.when(
      success: (source) {
        suggestedUsername = source['usernameSuggestion'] ?? [];
      },
      error: (error) {
        throw error;
      },
    );
    return suggestedUsername;
  }

  Future<bool> checkReferral(String referralCode) async {
    bool valid = false;
    final res = await ref.read(apiProvider).get('/registration/checkReferral/',
        query: {"referralCode": referralCode});

    res.when(
      success: (source) {
        valid = true;
      },
      error: (error) {
        valid = false;
      },
    );
    return valid;
  }

  Future<void> registrationForm(
      {required RegistrationFormModel user, File? image}) async {
    final FormData formData = FormData.fromMap(user.toJson());

    if (image != null) {
      final fileName = image.path.split('/').last;
      debugPrint('inside repo${image.path}');

      final MultipartFile formImage =
          await MultipartFile.fromFile(image.path, filename: fileName);
      formData.files.add(MapEntry("profile", formImage));
    }

    final res = await ref.read(apiProvider).post(
          '/registration/details',
          body: formData,
          contentType: ContentType.multipart,
        );

    res.when(
      success: (source) {
        debugPrint(source["message"]);
      },
      error: (error) {
        throw error;
      },
    );
  }
}



class UserResponse {
  final String userId;
  final String authToken;
  final List<String> hasDcAccess;

  UserResponse({required this.userId, required this.authToken, required this.hasDcAccess});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      userId: json['userId'],
      authToken: json['authToken'],
      hasDcAccess: List<String>.from(json['hasDcAccess']),
    );
  }
}
