import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/colors.dart';

@RoutePage()
class WeatherDetailedPage extends StatefulWidget {
  const WeatherDetailedPage({Key? key}) : super(key: key);

  @override
  State<WeatherDetailedPage> createState() => _WeatherDetailedPageState();
}

class _WeatherDetailedPageState extends State<WeatherDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: primary,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w),
            child: Column(
              children: [
                100.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/location.svg',
                      color: Colors.white,
                      height: 20.h,
                    ),
                    18.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 94.w,
                          child: const Text(
                            'Noida,',
                            style: TextStyle(color: Colors.white, fontSize: 29),
                          ),
                        ),
                        Text(
                          'Uttar Pradesh',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/warning.png',
                      height: 13.19.h,
                    ),
                    3.horizontalSpace,
                    const Text(
                      'Chance of Rain : 50%',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/rain.png',
                      height: 46.h,
                    ),
                    17.horizontalSpace,
                    1.verticalSpace,
                    Text(
                      '26',
                      style: TextStyle(fontSize: 78.sp, color: Colors.white),
                    ),
                    Column(
                      children: [
                        Text(
                          'o',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        50.verticalSpace,
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'C',
                          style:
                              TextStyle(fontSize: 33.sp, color: Colors.white),
                        ),
                        Text(
                          'Overcast',
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Jul 29 Fri'),
                    const Text('Jul 29 Fri'),
                    29.horizontalSpace,
                    const Text("26'c /20°c"),
                  ],
                ),
                40.verticalSpace,
                SizedBox(
                  // color: Colors.red,
                  height: 70,
                  width: 370,
                  child: ListView.builder(
                      itemCount: 10,
                      // separatorBuilder:(context, index) => const SizedBox(width: 70,),
                      // physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const HourlyClimate()),
                ),
                Container(
                  color: Colors.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        const WeeklyWeatherBottomDetail(),
                    itemCount: 7,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class WeeklyWeatherBottomDetail extends StatefulWidget {
  const WeeklyWeatherBottomDetail({Key? key}) : super(key: key);

  @override
  _WeeklyWeatherBottomDetailState createState() =>
      _WeeklyWeatherBottomDetailState();
}

class _WeeklyWeatherBottomDetailState extends State<WeeklyWeatherBottomDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 50.h,
      color: Colors.yellow,
      child: Row(
        children: [
          const Text('Jul 30 Sat'),
          41.horizontalSpace,
          Image.asset(
            'assets/images/rain.png',
            height: 28.h,
          ),
          14.horizontalSpace,
          const Text(
            'Thunderstrom',
            softWrap: true,
          ),
          20.horizontalSpace,
          const Text(
            '26c /20°c',
            softWrap: true,
          )
        ],
      ),
    );
  }
}

class WeatherDetailedPageInfo extends StatefulWidget {
  const WeatherDetailedPageInfo({Key? key}) : super(key: key);

  @override
  State<WeatherDetailedPageInfo> createState() =>
      _WeatherDetailedPageInfoState();
}

class _WeatherDetailedPageInfoState extends State<WeatherDetailedPageInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/location.png',
              color: Colors.white,
            ),
            Container(
              color: Colors.yellow,
              width: 94.w,
              child: const Text('Noida,Uttar Pradesh'),
            )
          ],
        )
      ],
    );
  }
}

class HourlyClimate extends StatefulWidget {
  const HourlyClimate({Key? key}) : super(key: key);

  @override
  State<HourlyClimate> createState() => _HourlyClimateState();
}

class _HourlyClimateState extends State<HourlyClimate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text('12:00'),
          5.verticalSpace,
          Image.asset(
            'assets/images/rain.png',
            height: 28,
          ),
          5.verticalSpace,
          const Text('20C')
        ],
      ),
    );
  }
}

class WeatherDetailedPageBackground extends StatelessWidget {
  const WeatherDetailedPageBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          right: 0.w,
          top: 100.h,
          child: Image.asset(
            'assets/images/topRightEllipse.png',
            height: 283.h,
          )),
      Positioned(
          left: 0.w,
          bottom: -30.h,
          child: Image.asset(
            'assets/images/bottomLeft.png',
            height: 200.h,
          )),
      Container(height: 812.h, width: 375.w, color: Colors.transparent)
    ]);
  }
}
