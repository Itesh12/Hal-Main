import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../model/market/get_bazar_product_model.dart';
import '../../../util/services/shared_preferences.dart';
import 'bazar_image_view.dart';

@RoutePage()
class BuyDetailPage extends StatefulWidget {
  const BuyDetailPage({Key? key, required this.allbuyBazarDetailPost})
      : super(key: key);

  final GetBazarProductModel allbuyBazarDetailPost;

  @override
  State<BuyDetailPage> createState() => _BuyDetailPageState();
}

class _BuyDetailPageState extends State<BuyDetailPage> {
  int activePage = 0;
  List<String> valueList = ['Kilograms', 'grams', 'milligram'];
  String? selectedVal = 'Kilograms';
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: widget.allbuyBazarDetailPost.media!.isNotEmpty
                    ? widget.allbuyBazarDetailPost.media!.length
                    : 1,
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: 301.h,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activePage = index;
                      });
                    }),
                itemBuilder: (BuildContext context, index, i) {
                  return ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.sp),
                      bottomLeft: Radius.circular(20.sp),
                    ),
                    child: InkWell(
                      onTap: widget.allbuyBazarDetailPost.media!.isNotEmpty
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BazaarImageView(
                                            imageIndex: index,
                                            allbuyBazarDetailPost:
                                                widget.allbuyBazarDetailPost,
                                          )));
                            }
                          : null,
                      child: Container(
                          width: double.maxFinite,
                          height: 100.h,
                          // height: 183.h,
                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1.0), BlendMode.softLight),
                                  image: widget.allbuyBazarDetailPost.media!
                                          .isNotEmpty
                                      ? NetworkImage(widget
                                          .allbuyBazarDetailPost
                                          .media![index]
                                          .mediaUrl)
                                      : const NetworkImage(
                                          'https://machinerymarketplace.net/images/tillage.jpg'),
                                  fit: BoxFit.cover)),
                          child: Stack(children: [
                            // Image.asset(image??'fdsa',scale: 2,),
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
                top: 10,
                left: 15,
                right: 15,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color.fromRGBO(226, 107, 38, 1),
                          maxRadius: 15,
                          minRadius: 15,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      Consumer(builder: (context, ref, child) {
                        return PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              if (UserPreferences.userId ==
                                  widget.allbuyBazarDetailPost.userId)
                                PopupMenuItem(
                                  child: const Text("Delete Product"),
                                  onTap: () async {
                                    debugPrint("Delete the product");
                                    await ref
                                        .read(getMarketProductProvider)
                                        .deleteProduct(
                                            productId: widget
                                                .allbuyBazarDetailPost.id);
                                    ref
                                        .read(getMyProductProvider(widget
                                            .allbuyBazarDetailPost.userId))
                                        .deleteProduct(
                                            widget.allbuyBazarDetailPost);

                                    context.router.root.popTop();
                                  },
                                ),
                              if (UserPreferences.userId ==
                                      widget.allbuyBazarDetailPost.userId &&
                                  widget.allbuyBazarDetailPost.status !=
                                      'Pending')
                                PopupMenuItem(
                                  child: const Text("Edit Product"),
                                  onTap: () async {
                                    context.router
                                        .push(EditSellingItemRoute(
                                            getBazarProductModel:
                                                widget.allbuyBazarDetailPost))
                                        .then((value) async {
                                      await ref
                                          .read(getMyProductProvider(
                                                  UserPreferences.userId)
                                              .notifier)
                                          .refresh(context);
                                    });

                                    context.router.root.popTop();
                                  },
                                ),
                            ];
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: whitePrimary,
                          ),
                        );
                      }),
                    ]),
              ),
              if (widget.allbuyBazarDetailPost.media!.isNotEmpty)
                Positioned(
                  bottom: 10,
                  left: 50,
                  right: 50,
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
                          color: activePage == index
                              ? primary
                              : const Color(0xffC6C6C6),
                        ),
                      );
                    }),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.allbuyBazarDetailPost.category,
                  style: const TextStyle(
                    color: Color(0xff858484),
                    fontSize: 10,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        widget.allbuyBazarDetailPost.subCategory,
                        style: const TextStyle(
                            color: Color(0xff563E1F),
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Spacer(),
                    if (UserPreferences.userId ==
                        widget.allbuyBazarDetailPost.userId) ...{
                      if (widget.allbuyBazarDetailPost.status != "Rejected")
                        Container(
                          height: 26.h,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: widget.allbuyBazarDetailPost.status !=
                                    "Approved"
                                ? const Color(0xffF29339).withOpacity(0.1)
                                : const Color(0xff3A974C).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          child: Center(
                              child: Text(
                            widget.allbuyBazarDetailPost.status!,
                            style: TextStyle(
                                color: widget.allbuyBazarDetailPost.status !=
                                        "Approved"
                                    ? const Color(0xffF29339)
                                    : const Color(0xff3A974C)),
                          )),
                        )
                      else
                        Container(
                          height: 26.h,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: const Color(0xffE22626).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          child: Center(
                              child: Text(
                            widget.allbuyBazarDetailPost.status!,
                            style: const TextStyle(color: Color(0xffE22626)),
                          )),
                        )
                    }
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: '₹ ${widget.allbuyBazarDetailPost.price} ',
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        color: Color(0xffE26B26),
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.allbuyBazarDetailPost.unit,
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            color: Color(0xffE26B26),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                if (widget.allbuyBazarDetailPost.status == "Rejected")
                  Column(
                    children: [
                      20.verticalSpace,
                      Container(
                        height: 70.h,
                        width: 335.w,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xffE81E43).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.warning,
                              color: Color(0xffEE264A),
                            ),
                            Container(
                                child: Text(
                              'Reason: ${widget.allbuyBazarDetailPost.rejReason!}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xffE81E43),
                                  fontWeight: FontWeight.w500),
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                20.verticalSpace,

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Poppins",
                        color: Color(0xff563E1F),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  widget.allbuyBazarDetailPost.description == ''
                      ? 'No Description'
                      : widget.allbuyBazarDetailPost.description!,
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "Poppins",
                      color: Color(0xff7C7C7C),
                      fontWeight: FontWeight.w400),
                ),
                10.verticalSpace,

                const Text(
                  'Seller Information',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Poppins",
                      color: Color(0xff563E1F),
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFCF6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color: const Color(0xffFFF3D7)),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://i.pinimg.com/originals/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg'),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  widget.allbuyBazarDetailPost.traderName,
                                  style: const TextStyle(
                                      color: Color(0xff563E1F),
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: primary,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 280.w,
                                child: Text(
                                  widget.allbuyBazarDetailPost.address!.isNotEmpty
                                      ? '${widget.allbuyBazarDetailPost.address!.first.area}, ${widget.allbuyBazarDetailPost.address!.first.district},${widget.allbuyBazarDetailPost.address!.first.state}'
                                      : 'No Address',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      color: Color(0xff563E1F),
                                      fontSize: 10,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.chat,
                                color: primary,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              if (widget.allbuyBazarDetailPost.address!.isNotEmpty) Text(
                                widget.allbuyBazarDetailPost.address!.first
                                        .wtsUpMobileNo ??
                                    widget.allbuyBazarDetailPost.mobileNo,
                                style: const TextStyle(
                                    color: Color(0xff563E1F),
                                    fontSize: 10,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500),
                              ) else const Text('Not Available')
                            ],
                          )
                        ],
                      ),
                      if (widget.allbuyBazarDetailPost.userId !=
                          UserPreferences.userId)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.allbuyBazarDetailPost.distance.toString()} Km',
                              style: const TextStyle(
                                  color: primary,
                                  fontSize: 10,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: widget.allbuyBazarDetailPost.userId ==
                                      UserPreferences.userId
                                  ? () {
                                      // context.router.push(const ProfileRoute());
                                    }
                                  : () {
                                      context.router.push(OtherProfileRoute(
                                          userId: widget
                                              .allbuyBazarDetailPost.userId));
                                    },
                              child: const Text(
                                "View Profile",
                                style: TextStyle(
                                    color: primary,
                                    fontSize: 14,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                if (widget.allbuyBazarDetailPost.userId !=
                    UserPreferences.userId)
                  const Text(
                    "*Complete quantity request to Contact",
                    style: TextStyle(
                        color: primary,
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  ),
                if (widget.allbuyBazarDetailPost.userId !=
                    UserPreferences.userId)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              final Uri contactUrl = Uri(
                                scheme: 'tel',
                                path: widget.allbuyBazarDetailPost.mobileNo,
                              );
                              await launchUrl(contactUrl);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primary,
                                fixedSize: const Size(double.maxFinite, 45)),
                            child: const Text(
                              "Contact",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              if(widget.allbuyBazarDetailPost.address!.isNotEmpty){
                                launchUrl(
                                  Uri(
                                      scheme: 'https',
                                      host: 'wa.me',
                                      path: widget.allbuyBazarDetailPost.address!
                                          .first.wtsUpMobileNo ??
                                          '/+91${widget.allbuyBazarDetailPost.mobileNo}',
                                      fragment: 'numbers'),
                                  mode: LaunchMode.externalApplication,
                                );
                              }

                            },
                            style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xffDADADA),
                                fixedSize: const Size(double.maxFinite, 45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/WhatsApp.png',
                                  height: 23.h,
                                  width: 23.h,
                                ),
                                5.horizontalSpace,
                                const Text(
                                  "Chat",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 10.0),
                //   child: Text(
                //     "Related Products",
                //     style: TextStyle(
                //         color: Color(0xff563E1F),
                //         fontSize: 12,
                //         fontFamily: "Poppins",
                //         fontWeight: FontWeight.w600),
                //   ),
                // ),
                // GridView.builder(
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 2,
                //             crossAxisSpacing: 20.0,
                //             mainAxisSpacing: 15.0),
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: showMore ? 10 : 2,
                //     shrinkWrap: true,
                //     padding: const EdgeInsets.symmetric(vertical: 10),
                //     itemBuilder: (BuildContext ctx, index) {
                //       return const RentCard();
                //     }),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                //   child: Center(
                //     child: GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           showMore = !showMore;
                //         });
                //       },
                //       child: Text(showMore ? "Show less" : "View more",
                //           style: const TextStyle(
                //               color: primary,
                //               fontSize: 12,
                //               fontFamily: "Poppins",
                //               fontWeight: FontWeight.w500)),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
