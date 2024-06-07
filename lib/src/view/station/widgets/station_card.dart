import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';

class StationCard extends StatelessWidget {
  const StationCard({
    Key? key,
    required this.location,
    required this.distance,
    required this.onTap,
    this.fromList = true,
    required this.selectedIndex,
    required this.currentIndex,
    required this.name,
    required this.id,
  }) : super(key: key);

  final String location;
  final String name;
  final String id;
  final String distance;
  final bool fromList;
  final VoidCallback onTap;
  final int? selectedIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 328.w,
          height: 80.h,
          decoration: BoxDecoration(
              color: const Color(0xffFFFBF1),
              border: Border.all(color: const Color(0xffFFED9F)),
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.only(
                top: 10.h, bottom: 10.h, left: 10.w, right: 5.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/my_station.svg',
                  color: deepOrange,
                  height: 30.h,
                ),
                21.horizontalSpace,
                SizedBox(
                  // width: 250.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: textTheme.titleSmall!.copyWith(
                            color: brown,
                          ),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      1.verticalSpace,
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/Loc-1.svg',
                              color: deepOrange),
                          7.horizontalSpace,
                          Text(
                            id,
                            style: const TextStyle(color: deepOrange),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (fromList)
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: selectedIndex == null
                          ? const Color(0xffC6C6C6)
                          : selectedIndex == currentIndex
                              ? primary
                              : const Color(0xffC6C6C6),
                      shape: BoxShape.circle,
                    ),
                  )
                // SizedBox(
                //   height: 99.h,
                //   width: 62.w,
                //   child: Column(
                //     children: [
                //       const Spacer(),
                //       Row(
                //         children: [
                //           SvgPicture.asset('assets/images/call.svg'),
                //           9.5.horizontalSpace,
                //           SvgPicture.asset('assets/images/direction.svg'),
                //         ],
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SellerstationCard extends StatefulWidget {
  SellerstationCard({
    Key? key,
    required this.location,
    required this.distance,
    required this.onTap,
    this.fromList = true,
    required this.ischecked,
    required this.name,
    required this.id,
  }) : super(key: key);

  final String location;
  final String name;
  final String id;
  final String distance;
  final bool fromList;
  final VoidCallback onTap;
  bool ischecked = false;

  @override
  State<SellerstationCard> createState() => _SellerstationCardState();
}

class _SellerstationCardState extends State<SellerstationCard> {
  // final int currentIndex;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 19.h),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: 328.w,
          height: 80.h,
          decoration: BoxDecoration(
              color: const Color(0xffFFFBF1),
              border: Border.all(color: const Color(0xffFFED9F)),
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.only(
                top: 10.h, bottom: 10.h, left: 10.w, right: 5.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/my_station.svg',
                  color: deepOrange,
                  height: 30.h,
                ),
                21.horizontalSpace,
                SizedBox(
                  width: 220.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          widget.name,
                          style: textTheme.titleSmall!.copyWith(
                            color: brown,
                          ),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      1.verticalSpace,
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/Loc-1.svg',
                              color: deepOrange),
                          7.horizontalSpace,
                          Text(
                            widget.id,
                            style: const TextStyle(color: deepOrange),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (widget.fromList)
                  Checkbox(
                      //only check box
                      value: widget.ischecked, //unchecked
                      onChanged: (bool? value) {
                        //value returned when checkbox is clicked
                        widget.onTap();
                        setState(() {
                          widget.ischecked = value!;
                        });
                      })
                // Container(
                //   margin: const EdgeInsets.all(3),
                //   width: 15.w,
                //   height: 15.h,
                //   decoration: BoxDecoration(
                //     color: ischecked == false
                //         ? const Color(0xffC6C6C6)
                //         : ischecked == true
                //             ? primary
                //             : const Color(0xffC6C6C6),
                //     shape: BoxShape.rectangle,
                //   ),
                // )
                // SizedBox(
                //   height: 99.h,
                //   width: 62.w,
                //   child: Column(
                //     children: [
                //       const Spacer(),
                //       Row(
                //         children: [
                //           SvgPicture.asset('assets/images/call.svg'),
                //           9.5.horizontalSpace,
                //           SvgPicture.asset('assets/images/direction.svg'),
                //         ],
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
