import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../infrastructure/http/app_exception.dart';
import '../../../util/services/shared_preferences.dart';
import '../../../view/widget/dialogs/loading_dialog.dart';
import '../../../view/widget/snackbar.dart';
import '../state/otp_state.dart';

class OtpController extends StateNotifier<OTPState> {
  OtpController(this.ref) : super(const OTPState()) {
    _initTimer();
  }

  final Ref ref;

  late Timer _timer;

  void _initTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeUp! > 0) {
        state = state.copyWith(timeUp: state.timeUp! - 1);
      } else {
        timer.cancel();
      }
    });
  }

  void setOtp(String otp) {
    state = state.copyWith(otp: otp);
    SmsAutoFill().listenForCode();
  }

  Future<String?> resend(
      {required String mobileNo,
      required bool fromSignup,
      required BuildContext context}) async {
    String? token;
    try {
      if (fromSignup) {
        token = await ref.read(authController.notifier).signup(mobileNo);
      } else {
        token = await ref.read(authController.notifier).login(mobileNo);
      }
      state = state.copyWith(timeUp: 30);
    } on AppException catch (e) {
      e.whenOrNull(
        connectivity: () {
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar("Please check your internet connection"));
        },
        errorWithMessage: (message) {
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(message));
        },
        error: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(getSnackBar("Something went wrong"));
        },
      );
    }
    _initTimer();
    return token;
  }

  @override
  void dispose() {
    _timer.cancel();
    SmsAutoFill().listenForCode();
    super.dispose();
  }

  Future<void> mobileOTPLogin(
      {required BuildContext context,
      required String mobileNo,
      required String smsToken,
      required bool fromSignup,
        required String fcmToken,
      required String otp}) async {
    try {
      showLoading(context);
      if (fromSignup) {
        await ref
            .read(authController.notifier)
            .signupVerifyOTP(mobileNo: mobileNo, otp: otp, smstoken: smsToken, fcmToken: fcmToken);
        Navigator.pop(context);
        context.router.replaceAll([const RegistrationRoute()]);
      } else {
        await ref
            .read(authController.notifier)
            .loginVerifyOTP(mobileNo: mobileNo, otp: otp, smstoken: smsToken, fcmToken: fcmToken);
        Navigator.pop(context);

        final bool hasRegistered = UserPreferences.hasRegistered;

        if (!hasRegistered) {
          context.router.replaceAll([const RegistrationRoute()]);
        } else {
          context.router.replaceAll([const KisaanHomeRoute()]);
        }
      }
    } on AppException catch (e) {
      e.whenOrNull(
        connectivity: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar("Please check your internet connection"));
        },
        errorWithMessage: (message) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(message));
        },
        error: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(getSnackBar("Something went wrong"));
        },
      );
    }
  }

  void continueOtp(
      {required BuildContext context,
      required String mobile,
      required bool fromSignup,
        required String fcmToken,
      required String smsToken}) {
    if (state.otp.length == 4) {
      mobileOTPLogin(
          context: context,
          mobileNo: mobile,
          otp: state.otp,
          fcmToken: fcmToken,
          fromSignup: fromSignup,
          smsToken: smsToken);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(getSnackBar("Please Enter a Valid OTP."));
    }
  }
}
