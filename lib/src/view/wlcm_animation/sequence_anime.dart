import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../app/router/router.gr.dart';
import '../../l10n/l10n.dart';

@RoutePage()
class WelcomePage extends ConsumerStatefulWidget {
   const WelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends ConsumerState<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late SequenceAnimation sequenceAnimation;
  bool isAnimationrunning = true;
  bool isSwitchEnable = false;


  // if (timer.isActive) {
  // //Oh no!, it's taking longer than expected
  // }

  @override
  void initState() {
    // ref.read(dynamicLinkProvider).retrieveDynamicLink(context);
    initializeAnimationController();
    initialSequenceAnimation();

    Timer(
       const Duration(milliseconds:3200// 4500-500
       ),
      () {


        controller.stop();
        debugPrint('stopped');
        debugPrint(controller.status.toString());
        isSwitchEnable = true;
        // Navigate to your favorite place
      },
    );
    controller.forward();
    super.initState();
  }

  void initializeAnimationController() {
    controller = AnimationController(vsync: this)
      ..addListener(() {
        setState(() {
          debugPrint(sequenceAnimation['farmOpa'].value.toString());
          debugPrint(controller.status.toString());
        });
      });
  }



  final int oneMilliSecond= 0100; //1000-500;
  final int twoMilliSecond=700;//2000-500;
  final int threeMilliSecond=1700;//3000-500;
  final int fourMilliSecond=2700;//4000-500;
  final int fiveMilliSecond=3700;//5000-500;
  final int sixMilliSecond=4700;//6000-500;
  final int sixHalfMilliSecond=5200;//6500-500;
  final int sevenMilliSecond=5700;//7000-500;
  final int sevenHalfMilliSecond=6200;//7500-500;
  final int eightMilliSecond=6700;//8000-500;
  final int eightHalfMilliSecond=7200;//8500-500;
  final int eightSevenMilliSecond=7400;//8700-500;
  final int nineMilliSecond=7700;//9000-500;
  final int nineThreeMilliSecond=7500;//9300-500;
  final int tenMilliSecond=8700;//10000-500;
  final int tenHalfMilliSecond=9200;//10500-500;
  final int elevenMilliSecond=9700;//11000-500;
  final int elevenHalfMilliSecond=10200;//11500-500;
  final int twelveMilliSecond=10700;//12000-500;
  final int twelveHalfMilliSecond=11200;//12500-500;
  final int tirtheenMilliSecond=11700;//13000-500;
  final int forteenMilliSecond=12200;//14000-500;
  final int fifteenMilliSecond=12700;//15000-500;

  void initialSequenceAnimation() {
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: -180, end: -140),
            from:  Duration(milliseconds: oneMilliSecond),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'y')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 300),
            from:  Duration(milliseconds: sixMilliSecond),
            to:  Duration(milliseconds: sevenMilliSecond),
            tag: 'x') //in
        .addAnimatable(
            animatable: Tween<double>(begin: -372.h, end: 0.h),
            from:  Duration(milliseconds: sixMilliSecond),
            to:  Duration(milliseconds: sevenMilliSecond),
            tag: 'xfarm2')
        .addAnimatable(
            animatable: Tween<double>(begin: -95.h, end: -95.h),
            from:  const Duration(),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'yfarm2')
        .addAnimatable(
            animatable: Tween<double>(begin: -95.h, end: -372.h),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'yfarm2')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0),
            from:  const Duration(),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'yfarmer')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: -400),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'yfarmer')
        .addAnimatable(
            animatable: Tween<double>(begin: -372, end: 0),
            from:  Duration(milliseconds: sixHalfMilliSecond),
            to:  Duration(milliseconds: sevenHalfMilliSecond),
            tag: 'xfarmer',
            curve: Curves.decelerate)
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0),
            from:  const Duration(),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'farmerop',
            curve: Curves.decelerate)
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: sevenMilliSecond),
            to:  Duration(milliseconds: eightMilliSecond),
            tag: 'farmerop',
            curve: Curves.decelerate)
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'farmerop',
            curve: Curves.decelerate)
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0),
            from:  const Duration(),
            to:  Duration(milliseconds: twoMilliSecond),
            tag: 'o')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: twoMilliSecond),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'o')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0),
            from:  const Duration(),
            to:  Duration(milliseconds: twoMilliSecond),
            tag: 'ologo')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: twoMilliSecond),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'ologo')
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'ologo')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: twoMilliSecond),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'top')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0),
            from:  Duration(milliseconds: oneMilliSecond),
            to:  Duration(milliseconds: sevenMilliSecond),
            tag: 'opt2') //In2
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: eightMilliSecond),
            to:  Duration(milliseconds: eightHalfMilliSecond),
            tag: 'opt2') //In2
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'opt2') //Out2
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: oneMilliSecond),
            to:  Duration(milliseconds: twoMilliSecond),
            tag: 'op')
        // .addAnimatable(animatable: Tween<double>(begin: 1,end:0), from: Duration(milliseconds: 5), to: Duration(milliseconds: 6), tag: 'o')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  const Duration(),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'farmOpa') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0),
            from:  const Duration(),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'farm2Opa') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: sixHalfMilliSecond),
            to:  Duration(milliseconds: sevenHalfMilliSecond),
            tag: 'farm2Opa') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'farm2Opa') //Out
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from:  Duration(milliseconds: sixMilliSecond),
            to:  Duration(milliseconds: sevenMilliSecond),
            tag: 'farmOpa') //Out
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0),
            from:  Duration(milliseconds: oneMilliSecond),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'droneOpa')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: threeMilliSecond),
            to:  Duration(milliseconds: fourMilliSecond),
            tag: 'droneOpa') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from:  Duration(milliseconds: fiveMilliSecond),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'droneOpa') //Out
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: nineThreeMilliSecond),
            to:  Duration(milliseconds: tenHalfMilliSecond),
            tag: 'droneOpa') //In2
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'droneOpa') //Out2
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from:  Duration(milliseconds: twoMilliSecond),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'textOpa') //Out
        .addAnimatable(
            animatable: Tween<double>(begin: 380.w, end: 160.w),
            from:  Duration(milliseconds: twoMilliSecond),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'tractor')
        //In
        .addAnimatable(
            animatable: Tween<double>(begin: -90.w, end: 20.w),
            from:  Duration(milliseconds: twoMilliSecond),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'text1')
        //In
        .addAnimatable(
            animatable: Tween<double>(begin: -50, end: 0),
            from:  Duration(milliseconds: twoMilliSecond),
            to:  Duration(milliseconds: threeMilliSecond),
            tag: 'logo') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: -50),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'logo') //Out
        .addAnimatable(
            animatable: Tween<double>(begin: 40, end: 0),
            from:  Duration(milliseconds: threeMilliSecond),
            to:  Duration(milliseconds: fourMilliSecond),
            tag: 'droneR') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: -30),
            from:  Duration(milliseconds: fiveMilliSecond),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'droneR') //Out
        .addAnimatable(
            animatable: Tween<double>(begin: 30, end: 0),
            from:  Duration(milliseconds: nineThreeMilliSecond),
            to:  Duration(milliseconds: tenHalfMilliSecond),
            tag: 'droneR',
            curve: Curves.decelerate) //In2
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: -20),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'droneR',
            curve: Curves.decelerate) //Out2
        .addAnimatable(
            animatable: Tween<double>(begin: -50.w, end: 140.w),
            from:  Duration(milliseconds: threeMilliSecond),
            to:  Duration(milliseconds: fourMilliSecond),
            tag: 'droneY') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 140.w, end: 50.w),
            from:  Duration(milliseconds: fiveMilliSecond),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'droneY') //Out
        .addAnimatable(
            animatable: Tween<double>(begin: -20.w, end: 140.w),
            from:  Duration(milliseconds: nineThreeMilliSecond),
            to:  Duration(milliseconds: tenHalfMilliSecond),
            tag: 'droneY') //In2
        .addAnimatable(
            animatable: Tween<double>(begin: 140.w, end: 50.w),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'droneY') //Out2
        .addAnimatable(
            animatable: Tween<double>(begin: -50.w, end: 200.w),
            from:  Duration(milliseconds:threeMilliSecond),
            to:  Duration(milliseconds: fourMilliSecond),
            tag: 'droneX') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 200.w, end: 390.w),
            from:  Duration(milliseconds: fiveMilliSecond),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'droneX') //Out
        .addAnimatable(
            animatable: Tween<double>(begin: 300.w, end: 60.w),
            from:  Duration(milliseconds: nineThreeMilliSecond),
            to:  Duration(milliseconds: tenHalfMilliSecond),
            tag: 'droneX') //In2
        .addAnimatable(
            animatable: Tween<double>(begin: 60.w, end: -100.w),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 'droneX') //Out2
        .addAnimatable(
            animatable: Tween<double>(begin: 0.h, end: 50.h),
            from:  Duration(milliseconds: threeMilliSecond),
            to:  Duration(milliseconds: fourMilliSecond),
            tag: 'droneSize') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 50.h, end: 20.h),
            from:  Duration(milliseconds: fiveMilliSecond),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'droneSize') //Out
        .addAnimatable(
            animatable: Tween<double>(begin: 0.h, end: 50.h),
            from:  Duration(milliseconds: nineThreeMilliSecond),
            to:  Duration(milliseconds: tenHalfMilliSecond),
            tag: 'droneSize') //In2
        .addAnimatable(
            animatable: Tween<double>(begin: 160.w, end: -150.w),
            from:  Duration(milliseconds: fiveMilliSecond),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'tractor')
        //Out
        .addAnimatable(
            animatable: Tween<double>(begin: 20.w, end: 170.w),
            from:  Duration(milliseconds: fiveMilliSecond),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'text1') //Out

        .addAnimatable(
            animatable: Tween<double>(begin: -14.h, end: -14.h),
            from:  const Duration(),
            to:  Duration(milliseconds: eightSevenMilliSecond),
            tag: 'tractor2x',
            curve: Curves.ease) //In
        .addAnimatable(
            animatable: Tween<double>(begin: -14.h, end: 2.h),
            from:  Duration(milliseconds: eightSevenMilliSecond),
            to:  Duration(milliseconds: elevenHalfMilliSecond),
            tag: 'tractor2x',
            curve: Curves.ease) //In
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 0),
            from:  const Duration(),
            to:  Duration(milliseconds: eightSevenMilliSecond),
            tag: 'tractor2op',
            curve: Curves.ease) //In
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0.2),
            from:  Duration(milliseconds: eightSevenMilliSecond),
            to:  Duration(milliseconds: elevenHalfMilliSecond),
            tag: 'tractor2op',
            curve: Curves.ease) //In
        .addAnimatable(
            animatable: Tween<double>(begin: 250.w, end: 10.w),
            from:  Duration(milliseconds: eightHalfMilliSecond),
            to:  Duration(milliseconds: elevenHalfMilliSecond),
            tag: 'tractor2size') //In
        .addAnimatable(
            animatable: Tween<double>(begin: -80, end: 20),
            from:  Duration(milliseconds: sevenHalfMilliSecond),
            to:  Duration(milliseconds: eightHalfMilliSecond),
            tag: 't2x') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 20, end: -80),
            from:  Duration(milliseconds: twelveMilliSecond),
            to:  Duration(milliseconds: twelveHalfMilliSecond),
            tag: 't2x') //In
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0),
            from:  Duration(milliseconds: fiveMilliSecond),
            to:  Duration(milliseconds: sixMilliSecond),
            tag: 'o') //out
        // .addAnimatable(animatable: Tween<double>(begin: 0,end:1), from: Duration(milliseconds: 4), to: Duration(milliseconds: 5), tag: 'top')
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: sequenceAnimation['op'].value,
                child: Stack(children: [
                  Positioned(
                    right: 30.w,
                    top: sequenceAnimation['logo'].value + 30.h,
                    child: Opacity(
                      opacity: sequenceAnimation['ologo'].value,
                      child: Container(
                        height: 30.w,
                        width: 65.w,
                        decoration: BoxDecoration(
                            borderRadius:  const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(color: Colors.orangeAccent)),
                        child: InkWell(
                            onTap: () {
                              debugPrint(controller.status.toString());
                              context.router.replace( const LandingRoute());
                            },
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.skip,
                                style: const TextStyle(color: Colors.orangeAccent),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: sequenceAnimation['logo'].value,
                    left: 10.w,
                    child: Opacity(
                        opacity: sequenceAnimation['ologo'].value,
                        child: Image.asset(
                          'assets/images/wlcm_screen/logoo.png',
                          height: 100.h,
                        )),
                  ),
                  Positioned(
                    bottom: sequenceAnimation['y'].value,
                    right: sequenceAnimation['x'].value,
                    child: Opacity(
                      opacity: sequenceAnimation['farmOpa'].value,
                      child: Image.asset(
                        'assets/images/wlcm_screen/background.png',
                        width: 550.h,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170.h,
                    right: sequenceAnimation['t2x'].value,
                    child: Opacity(
                        opacity: sequenceAnimation['opt2'].value,
                        child: Text(
                          AppLocalizations.of(context)!.crop_monitoring,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 38.sp,
                              color: brown,
                              fontWeight: FontWeight.w700,
                              height: 1),
                        )
                    ),
                  ),
                  Positioned(
                    top: 265.h,
                    right: sequenceAnimation['t2x'].value,
                    child: Opacity(
                      opacity: sequenceAnimation['opt2'].value,
                      child: Text(
                        AppLocalizations.of(context)!
                            .crop_monitoring_text,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: const Color(0xff616161),
                            fontSize: 14.sp,
                            letterSpacing: 0.5),
                      ),
                      //
                      //   Image.asset(
                      //   'assets/images/wlcm_screen/Text2.png',
                      //   height: 55.h,
                      // )
                    ),
                  ),
                  Align(
                    alignment:
                        Alignment(sequenceAnimation['tractor2x'].value, 0.10.w),
                    child: Opacity(
                        opacity: sequenceAnimation['tractor2op'].value,
                        child: Image.asset(
                          'assets/images/wlcm_screen/tractor.png',
                          height: sequenceAnimation['tractor2size'].value,
                        )),
                  ),
                  Positioned(
                    bottom: sequenceAnimation['yfarm2'].value,
                    right: sequenceAnimation['xfarm2'].value,
                    child: Opacity(
                      opacity: sequenceAnimation['farm2Opa'].value,
                      child: Image.asset(
                        'assets/images/wlcm_screen/farm2.png',
                        width: 510.h,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: sequenceAnimation['yfarmer'].value,
                    right: sequenceAnimation['xfarmer'].value,
                    child: Opacity(
                        opacity: sequenceAnimation['farmerop'].value,
                        child: Image.asset(
                          'assets/images/wlcm_screen/farmer.png',
                          height: 400.h,
                        )),
                  ),
                  Positioned(
                    top: 300.w,
                    right: sequenceAnimation['tractor'].value,
                    child: Opacity(
                        opacity: sequenceAnimation['o'].value,
                        child: Image.asset(
                          'assets/images/wlcm_screen/tractor.png',
                          height: 300.h,
                        )),
                  ),
                  Positioned(
                    top: 190.h,
                    left: sequenceAnimation['text1'].value,
                    child: Opacity(
                        opacity: sequenceAnimation['o'].value,
                        child: Text(
                          AppLocalizations.of(context)!.smart_farming,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 38.sp,
                              color: brown,
                              fontWeight: FontWeight.w700,
                              height: 1),
                        ),
                    ),
                  ),
                  Positioned(
                    top: 300.h,
                    left: sequenceAnimation['text1'].value,
                    child: Opacity(
                      opacity: sequenceAnimation['top'].value,
                      child: Opacity(
                          opacity: sequenceAnimation['o'].value,
                          child: Text(
                            AppLocalizations.of(context)!
                                .smart_farming_text,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: const Color(0xff616161),
                                fontSize: 14.sp,
                                letterSpacing: 0.5),
                          ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: sequenceAnimation['droneY'].value,
                    left: sequenceAnimation['droneX'].value,
                    //top: sequenceAnimation['droneY'].value,left: sequenceAnimation['droneX'].value,//
                    child: Opacity(
                      opacity: sequenceAnimation['droneOpa'].value,
                      child: RotationTransition(
                          turns: AlwaysStoppedAnimation(
                              sequenceAnimation['droneR'].value / 360),
                          //sequenceAnimation['droneR'].value //sequenceAnimation['droneR'].value
                          child: Image.asset(
                            'assets/images/wlcm_screen/drone.png',
                            height: sequenceAnimation['droneSize'].value,
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 10.w,
                    // alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: () async {
                          if (isSwitchEnable) {
                            isSwitchEnable = false;
                            controller.forward();

                            if (isAnimationrunning) {
                              Timer( const Duration(milliseconds: 5800
                              // 6500-500

                              ), () {

                                isSwitchEnable = true;
                                isAnimationrunning = false;
                                controller.stop();
                                debugPrint('stopped');
                                debugPrint(controller.status.toString());
                              });
                            } else {
                              await context.replaceRoute( const LandingRoute());
                              // Navigate to your favorite place
                            }
                          }
                          // setState(
                          //     () => isAnimationrunning = !isAnimationrunning);
                        },
                        child: Image.asset(
                          'assets/images/animationbottombutton.png',
                          height: 70.h,
                        )),
                  ),
                ]),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
