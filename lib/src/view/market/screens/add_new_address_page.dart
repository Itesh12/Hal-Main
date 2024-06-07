import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/model/market/add_new_address_model.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../../util/services/shared_preferences.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../auth/registration/widgets/addressFields.dart';
import '../../widget/dialogs/fail_dialog.dart';
import '../../widget/dialogs/success_dialog.dart';
import '../../widget/textfield_widget.dart';

@RoutePage()
class AddNewAddressPage extends ConsumerStatefulWidget {
  const AddNewAddressPage({
    Key? key,
    this.state,
    this.district,
    this.pinCode,
    this.area,
    this.houseNo,
    required this.lat,
    required this.long,
  }) : super(key: key);
  final String? state;
  final String? district;
  final String? pinCode;
  final String? area;
  final String? houseNo;
  final double lat;
  final double long;

  @override
  _AddNewAddressPageState createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends ConsumerState<AddNewAddressPage> {
  final TextEditingController _stateTextEditingController =
      TextEditingController();
  final TextEditingController _areaTextEditingController =
      TextEditingController();
  final TextEditingController _districtTextEditingController =
      TextEditingController();
  final TextEditingController _pincodeTextEditingController =
      TextEditingController();
  final TextEditingController _houseNoTextEditingController =
      TextEditingController();
  final TextEditingController _landMarkTextEditingController =
      TextEditingController();
  final TextEditingController _whatsAppNoTextEditingController =
      TextEditingController();

  @override
  void initState() {
    _stateTextEditingController.text = widget.state ?? '';
    _areaTextEditingController.text = widget.area ?? '';
    _districtTextEditingController.text = widget.district ?? '';
    _pincodeTextEditingController.text = widget.pinCode ?? '';
    _houseNoTextEditingController.text = widget.houseNo ?? '';
    super.initState();
  }

  final List<String> _addressType = ['Home', 'Work', 'Office', 'Others'];
  List<String> _addressTypeRes = [];

  int _selectedAddressIndex = 0;

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(userMultiAddressProvider);
    res.whenData((value) =>
        _addressTypeRes = value.address.map((e) => e.locationType).toList());
    debugPrint(_addressTypeRes.toString());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        centerTitle: false,
        title: Text(
          "Enter Full Address",
          style: TextStyle(
            fontSize: 20.sp,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              const Text('Enter Address Details'),
              20.verticalSpace,
              AddressTextFields(
                stateTextController: _stateTextEditingController,
                areaTextController: _areaTextEditingController,
                pincodeTextController: _pincodeTextEditingController,
                districtTextController: _districtTextEditingController,
              ),
              AppTextField(
                textController: _houseNoTextEditingController,
                hintText: "House No ",
                maxlines: 1,
                validator: (value) =>
                    Validate.range(value: value!, minLen: 3, maxLen: 24),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
              ),
              20.verticalSpace,
              AppTextField(
                textController: _landMarkTextEditingController,
                hintText: "Landmark (Optional) ",
                maxlines: 1,
                validator: (value) =>
                    Validate.range(value: value!, minLen: 3, maxLen: 24),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(24),
                ],
              ),
              20.verticalSpace,
              AppTextField(
                textController: _whatsAppNoTextEditingController,
                hintText: "What's App No. (Optional) ",
                maxlines: 1,
                validator: (value) => Validate.phone(value!),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
              20.verticalSpace,
              const Text('Location Type'),
              Row(
                children: [
                  ...List.generate(
                      _addressType.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                _selectedAddressIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                height: 40.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: _selectedAddressIndex == index
                                        ? const Color(0xffFEF2D6)
                                        : const Color(0XFFF4F4F4)),
                                child: Center(
                                  child: Text(
                                    _addressType[index],
                                    style: TextStyle(
                                        color: _selectedAddressIndex == index
                                            ? primary
                                            : Colors.black45),
                                  ),
                                ),
                              ),
                            ),
                          ))
                ],
              ),
              30.verticalSpace,
              Align(
                  child: ElevatedButton(
                      onPressed: () {
                        sumbit();
                      },
                      child: const Text('Save Address')))
            ],
          ),
        ),
      ),
    );
  }

  String filterAddress() {
    int noofmatch = 0;
    late String filterdAdType;

    for (final addType in _addressTypeRes) {
      if (addType.contains(_addressType[_selectedAddressIndex])) {
        noofmatch += 1;
      }
    }
    if (noofmatch > 0) {
      filterdAdType = '${_addressType[_selectedAddressIndex]}_$noofmatch';
    } else {
      filterdAdType = _addressType[_selectedAddressIndex];
    }

    debugPrint(filterdAdType);
    return filterdAdType;
  }

  Future<void> sumbit() async {
    final AddNewAddressModel addnewAddressModel = AddNewAddressModel(
        userId: UserPreferences.userId,
        state: _stateTextEditingController.text,
        district: _districtTextEditingController.text,
        pinCode: _pincodeTextEditingController.text,
        area: _areaTextEditingController.text,
        wtsUpMobileNo: '+91${_whatsAppNoTextEditingController.text}',
        locationType:
            _addressTypeRes.contains(_addressType[_selectedAddressIndex])
                ? filterAddress()
                : _addressType[_selectedAddressIndex],
        latitude: widget.lat,
        longitude: widget.long);

    try {
      ref.watch(sellPostProvider).addNewAddress(addnewAddressModel);
      successDialog(context, onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      Navigator.pop(context);
      failDialog(context);
    }
  }
}
