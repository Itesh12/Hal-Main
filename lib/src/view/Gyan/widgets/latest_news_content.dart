import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../model/agriNews/top_news_model.dart';

class LatestNewsContent extends StatelessWidget {
  const LatestNewsContent(
      {Key? key,
      this.uploadTime,
      this.newsTitle,
      this.newsDescription,
      this.views,
      required this.image})
      : super(key: key);

  final String? uploadTime;
  final String? newsTitle;
  final String? newsDescription;
  final int? views;
  final TopNewsModel image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 76.h,
          width: 76.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image:image.image!.isNotEmpty?
                DecorationImage(
                    image: NetworkImage(image.image!.first.mediaUrl),
                    fit: BoxFit.cover,
                  ):const DecorationImage(scale: 3,
              image: AssetImage(
                'assets/images/default_news.png',
                // fit: BoxFit.fitHeight,
              ),),
          ),
        ),
        13.horizontalSpace,
        SizedBox(
          width: 244.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsTitle ?? 'notitle',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              12.verticalSpace,
              Row(
                children: [
                  Text(
                    uploadTime!,
                    style: const TextStyle(color: grey),
                  ),
                  5.horizontalSpace
                ],
              )
            ],
          ),
        )
        // Image.asset('assets/images/latestnews.png')
      ],
    );
  }
}
