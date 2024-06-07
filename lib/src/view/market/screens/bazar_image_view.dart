import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../model/market/get_bazar_product_model.dart';

class BazaarImageView extends StatefulWidget {
   BazaarImageView(
      {Key? key, required this.allbuyBazarDetailPost, required this.imageIndex})
      : super(key: key);
  final GetBazarProductModel allbuyBazarDetailPost;
   int imageIndex;

  @override
  State<BazaarImageView> createState() => _BazaarImageViewState();
}

class _BazaarImageViewState extends State<BazaarImageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: widget.allbuyBazarDetailPost.media!.length,
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height - 150,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        widget.imageIndex = index;
                      });
                    }),
                itemBuilder: (BuildContext context, index, i) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          width: double.maxFinite,
                          // height: 183.h,
                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1.0), BlendMode.softLight),
                                  image: NetworkImage(widget
                                      .allbuyBazarDetailPost
                                      .media![widget.imageIndex]
                                      .mediaUrl),
                                  fit: BoxFit.cover)),
                          child: Stack(children: [
                            Opacity(
                              opacity: 0.5,
                              child: Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.black,
                                    Colors.transparent,
                                    Colors.black,
                                  ],
                                )),
                              ),
                            ),
                          ])),
                    ),
                  );
                },
              ),
              Positioned(
                top: 40,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(226, 107, 38, 1),
                      maxRadius: 15,
                      minRadius: 15,
                      child: Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  widget.allbuyBazarDetailPost.media!.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(3),
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        widget.imageIndex == index ? primary : const Color(0xffC6C6C6),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
