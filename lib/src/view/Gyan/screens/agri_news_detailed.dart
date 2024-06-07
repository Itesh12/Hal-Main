import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../model/agriNews/top_news_model.dart';

@RoutePage()
class AgriDetailedNewsPage extends StatelessWidget {
  const AgriDetailedNewsPage(
      {Key? key, required this.agrimodel, required this.index})
      : super(key: key);

  final List<TopNewsModel> agrimodel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(240.h),
          child: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),

            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9.r),
                  bottomRight: Radius.circular(9.r)),
              child: Container(
                height: 320.h,
                width: 300.w,
                decoration: BoxDecoration(
                    image: agrimodel[index].image!.isNotEmpty
                        ?  DecorationImage(
                        fit: BoxFit.cover,
                        image:NetworkImage(
                          agrimodel[index].image!.first.mediaUrl,)
                    ):const DecorationImage(
                      image: AssetImage(
                        'assets/images/default_news.png',
                        // fit: BoxFit.fitHeight,
                        // height: 300,
                      ),
                    )
                ),
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
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            GetTimeAgo.parse(agrimodel[index].createdAt),
                            style: const TextStyle(color: Colors.white),
                          ),

                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(top: 25, right: 31, left: 31, bottom: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 56.h,
                      width: 4.w,
                      color: mediumOrange,
                    ),
                    10.horizontalSpace,
                    SizedBox(
                      width: 269.w,
                      height: 70.h,
                      child: Text(
                        agrimodel[index].title!,
                        style: textTheme.titleMedium!.copyWith(color: brown),
                      ),
                    )
                  ],
                ),
                28.verticalSpace,
                Text(
                  agrimodel[index].description ?? 'sfda',
                  style: const TextStyle(color: grey),
                )
              ],
            ),
          ),
        ));
  }
}
