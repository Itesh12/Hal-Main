import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../global_providers.dart';
import '../../../../controller/auth/state/address_state.dart';
import '../../../../util/text_validation/text_validation.dart';
import '../../../widget/snackbar.dart';
import '../../../widget/textfield_widget.dart';

class AddressTextFields extends ConsumerStatefulWidget {
  const AddressTextFields(
      {required this.pincodeTextController,
      required this.areaTextController,
      required this.stateTextController,
      required this.districtTextController,
      Key? key})
      : super(key: key);
  final TextEditingController stateTextController;
  final TextEditingController districtTextController;
  final TextEditingController pincodeTextController;
  final TextEditingController areaTextController;

  @override
  _AddressTextFieldsState createState() => _AddressTextFieldsState();
}

class _AddressTextFieldsState extends ConsumerState<AddressTextFields> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ref.listen(addressProvider, (AddressState? previous, AddressState next) {
        next.when(
            loading: () {
              ScaffoldMessenger.of(context).showSnackBar(getSnackBar('gps is off'));
            },
            data: (address) {
              final subLocal = address.subLocality!.isNotEmpty
                  ? "${address.subLocality},"
                  : "";

              widget.stateTextController.text = address.administrativeArea!;
              widget.districtTextController.text =
                  address.subAdministrativeArea!;
              widget.areaTextController.text = "$subLocal ${address.locality}";
              widget.pincodeTextController.text = address.postalCode!;
            });
      });

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'State',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xff563e1f)),
          ),
          10.verticalSpace,
          AppTextField(
            textController: widget.stateTextController,
            hintText: "State ",
            maxlines: 1,
            validator: (value) =>
                Validate.range(value: value!, minLen: 3, maxLen: 24),
            inputFormatters: [
              LengthLimitingTextInputFormatter(24),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'District',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff563e1f)),
                    ),
                    10.verticalSpace,
                    AppTextField(
                        textController: widget.districtTextController,
                        hintText: "District",
                        maxlines: 1,
                        validator: (value) =>
                            Validate.range(value: value!, minLen: 3, maxLen: 60)),
                  ],
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pin Code',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff563e1f)),
                    ),
                    10.verticalSpace,
                    AppTextField(
                      textController: widget.pincodeTextController,
                      hintText: "Pin Code",
                      validator: (value) => Validate.minLength(
                          value: value!,
                          minLen: 6,
                          message: "Pin code must be of 6 digits."),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          10.verticalSpace,
          const Text(
            'Area',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xff563e1f)),
          ),
          10.verticalSpace,
          AppTextField(
            textController: widget.areaTextController,
            hintText: "Area",
            maxlines: 1,
            validator: (value) => Validate.minLength(value: value!, minLen: 3),
          ),
          10.verticalSpace,
        ],
      );
    });
  }
}
