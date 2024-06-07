import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SelectRentingWidget extends StatelessWidget {
  const SelectRentingWidget({Key? key, required this.image, required this.name, required this.currentIndex, required this.index}) : super(key: key);
  final String image;
  final String name;
  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
      return  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ? const Color(0xffFAA326) : Colors.transparent,
            border:
            Border.all(
                width: 1.5,
                color: currentIndex == index ? const Color(0xffD98000)  :  const Color.fromRGBO(133, 133, 133, 0.11)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      // image: DecorationImage(
                      //     image:SvgPicture.network(
                      //         image),
                      //     fit: BoxFit.fill)
                    ),
                    child: SvgPicture.network(
                      image,
                      height: 60.h,
                      width: 60.w,
                    ),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 10.0),
                   child: Text(
                    name,
                    style:  TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        color: currentIndex == index ? const Color(0xffFFFFFF) : const Color(0xff563E1F),
                        fontWeight: FontWeight.w500),
                ),
                 ),
              ],
            ),
          ));
    },
   );
  }
}
