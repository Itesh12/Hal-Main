import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/router/router.gr.dart';
import '../../l10n/l10n.dart';

@RoutePage()
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/wlcm_screen/LogoWhiteOnly.png',
                  height: 130.h,
                ),
                // 12.verticalSpace,
                // Text(
                //   AppLocalizations.of(context)!.welcome_to,
                //   style: TextStyle(
                //       color: brown,
                //       fontSize: 30.sp,
                //       fontWeight: FontWeight.w500),
                // ),
                // 5.verticalSpace,
                // Text(AppLocalizations.of(context)!.kisaan_station,
                //     style: TextStyle(
                //         color: brown,
                //         fontSize: 50.sp,
                //         fontWeight: FontWeight.bold,
                //         height: 1.h)),
                40.verticalSpace,
                Image.asset(
                  'assets/images/wlcm_screen/office.png',
                  height: 367.h,
                ),
                25.verticalSpace,
                SizedBox(
                  height: 47,
                  width: 195,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe26b26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), // <-- Radius
                        )),
                    onPressed: () {
                      context.navigateTo(const SignUpRoute());
                    },
                    child: Text(
                      AppLocalizations.of(context)!.get_started,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
