import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../widget/textfield_widget.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({
    super.key,
  });

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  String selectedTrips = 'Select No. of Trips per month';
  List<String> trips = ['0 - 20', '21 - 40', '41 - 60', '61 - 80', '81 - 100', '100 +'];


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        const Text('Business Details',
            style: TextStyle(
                fontSize: 16,
                color: primary,
                fontWeight: FontWeight.w600)),
        const Text('No Of Trips Per Month',
            style: TextStyle(
                fontSize: 14,
                color: Color(0xff563e1f),
                fontWeight: FontWeight.w600)),
        10.verticalSpace,
        DropdownButtonHideUnderline(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF9F9F9),
              border: Border.all(color: const Color(0xffF4F4F4)),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                isExpanded: true,
                hint: Text(
                  selectedTrips,
                  style:
                  selectedTrips == "Select No. of Trips per month"
                      ? textTheme.bodyLarge!.copyWith(
                      color: hintTextColor, fontSize: 12.sp)
                      : textTheme.bodyLarge!
                      .copyWith(fontSize: 12.sp),
                ),
                items: trips
                    .map<DropdownMenuItem>(
                        (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: textTheme.bodyLarge!
                            .copyWith(fontSize: 12.sp),
                      ),
                    ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTrips = value;
                  });
                },
              ),
            ),
          ),
        ),
        10.verticalSpace,
        const Text('Revenue Generated Per Month',
            style: TextStyle(
                fontSize: 14,
                color: Color(0xff563e1f),
                fontWeight: FontWeight.w600)),
        10.verticalSpace,
        AppTextField(
          hintText: 'Revenue Per Month',
          keyboardType: TextInputType.streetAddress,
          inputFormatters: [
            LengthLimitingTextInputFormatter(35),
          ],
        ),

      ],
    );
  }
}