import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/controller/station/upload_logistics_controller.dart';
import 'package:kisaan_station/src/infrastructure/repository/station/sell/upload_logistic_repo.dart';
import 'package:kisaan_station/src/util/text_validation/text_validation.dart';
import 'package:kisaan_station/src/view/home/widget/transport_widgets/vehicle_details.dart';
import 'package:kisaan_station/src/view/widget/dialogs/loading_dialog.dart';

import '../../../../../global_providers.dart';
import '../../../../constants/colors.dart';
import '../../../../model/station/logistics/sell/upload_logistics_model.dart';
import '../../../widget/textfield_widget.dart';

class KycDetails extends ConsumerStatefulWidget {
  const KycDetails({
    super.key,
  });

  @override
  ConsumerState<KycDetails> createState() => _KycDetailsState();
}

class _KycDetailsState extends ConsumerState<KycDetails> {
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController drivingController = TextEditingController();
  final TextEditingController insuranceController = TextEditingController();
  final TextEditingController pucController = TextEditingController();

  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController bankAccountController = TextEditingController();
  final TextEditingController confirmAccountController =
      TextEditingController();
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();

  @override
  void initState() {
    final kycDetails = ref.read(logisticsKycDetailsProvider);

    aadharController.text = kycDetails?.aadhaarNo ?? "";
    panController.text = kycDetails?.panNo ?? "";
    regNoController.text = kycDetails?.rcNo ?? "";
    drivingController.text = kycDetails?.dlNo ?? "";
    insuranceController.text = kycDetails?.insuranceNo ?? "";
    pucController.text = kycDetails?.pollutionNo ?? "";

    final bankDetails = ref.read(logisticsBankDetailsProvider);

    bankNameController.text = bankDetails?.name ?? "";
    branchNameController.text = bankDetails?.branch ?? "";
    bankAccountController.text = bankDetails?.accountNo ?? "";
    confirmAccountController.text = bankDetails?.accountNo ?? "";
    holderNameController.text = bankDetails?.holderName ?? "";
    ifscController.text = bankDetails?.ifsc ?? "";

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Expanded(
            child: ListView(
              children: [
                const Text('KYC Details',
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                const Text('Aadhar Card',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Aadhaar No.',
                  keyboardType: TextInputType.number,
                  textController: aadharController,
                  validator: (value) => Validate.number(value!, 12),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(12),
                  ],
                ),
                20.verticalSpace,
                Row(
                  children: [
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'aadhaar',
                      length: 1,
                      hintText: 'Front Side',
                    )),
                    20.horizontalSpace,
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'aadhaar',
                      length: 1,
                      hintText: 'Back Side',
                    )),
                  ],
                ),
                10.verticalSpace,
                const Text('Pan Card',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Pan No.',
                  textController: panController,
                  validator: (value) => Validate.empty(value!),
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
                20.verticalSpace,
                Row(
                  children: [
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'pan',
                      length: 1,
                      hintText: 'Front Side',
                    )),
                    20.horizontalSpace,
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'pan',
                      length: 1,
                      hintText: 'Back Side',
                    )),
                  ],
                ),
                20.verticalSpace,
                const Text('Vehicle Documents',
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                const Text('Vehicle Registration',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter RC No.',
                  textController: regNoController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) => Validate.empty(value!),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                ),
                20.verticalSpace,
                Row(
                  children: [
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'rc',
                      length: 1,
                      hintText: 'Front Side',
                    )),
                    20.horizontalSpace,
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'rc',
                      length: 1,
                      hintText: 'Back Side',
                    )),
                  ],
                ),
                10.verticalSpace,
                const Text('Driving Licence',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter DL No.',
                  textController: drivingController,
                  validator: (value) => Validate.empty(value!),
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                ),
                20.verticalSpace,
                Row(
                  children: [
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'dl',
                      length: 1,
                      hintText: 'Front Side',
                    )),
                    20.horizontalSpace,
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'dl',
                      length: 1,
                      hintText: 'Back Side',
                    )),
                  ],
                ),

                10.verticalSpace,
                const Text('Vehicle Insurance',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Insurance No.',
                  textController: insuranceController,
                  validator: (value) => Validate.empty(value!),
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                20.verticalSpace,
                CustomLogisticsImageGrid(
                  provider: 'insurance',
                ),

                10.verticalSpace,
                const Text('Pollution Under Control (PUC)',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter PUC No.',
                  validator: (value) => Validate.empty(value!),
                  textController: pucController,
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                20.verticalSpace,
                Row(
                  children: [
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'puc',
                      length: 1,
                      hintText: 'Front Side',
                    )),
                    20.horizontalSpace,
                    const Expanded(
                        child: CustomLogisticsImageGrid(
                      provider: 'puc',
                      length: 1,
                      hintText: 'Back Side',
                    )),
                  ],
                ),
                20.verticalSpace,

                const Text('Bank Details',
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                const Text('Bank Name',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Bank Name',
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) => Validate.empty(value!),
                  textController: bankNameController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Branch Name',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Branch Name',
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) => Validate.empty(value!),
                  textController: branchNameController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Account No.',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Account No.',
                  textController: bankAccountController,
                  validator: (value) => Validate.empty(value!),
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Confirm Account No.',
                  validator: (value) => Validate.compareAccountNumber(
                      value!, bankAccountController.text),
                  keyboardType: TextInputType.visiblePassword,
                  textController: confirmAccountController,
                  onChanged: (value) {
                    // _formKey.currentState!.validate();
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('Account Holder Name',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Account Holder Name',
                  textController: holderNameController,
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) => Validate.empty(value!),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                10.verticalSpace,
                const Text('IFSC Code',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff563e1f),
                        fontWeight: FontWeight.w600)),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter IFSC Code',
                  validator: (value) => Validate.empty(value!),
                  textController: ifscController,
                  keyboardType: TextInputType.visiblePassword,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(35),
                  ],
                ),
                50.verticalSpace,

                // 10.verticalSpace,
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
                      ref.read(currentIndexProvider.notifier).state = 2;
                    },
                    child: const Text('Back')),
              ),
              10.horizontalSpace,
              Expanded(
                child: ElevatedButton(
                    onPressed: () async {
                      if (ref.read(aadhaarImageListProvider).length != 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: primary,
                                content: Text("Upload Aadhaar Card images.")));
                      } else if (ref.read(panImageListProvider).length != 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: primary,
                                content: Text("Upload Pan Card images.")));
                      } else if (ref.read(rcImageListProvider).length != 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: primary,
                                content: Text("Upload RC images.")));
                      } else if (ref.read(dlImageListProvider).length != 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: primary,
                                content:
                                    Text("Upload Driving Licence images.")));
                      } else if (ref.read(insuranceImageListProvider).isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: primary,
                                content: Text("Upload Insurance images.")));
                      } else if (ref.read(pucImageListProvider).length != 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: primary,
                                content: Text("Upload PUC images.")));
                      }
                      else if (_formKey.currentState!.validate()) {
                        ref.read(currentIndexProvider.notifier).state = 3;

                        final kyc = KycDetailsModel(
                            aadhaarNo: aadharController.text.trim(),
                            panNo: panController.text.trim(),
                            rcNo: regNoController.text.trim(),
                            dlNo: drivingController.text.trim(),
                            insuranceNo: insuranceController.text.trim(),
                            pollutionNo: pucController.text.trim());

                        final bank = BankDetailsModel(
                            name: bankNameController.text.trim(),
                            branch: branchNameController.text.trim(),
                            accountNo: bankAccountController.text.trim(),
                            holderName: holderNameController.text.trim(),
                            ifsc: ifscController.text.trim());

                        ref.read(logisticsKycDetailsProvider.notifier).state =
                            kyc;
                        ref.read(logisticsBankDetailsProvider.notifier).state = bank;

                        showLoading(context);
                        final res = await ref
                            .read(uploadLogisticRepoProvider)
                            .submitLogisticsData();

                        if(res.first.hsId != null){
                          final upload = await ref.read(uploadLogisticRepoProvider).submitLogisticsImages(res.first.hsId);

                        }







                        // Future.wait([
                        //   ref
                        //       .read(uploadLogisticRepoProvider)
                        //       .submitLogisticsImages(),
                        //
                        // ]);

                        context.router.pop();
                        context.router.pop().then((value){

                          showDialog(
                              barrierDismissible: true,
                              context: context, builder: (context){
                            return Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.check_circle_outline,color: primary, size: 90,),
                                    const Text('You have successfully registered.',style: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.w500),),
                                    20.verticalSpace,
                                    ElevatedButton(onPressed: (){
                                      context.router.pop();
                                      context.router.pop();
                                    }, child: Text('Ok'))
                                  ],
                                ),
                              ),
                            );
                          });

                        });
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
