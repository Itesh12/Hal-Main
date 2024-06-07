import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';


@RoutePage()
class AccountPrivacyPage extends StatefulWidget {
  const AccountPrivacyPage({super.key});

  @override
  State<AccountPrivacyPage> createState() => _AccountPrivacyPageState();
}

class _AccountPrivacyPageState extends State<AccountPrivacyPage> {
  bool hidePost = false;
  bool hideFarm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(onPressed: (){
        context.router.pop();
      }, icon: const Icon(Icons.arrow_back_ios)),
        title: Text('Account Privacy',style: TextStyle(color: primary, fontSize: 20.sp, fontWeight: FontWeight.w500),),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: const Color(0xffFEF9EE),
                      borderRadius:
                      BorderRadius.all(Radius.circular(15.r))),
                  child: Center(
                      child: SvgPicture.asset('assets/images/seller.svg')),
                ),
                15.horizontalSpace,
                Text(
                  "Hide Post",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff563E1F)),
                ),
                const Spacer(),
                Consumer(builder: (context, ref, child) {
                  return FlutterSwitch(
                      width: 43.0.w,
                      height: 22.0.h,
                      valueFontSize: 40.0.sp,
                      toggleSize: 22.0.h,
                      value: true,
                      borderRadius: 18.0,
                      padding: 3.0,
                      activeColor: const Color(0xffE26B26),
                      inactiveColor: const Color(0xffB6B6B6),
                      showOnOff: true,
                      onToggle: (val) async {

                      });
                })
              ],
            ),
            20.verticalSpace,
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: const Color(0xffFEF9EE),
                      borderRadius:
                      BorderRadius.all(Radius.circular(15.r))),
                  child: Center(
                      child: SvgPicture.asset('assets/images/seller.svg')),
                ),
                15.horizontalSpace,
                Text(
                  "Hide Farm",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff563E1F)),
                ),
                const Spacer(),
                Consumer(builder: (context, ref, child) {
                  return FlutterSwitch(
                      width: 43.0.w,
                      height: 22.0.h,
                      valueFontSize: 40.0.sp,
                      toggleSize: 22.0.h,
                      value: true,
                      borderRadius: 18.0,
                      padding: 3.0,
                      activeColor: const Color(0xffE26B26),
                      inactiveColor: const Color(0xffB6B6B6),
                      showOnOff: true,
                      onToggle: (val) async {

                      });
                })
              ],
            ),
            
            TextButton(
                onPressed: (){

            }, child: Text('Delete Account'))
          ],
        ),
      ),
    );
  }
}
