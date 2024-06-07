import 'package:auto_route/auto_route.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../../controller/drawer/station_partner_controller.dart';
import '../../../model/drawer/station_partner_form_model.dart';
import '../../../util/text_validation/text_validation.dart';
import '../../auth/registration/widgets/addressFields.dart';
import '../../widget/dialogs/fail_dialog.dart';
import '../../widget/textfield_widget.dart';

@RoutePage()
class AddAddressStationPartnerPage extends ConsumerStatefulWidget {
  const AddAddressStationPartnerPage({
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
  _AddAddressStationPartnerPageState createState() =>
      _AddAddressStationPartnerPageState();
}

class _AddAddressStationPartnerPageState
    extends ConsumerState<AddAddressStationPartnerPage> {
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

  @override
  void initState() {
    _stateTextEditingController.text = widget.state ?? '';
    _areaTextEditingController.text = widget.area ?? '';
    _districtTextEditingController.text = widget.district ?? '';
    _pincodeTextEditingController.text = widget.pinCode ?? '';
    _houseNoTextEditingController.text = widget.houseNo ?? '';
    super.initState();
  }

  List<String> _addressTypeRes = [];


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
              const Text(
                'House No. / Flat No. / Ward No.',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff563e1f)),
              ),
              10.verticalSpace,
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
              100.verticalSpace,
              Align(
                  child: ElevatedButton(
                      onPressed: () {
                        sumbit();
                      },
                      child: const Text('Confirm Address')))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sumbit() async {
    final StationPartnerAddressModel stationPartnerFormModel =
        StationPartnerAddressModel(
            address:
                "${_houseNoTextEditingController.text} ${_districtTextEditingController.text} ${_areaTextEditingController.text} ",
            pinCode: _pincodeTextEditingController.text,
            state: _stateTextEditingController.text,
            coordinates: [widget.lat, widget.long],
            type: 'Point');

    try {
      final jsons = jsonEncode(stationPartnerFormModel);

      ref.read(stationPartnerAddressProvider.notifier).editAddress(jsons);
      ref
          .read(latLongProvider.notifier)
          .editAddress(long: widget.long, lat: widget.lat);

      ref.read(stationPartnerAddressStringProvider.notifier).editAddress(
          '${stationPartnerFormModel.address}, ${stationPartnerFormModel.state}, ${stationPartnerFormModel.pinCode}');
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      failDialog(context);
    }
  }
}
