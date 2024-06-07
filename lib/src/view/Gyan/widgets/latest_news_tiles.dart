import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:kisaan_station/src/view/Gyan/widgets/latest_news_content.dart';

import '../../../app/router/router.gr.dart';
import '../../../model/agriNews/top_news_model.dart';

class LatestNewsTile extends StatelessWidget {
  const LatestNewsTile(
      {Key? key, this.views, required this.agrimodel, required this.index})
      : super(key: key);

  final List<TopNewsModel> agrimodel;

  final int? views;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        height: 88.h,
        width: 335.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffF4F4F4),
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
            ), //BoxShadow
          ],
        ),
        child: InkWell(
            onTap: () {
              context.router.push(
                  InshotLikeDisplayRoute(agrimodel: agrimodel, index: index));
              // context.router.push(AgriDetailedNewsRoute(
              //     image: image,
              //     newsTitle: newsTitle,
              //     uploadTime: uploadTime,
              //     isSaved: isSaved,
              //     newsDescription: newsDescription));
            },
            child: LatestNewsContent(
              image: agrimodel[index],
              uploadTime:
                  GetTimeAgo.parse(agrimodel[index].createdAt).toString(),
              newsTitle: agrimodel[index].title,
            )),
      ),
    );
  }
}
