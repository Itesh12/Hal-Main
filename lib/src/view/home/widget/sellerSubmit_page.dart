import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

@RoutePage()
class SellerSubmitPage extends StatelessWidget {
  const SellerSubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  context.router.popUntilRoot();
                },
                icon: const Icon(Icons.close))
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(child: SvgPicture.asset('assets/images/submit.svg')),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      Text(
                        "Yayy! Your service is uploaded",
                        style: TextStyle(
                            letterSpacing: -1,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff563f1f)),
                      ),
                      // const SizedBox(height: 1),
                      Text(
                        "for costumers.",
                        style: TextStyle(
                            letterSpacing: -1,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff563f1f)),
                      )
                    ],
                  )),
              SizedBox(
                  height: 70,
                  child: Column(
                    children: [
                      Text(
                        "You can manage your Services",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffABABAB)),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        "from My Listings section.",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffABABAB)),
                      )
                    ],
                  )),
              60.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 48,
                    width: 308,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffe26b26),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                          // background
                        ),
                        onPressed: () {
                          // context.router.pop();
                          context.router.pop(1);
                        },
                        child: const Text('My Listings',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700))),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    height: 48,
                    width: 308,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xffe4e4e4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.0),
                        ), // background
                      ),
                      onPressed: () {
                        context.router.pop(0);
                      },
                      child: const Text('Back to Home',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff838383),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
