import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../widget/percent_indicator.dart';
import '../widgets/kyc_cards.dart';

@RoutePage()
class KycPage extends StatelessWidget {
  const KycPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          actions: const [Icon(Icons.more_vert)],
          title: const Text(
            'KYC Verification',
            style: TextStyle(color: primary),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
        ),
      ),
      body: Column(
        children: [
          LinearPercentIndicator(
            backgroundColor: const Color(0xffEBEBEB),
            width: 375.w,
            percent: 0.7,
            progressColor: primary,
            // child: Container(width: 345.w,height: 5,color: primary,)
          ),
          60.verticalSpace,
          InkWell(
              onTap: () {
                context.router.push(const PersonalDetailsRoute());
              },
              child: const KYCcards(
                  label: 'Personal Details',
                  leadingIcon: 'assets/images/cropdetails.svg',
                  percentage: 0.3,
                  indicatorColor: Color(0xff18967D),
                  fillColor: Color(0xffDBEEEC))),
          InkWell(
              onTap: () {
                context.router.push(const FarmDetailsRoute());
              },
              child: const KYCcards(
                label: 'Farm Details',
                leadingIcon: 'assets/images/my_farm_filled.svg',
                percentage: 0.5,
                indicatorColor: Color(0xffFAA326),
                fillColor: Color(0xffFBF5E7),
              )),
          InkWell(
              onTap: () {
                context.router.push(const CropDetailsRoute());
              },
              child: const KYCcards(
                label: 'Crop Details',
                leadingIcon: 'assets/images/cropinfo.svg',
                percentage: 0.4,
                indicatorColor: Color(0xffFAA326),
                fillColor: Color(0xffFBF5E7),
              )),
          InkWell(
              onTap: () {
                context.router.push(const ExpenseDetailRoute());
              },
              child: const KYCcards(
                label: 'Expense Details',
                leadingIcon: 'assets/images/expensedetails.svg',
                percentage: 0,
                indicatorColor: Color(0xffFAA326),
                fillColor: Color(0xffFBF5E7),
              )),
        ],
      ),
    );
  }
}
