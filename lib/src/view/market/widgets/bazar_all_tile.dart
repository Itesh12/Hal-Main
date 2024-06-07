import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app/router/router.gr.dart';
import '../../../model/market/get_bazar_product_model.dart';

class BazarAllTile extends StatelessWidget {
  const BazarAllTile({
    Key? key,
    required this.allBazarPost,
  }) : super(key: key);

  final GetBazarProductModel allBazarPost;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: allBazarPost.trading == 'sell'
          ? () {
              context.router
                  .push(BuyDetailRoute(allbuyBazarDetailPost: allBazarPost));
            }
          : () {
              context.router
                  .push(RentDetailRoute(allRentProduct: allBazarPost));
            },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: const Color.fromRGBO(133, 133, 133, 0.11))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 165,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1.0), BlendMode.softLight),
                          image: allBazarPost.media!.isNotEmpty
                              ? NetworkImage(allBazarPost.media!.first.mediaUrl)
                              : const NetworkImage(
                                  'https://machinerymarketplace.net/images/tillage.jpg'),
                          fit: BoxFit.cover)),
                ),
                if (allBazarPost.trading == 'rent')
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffFFF6E9)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Rent",
                      style: TextStyle(
                          fontSize: 9.5,
                          fontFamily: "Poppins",
                          color: Color(0xffE26B26),
                          fontWeight: FontWeight.w500),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                          child: Row(
                            children: [
                              Spacer(),
                              // GestureDetector(
                              //     onTap: () {
                              //       setState(() {
                              //         activeBookmark = !activeBookmark;
                              //       });
                              //     },
                              //     child: activeBookmark
                              //         ? const Icon(
                              //             Icons.bookmark_rounded,
                              //             color: itemListActive,
                              //           )
                              //         : const Icon(
                              //             Icons.bookmark_outline_rounded,
                              //             color: itemListActive,
                              //           )),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              allBazarPost.category,
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Poppins",
                                  color: Color(0xff5F5F5F),
                                  fontWeight: FontWeight.w500),
                            ),
                            // Spacer(),
                            // if (UserPreferences.userId ==
                            //     allBazarPost.userId) ...{
                            //   allBazarPost.status != "Rejected"
                            //       ? Container(
                            //           height: 32.h,
                            //           padding: EdgeInsets.symmetric(
                            //               horizontal: 10.w),
                            //           decoration: BoxDecoration(
                            //             color: allBazarPost.status != "Approved"
                            //                 ? Color(0xffF29339).withOpacity(0.1)
                            //                 : Color(0xff3A974C)
                            //                     .withOpacity(0.1),
                            //             borderRadius:
                            //                 BorderRadius.circular(18.r),
                            //           ),
                            //           child: Center(
                            //               child: Text(
                            //             allBazarPost.status,
                            //             style: TextStyle(
                            //                 color: allBazarPost.status !=
                            //                         "Approved"
                            //                     ? Color(0xffF29339)
                            //                     : Color(0xff3A974C)),
                            //           )),
                            //         )
                            //       : Container(
                            //           height: 32.h,
                            //           padding: EdgeInsets.symmetric(
                            //               horizontal: 10.w),
                            //           decoration: BoxDecoration(
                            //             color:
                            //                 Color(0xffE22626).withOpacity(0.1),
                            //             borderRadius:
                            //                 BorderRadius.circular(18.r),
                            //           ),
                            //           child: Center(
                            //               child: Text(
                            //             allBazarPost.status,
                            //             style:
                            //                 TextStyle(color: Color(0xffE22626)),
                            //           )),
                            //         )
                            // }
                          ],
                        ),
                        Text(
                          allBazarPost.subCategory,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              color: Color(0xff563E1F),
                              fontWeight: FontWeight.w600),
                        ),
                        RichText(
                          text: TextSpan(
                            text: allBazarPost.price.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "Poppins",
                                color: Color(0xffE26B26),
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              if (allBazarPost.trading == 'rent')
                                const TextSpan(
                                  text: '/day',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Poppins",
                                      color: Color(0xffE26B26),
                                      fontWeight: FontWeight.w500),
                                )
                              else
                                const TextSpan(
                                  text: '/Kg',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Poppins",
                                      color: Color(0xffE26B26),
                                      fontWeight: FontWeight.w500),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (allBazarPost.status == "Rejected")
                      Row(
                        children: [
                          const Spacer(),
                          Text('* ${allBazarPost.rejReason!}',
                              style: const TextStyle(color: Color(0xffE22626))),
                        ],
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xffCE9141),
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '${allBazarPost.distance.toString()} Km',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontFamily: "Poppins",
                                      color: Color(0xffCE9141),
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: const [
                            //     Icon(
                            //       Icons.star,
                            //       color: Color(0xffEEAC03),
                            //       size: 14.0,
                            //     ),
                            //     SizedBox(
                            //       width: 2,
                            //     ),
                            //     Text(
                            //       '3.9',
                            //       style: TextStyle(
                            //           fontSize: 11,
                            //           fontFamily: "Poppins",
                            //           color: Color(0xff563E1F),
                            //           fontWeight: FontWeight.w500),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              color: Color(0xff606060),
                              size: 18.0,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Owner - ${allBazarPost.traderName} ',
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Poppins",
                                  color: Color(0xff606060),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
