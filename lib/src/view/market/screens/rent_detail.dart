import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../model/market/get_bazar_product_model.dart';
import '../../../util/services/shared_preferences.dart';
import 'bazar_image_view.dart';

@RoutePage()
class RentDetailPage extends StatefulWidget {
  const RentDetailPage({Key? key, required this.allRentProduct})
      : super(key: key);
  final GetBazarProductModel allRentProduct;

  @override
  State<RentDetailPage> createState() => _RentDetailPageState();
}

class _RentDetailPageState extends State<RentDetailPage> {
  int activePage = 0;
  List<String> valueList = ['Days', 'Weeks', 'Months', 'Years'];
  String? selectedVal = 'Weeks';
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: widget.allRentProduct.media!.isNotEmpty
                    ? widget.allRentProduct.media!.length
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
                      onTap: widget.allRentProduct.media!.isNotEmpty
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BazaarImageView(
                                            imageIndex: index,
                                            allbuyBazarDetailPost:
                                                widget.allRentProduct,
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
                                  image: widget.allRentProduct.media!.isNotEmpty
                                      ? NetworkImage(widget.allRentProduct
                                          .media![index].mediaUrl)
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
                      // Row(
                      //   children: const [
                      //     CircleAvatar(
                      //       backgroundColor: Color.fromRGBO(226, 107, 38, 1),
                      //       maxRadius: 15,
                      //       minRadius: 15,
                      //       child: Icon(Icons.share, size: 18),
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     CircleAvatar(
                      //       backgroundColor: Color.fromRGBO(226, 107, 38, 1),
                      //       maxRadius: 15,
                      //       minRadius: 15,
                      //       child: Icon(Icons.bookmark_outline_rounded,
                      //           size: 18),
                      //     ),
                      //   ],
                      // )
                      Consumer(builder: (context, ref, child) {
                        return PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              if (UserPreferences.userId ==
                                  widget.allRentProduct.userId)
                                PopupMenuItem(
                                  child: const Text("Delete Product"),
                                  onTap: () async {
                                    debugPrint("Delete the product");
                                    await ref
                                        .read(getMarketProductProvider)
                                        .deleteProduct(
                                            productId:
                                                widget.allRentProduct.id);
                                    ref
                                        .read(getMyProductProvider(
                                            widget.allRentProduct.userId))
                                        .deleteProduct(widget.allRentProduct);

                                    context.router.root.popTop();
                                  },
                                ),
                              if (UserPreferences.userId ==
                                      widget.allRentProduct.userId &&
                                  widget.allRentProduct.status != 'Pending')
                                PopupMenuItem(
                                  child: const Text("Edit Product"),
                                  onTap: () async {
                                    context.router
                                        .push(EditRentRoute(
                                      getBazarProductModel:
                                          widget.allRentProduct,
                                    ))
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
              if (widget.allRentProduct.media!.isNotEmpty)
                Positioned(
                  bottom: 10,
                  left: 50,
                  right: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        widget.allRentProduct.media!.length, (index) {
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
                  widget.allRentProduct.category,
                  style: const TextStyle(
                    color: Color(0xff858484),
                    fontSize: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    widget.allRentProduct.subCategory,
                    style: const TextStyle(
                        color: Color(0xff563E1F),
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '₹ ${widget.allRentProduct.price} ',
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        color: Color(0xffE26B26),
                        fontWeight: FontWeight.w600),
                    children: const <TextSpan>[
                      TextSpan(
                        text: '/Day',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            color: Color(0xffE26B26),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                if (widget.allRentProduct.status == "Rejected")
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
                              'Reason: ${widget.allRentProduct.rejReason!}',
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
                  widget.allRentProduct.description ?? 'No Description',
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "Poppins",
                      color: Color(0xff7C7C7C),
                      fontWeight: FontWeight.w400),
                ),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                  widget.allRentProduct.traderName,
                                  style: const TextStyle(
                                      color: Color(0xff563E1F),
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              // const Icon(
                              //   Icons.star,
                              //   size: 14,
                              //   color: Color(0xffEEAC03),
                              // ),
                              // const Padding(
                              //   padding: EdgeInsets.only(left: 2.0),
                              //   child: Text(
                              //     '3.5',
                              //     style: TextStyle(
                              //         color: Color(0xff563E1F),
                              //         fontSize: 10,
                              //         fontFamily: "Poppins",
                              //         fontWeight: FontWeight.w600),
                              //   ),
                              // ),
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
                                  widget.allRentProduct.address!.isNotEmpty
                                      ? '${widget.allRentProduct.address!.first.area}, ${widget.allRentProduct.address!.first.district},${widget.allRentProduct.address!.first.state}'
                                      : 'No Address',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
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
                              Icon(
                                Icons.social_distance,
                                color: primary,
                                size: 16.h,
                              ),
                              5.horizontalSpace,
                              Text(
                                '${widget.allRentProduct.distance.toString()} Km',
                                style: const TextStyle(
                                    color: primary,
                                    fontSize: 10,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                          // Row(
                          //   children: [
                          //     const Icon(
                          //       Icons.whatsapp,
                          //       color: primary,
                          //       size: 16,
                          //     ),
                          //     const SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text(
                          //       widget.allRentProduct.address!.first
                          //               .wtsUpMobileNo ??
                          //           widget.allRentProduct.mobileNo,
                          //       style: const TextStyle(
                          //           color: Color(0xff563E1F),
                          //           fontSize: 10,
                          //           fontFamily: "Poppins",
                          //           fontWeight: FontWeight.w500),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                      if (widget.allRentProduct.userId !=
                          UserPreferences.userId)
                        InkWell(
                          onTap: widget.allRentProduct.userId ==
                                  UserPreferences.userId
                              ? () {
                                  context.router.push(const ProfileRoute());
                                }
                              : () {
                                  context.router.push(OtherProfileRoute(
                                      userId: widget.allRentProduct.userId));
                                },
                          child: const Text(
                            "View Profile",
                            style: TextStyle(
                                color: primary,
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                    ],
                  ),
                ),
                if (widget.allRentProduct.userId != UserPreferences.userId)
                  const Text(
                    "*Complete quantity request to Contact",
                    style: TextStyle(
                        color: primary,
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  ),
                if (widget.allRentProduct.userId != UserPreferences.userId)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              final Uri contactUrl = Uri(
                                scheme: 'tel',
                                path: widget.allRentProduct.address!.first
                                        .wtsUpMobileNo ??
                                    widget.allRentProduct.mobileNo,
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
                              launchUrl(
                                Uri(
                                    scheme: 'https',
                                    host: 'wa.me',
                                    path:
                                        '/+91${widget.allRentProduct.mobileNo}',
                                    fragment: 'numbers'),
                                mode: LaunchMode.externalApplication,
                              );
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
