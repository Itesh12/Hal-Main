import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/model/registration/registration_form_model.dart';
import 'package:kisaan_station/src/util/text_validation/text_format.dart';
import 'package:kisaan_station/src/view/widget/textfield_widget.dart';

import '../../../../../global_providers.dart';
import '../../../../infrastructure/http/app_exception.dart';
import '../../../../l10n/l10n.dart';
import '../../../../util/image_picker/image_picker.dart';
import '../../../../util/services/shared_preferences.dart';
import '../../../../util/text_validation/text_validation.dart';
import '../../../widget/dialogs/loading_dialog.dart';
import '../../../widget/snackbar.dart';
import '../widgets/addressFields.dart';

@RoutePage()
class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _stateTextController = TextEditingController();
  final TextEditingController _districtTextController = TextEditingController();
  final TextEditingController _pincodeTextController = TextEditingController();
  final TextEditingController _areaTextController = TextEditingController();
  // final TextEditingController _referralcodeTextController =
  //     TextEditingController();

  final _formKey = GlobalKey<FormState>();
  List<dynamic> _suggestedUser = [];
  bool valid = true;

  File? image;
  double? lat;
  double? long;

  Future<void> pickImage() async {
    final source = await ref.read(mediaProvider).chooseSource(context);

    if (source != null) {
      File? output;
      if (source) {
        output = await ref.read(mediaProvider).captureMedia();
      } else {
        output = await ref.read(mediaProvider).pickImage();
      }

      if (output != null) {
        setState(() {
          image = output;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // _referralcodeTextController.text = UserPreferences.referral;
    setState(() {});
    // simply use this
    Timer.run(() {
      askLocationPermissionDialog();
    });
  }

  void askLocationPermissionDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 400),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.location_access,
                style: TextStyle(
                    fontSize: 20.sp, color: brown, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Image.asset(
                'assets/images/location.png',
                height: 136,
              ),
              const Spacer(),
              Text(
                AppLocalizations.of(context)!.enable_precise_location,
                style: const TextStyle(
                    color: mediumOrange, fontWeight: FontWeight.w700),
              ),
              8.verticalSpace,
              SizedBox(
                  width: 231,
                  child: Text(
                    AppLocalizations.of(context)!.personalised_information,
                    style: TextStyle(fontSize: 10.sp, color: grey),
                    textAlign: TextAlign.center,
                  )),
              21.verticalSpace,
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  final postion =
                      await ref.read(locationProvider).getLocation();
                  if (postion != null) {
                    lat = postion.latitude;
                    long = postion.longitude;
                    ref.read(addressProvider.notifier).getAddress(postion);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        getSnackBar("Location permission denied.\n"
                            "Please enable it in app settings."));
                  }
                },
                child: Text(AppLocalizations.of(context)!.allow),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding: pagePadding,
            children: [
              Center(
                child: Stack(
                  children: [
                    InkWell(
                      onTap: image == null
                          ? null
                          : () {
                              pickImage();
                            },
                      child: Container(
                        margin: EdgeInsets.all(20.w),
                        height: 157.w,
                        width: 157.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(4, 4),
                              color: Color(0x17883302),
                              spreadRadius: 4,
                              blurRadius: 12,
                            ),
                          ],
                          image: image != null
                              ? DecorationImage(
                                  image: FileImage(
                                    image!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/profile_b.png',
                                  ),
                                ),
                        ),
                      ),
                    ),
                    if (image == null)
                      Positioned(
                          bottom: 28.h,
                          right: 24.w,
                          child: InkWell(
                            onTap: () {
                              pickImage();
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: SvgPicture.asset(
                              'assets/images/camera.svg',
                              height: 50,
                            ),
                          )),
                  ],
                ),
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.registration,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context)!.name,
                  children: const [
                    TextSpan(
                      text: " *",
                      style: TextStyle(fontSize: 12, color: primary),
                    ),
                  ],
                  style: const TextStyle(
                    fontSize: 12,
                    color: brown,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              7.verticalSpace,
              AppTextField(
                textController: _nameTextController,
                hintText: AppLocalizations.of(context)!.enter_your_name,
                maxlines: 1,
                textCapitalization: TextCapitalization.words,
                validator: (value) =>
                    Validate.minLength(value: value!, minLen: 3),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
              ),
              20.verticalSpace,
              RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context)!.user_name,
                  children: const [
                    TextSpan(
                      text: " *",
                      style: TextStyle(fontSize: 12, color: primary),
                    ),
                  ],
                  style: const TextStyle(
                    fontSize: 12,
                    color: brown,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              7.verticalSpace,
              Consumer(builder: (context, ref, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      onChanged: (text) async {
                        if (text.length > 3) {
                          await getSuggestion(text);
                        }
                      },
                      textController: _usernameTextController,
                      hintText:
                          AppLocalizations.of(context)!.enter_your_user_name,
                      maxlines: 1,
                      errorText: _suggestedUser.isNotEmpty
                          ? AppLocalizations.of(context)!.username_already_taken
                          : null,
                      validator: (value) =>
                          Validate.minLength(value: value!, minLen: 2),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(24),
                      ],
                    ),
                    5.verticalSpace,
                    if (_suggestedUser.isNotEmpty)
                      SizedBox(
                        height: 20.h,
                        width: 375,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 15.w,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _suggestedUser.length,
                          itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  _usernameTextController.text =
                                      _suggestedUser[index].toString();
                                  _suggestedUser.clear();
                                });
                              },
                              child: Text(
                                _suggestedUser[index],
                                style: const TextStyle(color: primary),
                              )),
                        ),
                      ),
                  ],
                );
              }),
              25.verticalSpace,
              AddressTextFields(
                areaTextController: _areaTextController,
                stateTextController: _stateTextController,
                districtTextController: _districtTextController,
                pincodeTextController: _pincodeTextController,
              ),
              // RichText(
              //   text: TextSpan(
              //     text: AppLocalizations.of(context)!.referal_code,
              //     children: [
              //       TextSpan(
              //         text: "    (${AppLocalizations.of(context)!.optional})",
              //         style: const TextStyle(fontSize: 10, color: lightGrey),
              //       ),
              //     ],
              //     style: const TextStyle(
              //       fontSize: 12,
              //       color: brown,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              // 7.verticalSpace,
              // AppTextField(
              //   onChanged: (text) async {
              //     await checkReferralValidation(text);
              //   },
              //   textController: _referralcodeTextController,
              //   hintText: AppLocalizations.of(context)!.enter_your_code_here,
              //   maxlines: 1,
              //   errorText: valid
              //       ? null
              //       : AppLocalizations.of(context)!.invalid_referral,
              // ),
              // 25.verticalSpace,
              ElevatedButton(
                  onPressed: register,
                  child: Text(AppLocalizations.of(context)!.register)),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getSuggestion(String firstName) async {
    try {
      _suggestedUser = await ref
          .read(authController.notifier)
          .getUsernameSuggestions(name: firstName);

      setState(() {});
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

  Future<void> checkReferralValidation(String referralCode) async {
    try {
      // valid =
      //     await ref.read(authController.notifier).checkReferral(referralCode) ||
      //         _referralcodeTextController.text.isEmpty;

      setState(() {});
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

  Future<void> register() async {
    if (_formKey.currentState!.validate() && _suggestedUser.isEmpty) {
      if (lat == null && long == null) {
        askLocationPermissionDialog();
      } else {
        final RegistrationFormModel _user = RegistrationFormModel(
          userId: UserPreferences.userId,
          name: _nameTextController.text.trim().toTitleCase(),
          username: _usernameTextController.text.trim(),
          state: _stateTextController.text.trim().toTitleCase(),
          district: _districtTextController.text.trim().toTitleCase(),
          pinCode: _pincodeTextController.text,
          // referralCode: _referralcodeTextController.text.isNotEmpty
          //     ? _referralcodeTextController.text
          //     : null,
          area: _areaTextController.text.trim().toTitleCase(),
          latitude: lat!,
          longitude: long!,
        );

        try {
          showLoading(context);
          debugPrint(image?.path);

          await ref
              .read(authController.notifier)
              .registrationForm(user: _user, image: image);

          await UserPreferences.setRegistered(registered: true);
          context.router.replaceAll([const KisaanHomeRoute()]);
          UserPreferences.removeReferral();
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
    }
  }
}
