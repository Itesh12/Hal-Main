import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/view/auth/widgets/signup_widgets.dart';
import 'package:kisaan_station/src/view/widget/dialogs/loading_dialog.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../global_providers.dart';
import '../../l10n/l10n.dart';

@RoutePage()
class OTPPage extends ConsumerStatefulWidget {
  const OTPPage({
    Key? key,
    required this.mobile,
    this.fromSignup = true,
    required this.smsToken,
  }) : super(key: key);
  final String mobile;
  final String smsToken;
  final bool fromSignup;

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends ConsumerState<OTPPage> {
  late String smsToken;

  @override
  void initState() {
    super.initState();
    smsToken = widget.smsToken;
  }

  final _otpFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/wlcm_screen/logoo.png',
                  height: 130.h,
                ),
                52.verticalSpace,
                Text(AppLocalizations.of(context)!.confirm_account,
                    style: textTheme.titleLarge!.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                      color: brown,
                    )),
                11.verticalSpace,
                Text(
                  AppLocalizations.of(context)!.enter_otp,
                  style: textTheme.bodyLarge!.copyWith(color: grey),
                ),
                Text("+91 ${widget.mobile}",
                    style: textTheme.titleSmall!
                        .copyWith(fontSize: 14.sp, color: deepOrange)),
                40.verticalSpace,
                Consumer(builder: (context, ref, child) {
                  final otp =
                      ref.watch(otpController.select((value) => value.otp));
                  return Center(
                    child: SizedBox(
                      width: 288,
                      height: 60,
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < 4; i++) const OTPBox(),
                            ],
                          ),
                          SizedBox(
                            width: 288,
                            height: 60,
                            child: PinFieldAutoFill(
                              autoFocus: true,
                              decoration: BoxLooseDecoration(
                                strokeWidth: 3,
                                gapSpace: 10,
                                hintText: '----',
                                hintTextStyle:
                                    TextStyle(fontSize: 40.sp, color: primary),
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: primary,
                                    fontWeight: FontWeight.w700),
                                bgColorBuilder:
                                    const FixedColorBuilder(Colors.white),
                                strokeColorBuilder:
                                    const FixedColorBuilder(white),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              currentCode: otp,
                              focusNode: _otpFocus,
                              codeLength: 4,
                              onCodeChanged: (code) {
                                ref.read(otpController.notifier).setOtp(code!);

                                if(code.length == 4){
                                  _otpFocus.nextFocus();

                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                Consumer(builder: (context, ref, child) {
                  final timeUp =
                      ref.watch(otpController.select((value) => value.timeUp));
                  return Row(
                    children: [
                      TextButton(
                        onPressed: timeUp == 0
                            ? () async {
                                final res = await ref
                                    .read(otpController.notifier)
                                    .resend(
                                      context: context,
                                      fromSignup: widget.fromSignup,
                                      mobileNo: widget.mobile,
                                    );
                                if (res != null) {
                                  smsToken = res;
                                }
                              }
                            : null,
                        child: Text(
                          AppLocalizations.of(context)!.resend,
                          style: textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: timeUp == 0 ? primary : grey,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        timeUp == 30
                            ? '30 sec'
                            : '${timeUp.toString().padLeft(2, '0')} sec',
                        style: const TextStyle(
                          fontSize: 12,
                          color: grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  );
                }),
                const Spacer(),
                Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          String? fcmToken;
                           try{
                            showLoading(context);
                            if(Platform.isAndroid){
                              fcmToken = await FirebaseMessaging.instance.getToken();
                            }
                            else{
                              fcmToken = await FirebaseMessaging.instance.getAPNSToken();
                            }
                          } catch(e){
                            debugPrint(e.toString());
                          }
                          
                          if(fcmToken!=null){
                            Navigator.pop(context);
                            ref.read(otpController.notifier).continueOtp(
                                context: context,
                                mobile: widget.mobile,
                                fromSignup: widget.fromSignup,
                                fcmToken: fcmToken.toString(),
                                smsToken: smsToken);
                          }
                          else{
                            Navigator.pop(context);
                            showDialog(context: context, builder: (context){
                              return Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('Token Retrieval Failed.',style: TextStyle(color: primary,fontSize: 16,fontWeight: FontWeight.w600)),
                                      const Text('Please connect to High Speed Internet Connection. Restart the Application to Login.', textAlign: TextAlign.center,),
                                      15.verticalSpace,
                                      ElevatedButton(onPressed: (){
                                        context.router.pop();
                                        context.router.pop();

                                      }, child: const Text('Go Back'))



                                    ],
                                  ),
                                ),
                              );
                            });

                          }

                        },
                        child: Text(AppLocalizations.of(context)!.verify))),
                72.verticalSpace,
                const PrivacyPolicy(),
                20.verticalSpace,
              ],
            ),
          )),
    );
  }
}

class OTPBox extends StatelessWidget {
  const OTPBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              color: Color(0x75E26B26),
              blurRadius: 25,
              spreadRadius: -9,
            ),
          ]),
        ),
      ),
    );
  }
}
