import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../global_providers.dart';
import '../../shimmer/weather_shimmer.dart';

class WeatherTile extends ConsumerStatefulWidget {
  const WeatherTile({Key? key}) : super(key: key);

  @override
  _WeatherTileState createState() => _WeatherTileState();
}

class _WeatherTileState extends ConsumerState<WeatherTile> {
  String getWeatherIcon(int condition) {
    if (condition < 10) {
      return 'assets/images/sunny.png';
    } else if (condition < 40) {
      return 'assets/images/fog.png';
    } else if (condition < 60) {
      return 'assets/images/rain.png';
    } else if (condition < 90) {
      return 'assets/images/rain.png';
    } else {
      return 'assets/images/snow.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(weatherDataProvider);

    return res.when(data: (data) {
      return
          // SizedBox(
          // width: 250.w,
          // height: 162.h,
          // child: ListView.builder(
          //   shrinkWrap: true,
          //   scrollDirection: Axis.horizontal,
          //   itemCount: 1,
          //   itemBuilder: (context, index) {
          //     // weatherIcon =getWeatherIcon( int.parse(_items[index]["rain"]));
          //
          //     return
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    // context.router.push(WeatherDetailedRoute());
                  },
                  child: Stack(
                    children: [
                      const WeatherTileBG(),
                      WeatherTileInfo(
                        date: DateFormat("d MMMM").format(DateTime.now()),
                        maxTemp: data.main.temp.round().toString(),
                        location: data.name ?? 'fecthing.',
                        rain: 'asdf',
                        weatherIcon: data.weather![0].icon.toString(),
                        windSpeed: data.wind!.speed.toString(),
                        weatherDescri:
                            data.weather![0].description ?? 'noDescription',
                        humidity: data.main.humidity.toString(),
                      )
                    ],
                  ),
                ),
              ));

      //   },
      // ),
    }, error: (error, st) {
      return const SizedBox();
    }, loading: () {
      return const WeatherShimmer();
    });
    // ComingSoon();
  }
}

class WeatherTileInfo extends StatelessWidget {
  const WeatherTileInfo(
      {required this.windSpeed,
      required this.weatherIcon,
      required this.rain,
      required this.date,
      required this.maxTemp,
      required this.weatherDescri,
      required this.location,
      required this.humidity,
      Key? key})
      : super(key: key);
  final String date;
  final String maxTemp;
  final String location;
  final String rain;
  final String weatherIcon;
  final String windSpeed;
  final String weatherDescri;
  final String humidity;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = ThemeData().textTheme;

    // return Padding(
    //       padding: const EdgeInsets.only(right: 10,left: 10, top: 15,bottom: 10),
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //                Text(
    //                widget.date,
    //                 style: textTheme.labelLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.w500)
    //               ),
    //               const Spacer(),
    //               const Icon(
    //                 Icons.location_on,
    //                 size: 13,
    //                 color: Colors.white,
    //               ),
    //               3.horizontalSpace,
    //                Text(
    //                    widget.location,
    //                    style: textTheme.labelLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.w500)
    //
    //                ),
    //             ],
    //           ),
    //           Row(
    //
    //             children:  [
    //               Text(
    //          'Wind : 16 km h',
    //                 style: TextStyle(color: Color(0xffFFC59E)),
    //               ),
    //               35.horizontalSpace,
    //               Temperature(temp: widget.maxTemp,weatherIcon: widget.weatherIcon,),
    //             ],
    //           ),
    //            12.verticalSpace,
    //            Text('Sunny - Cloudy',
    //
    // style: textTheme.labelLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.w500)
    //
    // )
    //           ,
    //           30.verticalSpace,
    //           Row(
    //             children: [
    //               Image.asset(
    //                 'assets/images/warning.png',
    //                 height: 12.h,
    //                 width: 13.w,
    //               ),
    //               3.horizontalSpace,
    //                Text(
    //                 'Chance of Rain ${widget.rain}%',
    //                 style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     );

    return SizedBox(
      height: 162,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.location_on_outlined,
                  size: 13,
                  color: Colors.white,
                ),
                3.horizontalSpace,
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'http://openweathermap.org/img/wn/$weatherIcon@2x.png',
                                height: 50,
                                width: 50,
                              ),
                              Text(
                                maxTemp,
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  " °C",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            weatherDescri,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    left: 3,
                    child: Text(
                      "Wind: $windSpeed km/h",
                      style: TextStyle(
                        color: const Color(0xffFFC59E),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                3.horizontalSpace,
                Text(
                  'Humidity: $humidity %',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherTileBG extends StatelessWidget {
  const WeatherTileBG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 162,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: const Color(0xffE26B26),
        ),
      ),
      Positioned(
        child: Image.asset(
          'assets/images/bubble1.png',
          width: 158,
        ),
      ),
      Positioned(
        right: -5,
        child: Image.asset(
          'assets/images/bubble2.png',
          width: 176,
        ),
      ),
    ]);
  }
}
