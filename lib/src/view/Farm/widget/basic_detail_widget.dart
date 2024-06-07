


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../farm_page.dart';

class BasicDetailWidget extends StatelessWidget {
  const BasicDetailWidget({
    super.key,
    required this.widget,
  });

  final FarmPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Basic Details',
          style: TextStyle(
              color: primary, fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        5.verticalSpace,
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 2
                )
              ]
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text('Farmer Name',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp,) ,)),
                  Expanded(child: Text(":  ${widget.farm.farmerName}")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text('Hal Saathi',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp,) ,)),
                  Expanded(child: Text(":  ${widget.farm.halSaathi!.hsName}")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(
                      width: 90.w,
                      child: Text('DC',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp,) ,)),
                  Expanded(child: Text(":  ${widget.farm.dc!.dcName}")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
