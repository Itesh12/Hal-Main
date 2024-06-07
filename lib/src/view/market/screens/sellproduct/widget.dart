import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/constants/colors.dart';

class SelectSellingWidget extends StatelessWidget {
  const SelectSellingWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.currentIndex,
      required this.index})
      : super(key: key);
  final String image;
  final String name;
  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentIndex == index
                  ? const Color(0xffFAA326)
                  : Colors.transparent,
              border: Border.all(
                  width: 1.5,
                  color: currentIndex == index
                      ? const Color(0xffD98000)
                      : const Color.fromRGBO(133, 133, 133, 0.11)),
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
                      child: SvgPicture.network(image,
                          height: 60.h,
                          width: 60.w,
                          color: currentIndex == index
                              ?primary
                              : grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Poppins",
                          color: currentIndex == index
                              ? const Color(0xffFFFFFF)
                              : const Color(0xff563E1F),
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

class ImageView extends StatefulWidget {
  const ImageView({Key? key, required this.image, required this.ontap})
      : super(key: key);
  final File image;
  final VoidCallback ontap;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 72,
          height: 72,
          // height: 183.h,
          margin: const EdgeInsets.only(right: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.file(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          top: -5,
          child: InkWell(
            onTap: widget.ontap,
            child: const CircleAvatar(
              backgroundColor: Color.fromRGBO(226, 107, 38, 1),
              maxRadius: 8,
              minRadius: 8,
              child: Icon(
                Icons.close,
                size: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
