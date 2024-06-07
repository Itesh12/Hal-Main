import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../app/router/router.gr.dart';
import '../../../model/market/get_bazar_product_model.dart';
import '../../../util/services/shared_preferences.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({Key? key, required this.allBazarPost}) : super(key: key);
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
        padding:  EdgeInsets.all(10.r),
        margin:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border:
                Border.all(color: const Color.fromRGBO(133, 133, 133, 0.11))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 100.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                      borderRadius:  BorderRadius.all(Radius.circular(10.r)),
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
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0.r,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.r),
                        color: const Color(0xffFFF6E9)),
                    padding:
                         EdgeInsets.symmetric(horizontal: 12.h, vertical: 2.h),
                    margin:  EdgeInsets.all(10.w),
                    child:  Text(
                      "Rent",
                      style: TextStyle(
                          fontSize: 9.5.sp,
                          fontFamily: "Poppins",
                          color: const Color(0xffE26B26),
                          fontWeight: FontWeight.w500),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: 10.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    Row(
                      children: [
                        Text(
                          allBazarPost.category,
                          style: const TextStyle(
                              fontSize: 10,
                              fontFamily: "Poppins",
                              color: Color(0xff5F5F5F),
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        if (UserPreferences.userId == allBazarPost.userId) ...{
                          if (allBazarPost.status != "Rejected")
                            Container(
                              height: 26.h,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                color: allBazarPost.status != "Approved"
                                    ? const Color(0xffF29339).withOpacity(0.1)
                                    : const Color(0xff3A974C).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                              child: Center(
                                  child: Text(
                                allBazarPost.status!,
                                style: TextStyle(
                                    color: allBazarPost.status != "Approved"
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
                                allBazarPost.status!,
                                style: const TextStyle(
                                    color: Color(0xffE22626)),
                              )),
                            )
                        }
                      ],
                    ),
                    Text(
                      allBazarPost.subCategory,
                      style:  TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          color: const Color(0xff563E1F),
                          fontWeight: FontWeight.w600),
                    ),
                    5.verticalSpace,
                    RichText(
                      text: TextSpan(
                        text: allBazarPost.price.toString(),
                        style:  TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "Poppins",
                            color: const Color(0xffE26B26),
                            fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                          if (allBazarPost.trading == 'rent')
                             TextSpan(
                              text: '/day',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: "Poppins",
                                  color: const Color(0xffE26B26),
                                  fontWeight: FontWeight.w500),
                            )
                          else
                            TextSpan(
                              text: '/${allBazarPost.unit}',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: "Poppins",
                                  color: const Color(0xffE26B26),
                                  fontWeight: FontWeight.w500),
                            ),
                        ],
                      ),
                    ),
                    5.verticalSpace,
                    if (allBazarPost.trading == 'sell')
                      Text(
                        'Qty: ${allBazarPost.quantity.toString()} /${allBazarPost.unit}',
                        style: const TextStyle(color: grey),
                      ),
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
