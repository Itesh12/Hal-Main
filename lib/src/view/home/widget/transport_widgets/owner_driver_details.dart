import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/controller/station/upload_logistics_controller.dart';
import 'package:kisaan_station/src/infrastructure/repository/station/sell/upload_logistic_repo.dart';

import '../../../../../global_providers.dart';
import '../../../../constants/colors.dart';
import '../../../../model/station/logistics/sell/upload_logistics_model.dart';
import '../../../../util/text_validation/text_validation.dart';
import '../../../widget/textfield_widget.dart';

enum Gender { male, female, other, select }

class DriverDetails extends ConsumerStatefulWidget {
  const DriverDetails({
    super.key,
  });

  @override
  ConsumerState<DriverDetails> createState() => _DriverDetailsState();
}

class _DriverDetailsState extends ConsumerState<DriverDetails> {
  bool sameDriverDetail = false;

  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _ownerNumberController = TextEditingController();
  final TextEditingController _ownerEmailController = TextEditingController();
  Gender _ownerGender = Gender.select;

  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _driverNumberController = TextEditingController();
  final TextEditingController _driverEmailController = TextEditingController();
  Gender _driverGender = Gender.select;

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    final driverDetails = ref.read(logisticsDriverDetailProvider);
    final ownerDetails = ref.read(logisticsOwnerDetailProvider);

    _driverNameController.text = driverDetails?.name ?? "";
    _driverEmailController.text = driverDetails?.emailId ?? "";
    _driverNumberController.text = driverDetails?.mobileNo ?? "";

    _ownerNameController.text = ownerDetails?.name ?? "";
    _ownerEmailController.text = ownerDetails?.emailId ?? "";
    _ownerNumberController.text = ownerDetails?.mobileNo ?? "";

    _driverGender = genderToString(driverDetails?.gender ?? "");
    _ownerGender = genderToString(ownerDetails?.gender ?? "");


    super.initState();
  }

  Gender genderToString(String value){
    if(value == 'male'){
      return Gender.male;
    }
    else if(value == 'female'){
      return Gender.female;
    }
    else if(value == 'other'){
      return Gender.other;
    }
    else{
      return Gender.select;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formKey,
          child: Expanded(
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                const Text('Vehicle Owner Details',
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                const Text('Owner Name',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Owner Name',
                  textController: _ownerNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      Validate.minLength(value: value!, minLen: 3),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Mobile No.',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter mobile no.',
                  textController: _ownerNumberController,
                  keyboardType: TextInputType.number,
                  validator: (value) => Validate.phone(value!),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                10.verticalSpace,
                const Text('Email Id',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter email id',
                  textController: _ownerEmailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validate.email(value!),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Gender',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Radio(
                        value: Gender.male,
                        groupValue: _ownerGender,
                        onChanged: (value) {
                          setState(() {
                            _ownerGender = Gender.male;
                          });
                        }),
                    const Text('Male'),
                    Radio(
                        value: Gender.female,
                        groupValue: _driverGender,
                        onChanged: (value) {
                          setState(() {
                            _ownerGender = Gender.female;
                          });
                        }),
                    const Text('Female'),
                    Radio(
                        value: Gender.other,
                        groupValue: _driverGender,
                        onChanged: (value) {
                          setState(() {
                            _ownerGender = Gender.other;
                          });
                        }),
                    const Text('Other')
                  ],
                ),
                10.verticalSpace,
                const Text('Driver Details',
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Checkbox(
                        value: sameDriverDetail,
                        onChanged: (value) {
                          setState(() {
                            sameDriverDetail = !sameDriverDetail;
                            if (sameDriverDetail) {
                              _driverNameController.text =
                                  _ownerNameController.text;
                              _driverNumberController.text =
                                  _ownerNumberController.text;
                              _driverEmailController.text =
                                  _ownerEmailController.text;
                              _driverGender = _ownerGender;
                            } else {
                              _driverEmailController.clear();
                              _driverNumberController.clear();
                              _driverNameController.clear();
                              _driverGender = Gender.select;
                            }
                          });
                        }),
                    const Text('Same as owner details')
                  ],
                ),
                const Text('Driver Name',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Driver Name',
                  textController: _driverNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      Validate.minLength(value: value!, minLen: 3),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Mobile No.',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter mobile no.',
                  textController: _driverNumberController,
                  validator: (value) => Validate.phone(value!),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                10.verticalSpace,
                const Text('Email Id',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter email id',
                  textController: _driverEmailController,
                  validator: (value) => Validate.email(value!),
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                ),
                10.verticalSpace,
                const Text('Gender',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Radio(
                        value: Gender.male,
                        groupValue: _driverGender,
                        onChanged: (value) {
                          setState(() {
                            _driverGender = Gender.male;
                          });
                        }),
                    const Text('Male'),
                    Radio(
                        value: Gender.female,
                        groupValue: _driverGender,
                        onChanged: (value) {
                          setState(() {
                            _driverGender = Gender.female;
                          });
                        }),
                    const Text('Female'),
                    Radio(
                        value: Gender.other,
                        groupValue: _driverGender,
                        onChanged: (value) {
                          setState(() {
                            _driverGender = Gender.other;
                          });
                        }),
                    const Text('Other')
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: ElevatedButton(
              onPressed: () {
                if (_driverGender == Gender.select ||
                    _ownerGender == Gender.select) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: primary,
                      content: Text("Please select Gender.")));
                } else if (_formKey.currentState!.validate()) {
                  final driverDetails = DriverDetailsModel(
                      name: _driverNameController.text.trim(),
                      mobileNo: _driverNumberController.text.trim(),
                      emailId: _driverEmailController.text.trim(),
                      gender: _driverGender.name);
                  final ownerDetails = OwnerDetailsModel(
                      name:_ownerNameController.text.trim(),
                      mobileNo: _ownerNumberController.text.trim(),
                      emailId: _ownerEmailController.text.trim(),
                      gender: _ownerGender.name);
                  ref.read(logisticsDriverDetailProvider.notifier).state = driverDetails;
                  ref.read(logisticsOwnerDetailProvider.notifier).state = ownerDetails;
                  ref.read(currentIndexProvider.notifier).state = 1;
                }
              },
              child: const Text('Continue')),
        ),
      ],
    );
  }
}
