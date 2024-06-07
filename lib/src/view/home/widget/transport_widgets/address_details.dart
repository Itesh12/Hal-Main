import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/controller/station/upload_logistics_controller.dart';
import 'package:kisaan_station/src/infrastructure/repository/station/sell/upload_logistic_repo.dart';
import 'package:kisaan_station/src/util/text_validation/text_validation.dart';

import '../../../../../global_providers.dart';
import '../../../../constants/colors.dart';
import '../../../../model/station/logistics/sell/upload_logistics_model.dart';
import '../../../widget/textfield_widget.dart';

class AddressDetails extends ConsumerStatefulWidget {
  const AddressDetails({
    super.key,
  });

  @override
  ConsumerState<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends ConsumerState<AddressDetails> {
  final TextEditingController houseController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final address = ref.read(logisticsAddressDetailProvider);

    houseController.text = address?.houseNo ?? "";
    stateController.text = address?.state ?? "";
    pincodeController.text = address?.pincode ?? "";
    districtController.text = address?.district ?? "";
    villageController.text = address?.village ?? "";
    landmarkController.text = address?.landmark ?? "";

    super.initState();
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
              children: [
                const Text('Driver Address Details',
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                const Text('House No. / Flat No. / Ward No.',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'House No. / Flat No. / Ward No.',
                  textController: houseController,
                  validator: (value) => Validate.empty(value!),
                  keyboardType: TextInputType.streetAddress,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('State',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff563e1f),
                                  fontWeight: FontWeight.w600)),
                          10.verticalSpace,
                          AppTextField(
                            hintText: 'State',
                            textController: stateController,
                            validator: (value) => Validate.empty(value!),
                            keyboardType: TextInputType.streetAddress,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(35),
                            ],
                          ),
                        ],
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Pin code',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff563e1f),
                                  fontWeight: FontWeight.w600)),
                          10.verticalSpace,
                          AppTextField(
                            hintText: 'Pin code',
                            textController: pincodeController,
                            validator: (value) => Validate.number(value!,6),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                const Text('District',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'District',
                  textController: districtController,
                  validator: (value) => Validate.empty(value!),
                  keyboardType: TextInputType.streetAddress,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Village',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Village',
                  textController: villageController,
                  validator: (value) => Validate.empty(value!),
                  keyboardType: TextInputType.streetAddress,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Landmark',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Landmark',
                  textController: landmarkController,
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) => Validate.empty(value!),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: grey),
                    onPressed: () {
                      ref.read(currentIndexProvider.notifier).state = 0;
                    },
                    child: const Text('Back')),
              ),
              10.horizontalSpace,
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final addressDetails = AddressDetailsModel(
                            pincode: pincodeController.text.trim(),
                            houseNo: houseController.text.trim(),
                            state: stateController.text.trim(),
                            district: districtController.text.trim(),
                            village: villageController.text.trim(),
                            landmark: landmarkController.text.isEmpty ? "" : landmarkController.text.trim());
                        ref.read(logisticsAddressDetailProvider.notifier).state = addressDetails;
                        ref.read(currentIndexProvider.notifier).state = 2;

                      }
                    },
                    child: const Text('Continue')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
