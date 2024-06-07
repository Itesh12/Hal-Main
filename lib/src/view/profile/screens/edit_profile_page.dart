import 'package:auto_route/auto_route.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/util/text_validation/text_format.dart';
import 'package:kisaan_station/src/view/profile/widgets/editProfile_textField.dart';

import '../../../constants/colors.dart';
import '../../../infrastructure/http/app_exception.dart';
import '../../../model/user/profile_update_model.dart';
import '../../../util/image_picker/image_picker.dart';

import '../../../util/text_validation/text_validation.dart';
import '../../widget/snackbar.dart';

@RoutePage()
class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _bioEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _stateEditingController = TextEditingController();
  final TextEditingController _areaEditingController = TextEditingController();
  final TextEditingController _districtEditingController =
      TextEditingController();
  final TextEditingController _pinCodeEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? image;
  bool keepImage = true;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await updateProfile(context);
                }
              },
              icon: const Icon(
                Icons.check,
                color: deepOrange,
              ))
        ],
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 20.sp,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final user = ref.read(userController(UserPreferences.userId)).value;
        if (user != null) {
          _nameEditingController.text = user.name;
          _bioEditingController.text = user.description ?? '';
          _areaEditingController.text = user.address.area;
          _stateEditingController.text = user.address.state;
          _districtEditingController.text = user.address.district;
          _pinCodeEditingController.text = user.address.pinCode;
          _userNameEditingController.text = user.username;
        }
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: pagePadding,
                child: Column(
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
                            child: image == null
                                ? Container(
                                    margin: EdgeInsets.all(20.w),
                                    height: 157.w,
                                    width: 157.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 4),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(4, 4),
                                          color: Color(0x17883302),
                                          spreadRadius: 4,
                                          blurRadius: 12,
                                        ),
                                      ],
                                      image:
                                          user!.profilePic != null && keepImage
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      user.profilePic!),
                                                  fit: BoxFit.cover,
                                                )
                                              : const DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/profile_b.png',
                                                  ),
                                                ),
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.all(20.w),
                                    height: 157.w,
                                    width: 157.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 4),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(4, 4),
                                            color: Color(0x17883302),
                                            spreadRadius: 4,
                                            blurRadius: 12,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: FileImage(image!),
                                          fit: BoxFit.cover,
                                        )
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
                    14.verticalSpace,
                    InkWell(
                      onTap: () {

                        // image!.delete();
                        image = null;
                        // image.
                        setState(() {
                          keepImage = false;
                        });
                      },
                      child: Text(
                        'Remove Profile Pic',
                        style: TextStyle(color: primary, fontSize: 12.sp),
                      ),
                    ),
                    26.verticalSpace,
                    EditProfileTextFields(
                        validator: (value) =>
                            Validate.minLength(value: value!, minLen: 3),
                        labelText: 'Name',
                        textEditingController: _nameEditingController),
                    16.verticalSpace,
                    EditProfileTextFields(
                        labelText: 'Bio',
                        textEditingController: _bioEditingController),

                    // EditProfileTextFields(
                    //     textEditingController: _districtEditingController),
                    16.verticalSpace,
                    Column(
                      children: [
                        EditProfileTextFields(
                            readonly: true,
                            validator: (value) =>
                                Validate.minLength(value: value!, minLen: 3),
                            labelText: 'Area',
                            textEditingController: _areaEditingController),
                        20.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: EditProfileTextFields(
                                  readonly: true,
                                  validator: (value) => Validate.minLength(
                                      value: value!, minLen: 3),
                                  labelText: 'State',
                                  textEditingController:
                                      _stateEditingController),
                            ),
                            20.horizontalSpace,
                            Expanded(
                              child: EditProfileTextFields(
                                  readonly: true,
                                  validator: (value) => Validate.minLength(
                                      value: value!, minLen: 3),
                                  labelText: 'District',
                                  textEditingController:
                                      _districtEditingController),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        EditProfileTextFields(
                            readonly: true,
                            validator: (value) =>
                                Validate.minLength(value: value!, minLen: 6),
                            labelText: 'Pincode',
                            textEditingController: _pinCodeEditingController),
                        20.verticalSpace,
                      ],
                    ),
                    // EditProfileTextFields(
                    //     textEditingController: _locationEditingController),
                    70.verticalSpace,
                    // ElevatedButton(
                    //     onPressed: () async {
                    //       if(_formKey.currentState!.validate())
                    //       await updateProfile(context);
                    //     },
                    //
                    //     child: const Text('Save')),
                    54.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<void> updateProfile(BuildContext context) async {
    final ProfileUpdateRepoModel _updateProfile = ProfileUpdateRepoModel(
      userId: UserPreferences.userId,
      name: _nameEditingController.text == ''
          ? null
          : _nameEditingController.text.trim().toTitleCase(),
      username: _userNameEditingController.text == ''
          ? null
          : _userNameEditingController.text.trim(),
      state: _stateEditingController.text == ''
          ? null
          : _stateEditingController.text.trim().toTitleCase(),
      district: _districtEditingController.text == ''
          ? null
          : _districtEditingController.text.trim().toTitleCase(),
      description:
          _bioEditingController.text == '' ? null : _bioEditingController.text,
      pinCode: _pinCodeEditingController.text == ''
          ? null
          : _pinCodeEditingController.text,
      area: _areaEditingController.text == ''
          ? null
          : _areaEditingController.text.trim().toTitleCase(),
      latitude: 19.07,
      longitude: 72.87,
    );
    final ProfileUpdateRepoModel _updateProfileWithoutProfilePic =
        ProfileUpdateRepoModel(
            userId: UserPreferences.userId,
            name: _nameEditingController.text == ''
                ? null
                : _nameEditingController.text.trim().toTitleCase(),
            username: _userNameEditingController.text == ''
                ? null
                : _userNameEditingController.text.trim(),
            state: _stateEditingController.text == ''
                ? null
                : _stateEditingController.text.trim().toTitleCase(),
            district: _districtEditingController.text == ''
                ? null
                : _districtEditingController.text.trim().toTitleCase(),
            description: _bioEditingController.text == ''
                ? null
                : _bioEditingController.text,
            pinCode: _pinCodeEditingController.text == ''
                ? null
                : _pinCodeEditingController.text,
            area: _areaEditingController.text == ''
                ? null
                : _areaEditingController.text.trim().toTitleCase(),
            latitude: 19.07,
            longitude: 72.87,
            keepImage: keepImage);

    try {
      if (image != null) {
        await ref
            .read(userController(UserPreferences.userId).notifier)
            .updateProfile(context, user: _updateProfile, image: image);
      } else if (!keepImage) {
        await ref
            .read(userController(UserPreferences.userId).notifier)
            .updateProfile(
              context,
              user: _updateProfileWithoutProfilePic,
            );
      } else {
        await ref
            .read(userController(UserPreferences.userId).notifier)
            .updateProfile(
              context,
              user: _updateProfileWithoutProfilePic,
            );
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
}
