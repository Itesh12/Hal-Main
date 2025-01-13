import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/l10n/l10n.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../constants/page_padding.dart';
import '../../../infrastructure/http/app_exception.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../widget/dialogs/loading_dialog.dart';
import '../../widget/snackbar.dart';

class SignUpCommon extends StatefulWidget {
  const SignUpCommon({
    Key? key,
    required this.title,
    required this.textButton,
    required this.beforeButton,
    this.fromSignUp = true,
  }) : super(key: key);

  final bool fromSignUp;
  final String title;
  final String textButton;
  final String beforeButton;

  @override
  State<SignUpCommon> createState() => _SignUpCommonState();
}

class _SignUpCommonState extends State<SignUpCommon> {
  String mobile = '';

  Future<void> initOTP() async {
    await SmsAutoFill().listenForCode();
  }

  final _phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final fromSignUp = widget.fromSignUp;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: [
            // Transform(
            //   transform:
            //       Matrix4.rotationY((-2) * math.pi / (fromSignUp ? 2 : 1)),
            //   alignment: Alignment.center,
            //   child: Image.asset(
            //     'assets/images/auth_image/Frame.png',
            //     fit: BoxFit.fill,
            //   ),
            // ),
            if (fromSignUp)
              Image.asset(
                'assets/images/auth_image/Frame2.png',
                fit: BoxFit.fill,
              )
            else
              Image.asset(
                'assets/images/auth_image/Frame.png',
                fit: BoxFit.fill,
              ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: pagePadding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,
                            style: textTheme.headlineLarge!
                                .copyWith(fontWeight: FontWeight.w800)),
                        16.verticalSpace,
                        Text(AppLocalizations.of(context)!.phone_number,
                            style: textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w500)),
                        5.verticalSpace,
                        TextFormField(
                          focusNode: _phoneFocus,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: mediumOrange,
                          ),
                          decoration: InputDecoration(
                              prefixText: '+91- ',
                              prefixStyle: TextStyle(
                                fontSize: 14.sp,
                                color: mediumOrange,
                              ),
                              fillColor: const Color(0XFFF4F4F4),
                              filled: true,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide.none,
                              )),
                          onChanged: (val) {
                            mobile = val;

                            if (val.length == 10) {
                              _phoneFocus.nextFocus();
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => Validate.phone(value!),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        14.verticalSpace,
                        Row(
                          children: [
                            Text(
                              widget.beforeButton,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w500, color: grey),
                            ),
                            InkWell(
                                onTap: () {
                                  context.router.replace(fromSignUp
                                      ? const SignInRoute()
                                      : const SignUpRoute());
                                },
                                child: Text(widget.textButton,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primary,
                                    )))
                          ],
                        )
                      ],
                    ),
                  ),
                  // const Spacer(),
                  20.verticalSpace,
                  Consumer(builder: (context, ref, child) {
                    return ElevatedButton(
                        onPressed: () async {
                          if (mobile.isNotEmpty) {
                            try {
                              initOTP();
                              showLoading(context);
                              String? smsToken;
                              if (fromSignUp) {
                                smsToken = await ref
                                    .read(authController.notifier)
                                    .signup(mobile.trim());
                              } else {
                                smsToken = await ref
                                    .read(authController.notifier)
                                    .login(mobile.trim());
                              }

                              Navigator.pop(context);

                              if (smsToken != null) {
                                context.pushRoute(OTPRoute(
                                    mobile: mobile,
                                    fromSignup: fromSignUp,
                                    smsToken: smsToken));
                              }
                            } on AppException catch (e) {
                              e.whenOrNull(
                                connectivity: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      getSnackBar(
                                          "Please check your internet connection"));
                                },
                                errorWithMessage: (message) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(getSnackBar(message));
                                },
                                error: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      getSnackBar("Something went wrong"));
                                },
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
                                "Please Enter a valid Mobile no. before continuing "));
                          }
                        },
                        child: Text(fromSignUp
                            ? context.l10n.continues
                            : context.l10n.login));
                  }),
                  72.verticalSpace,
                  const PrivacyPolicy(),
                  20.verticalSpace,
                  Image.asset(
                    'assets/images/droneacharya_logo.png',
                    height: 130.h,
                    width: 200.w,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: SizedBox(
        width: 230.w,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'By continuing you agree to the ',
            style: textTheme.bodyLarge!.copyWith(
              color: grey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ' terms & conditions',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pushRoute(WebRoute(
                          url: "https://ojasspace.com",
                          title: "Terms And Condition"));
                    },
                  style: const TextStyle(color: mediumOrange)),
              const TextSpan(text: ' and'),
              TextSpan(
                  text: ' privacy policies',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pushRoute(WebRoute(
                          url: "https://ojasspace.com/privacy-policy",
                          title: "PrivacyPolicies"));
                    },
                  style: const TextStyle(color: mediumOrange)),
            ],
          ),
        ),
      ),
    );
  }
}
