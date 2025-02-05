import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';

import '../../../app/router/router.gr.dart';
import '../../../model/agriNews/top_news_model.dart';

class CarausalNewsTile extends StatelessWidget {
  const CarausalNewsTile(
      {Key? key, required this.agrimodel, required this.index})
      : super(key: key);

  final List<TopNewsModel> agrimodel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.sp),
      child: agrimodel.isNotEmpty
          ? InkWell(
              onTap: () {
                context.router.push(
                    InshotLikeDisplayRoute(agrimodel: agrimodel, index: index));
                // context.router.push(AgriDetailedNewsRoute(
                //     image: image,
                //     newsTitle: newsTitle,
                //     uploadTime: uploadTime,
                //     isSaved: isSaved,
                //     newsDescription: description)
                // );
              },
              child: Container(
                  width: 311.w,
                  height: 100.h,
                  // height: 183.h,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      image: agrimodel[index].image!.isNotEmpty
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  agrimodel[index].image!.first.mediaUrl)
                              //   Image.asset(
                              //   'assets/images/agrinews.png',
                              //   fit: BoxFit.fitHeight,
                              //   height: 300,
                              // ),
                              )
                          : const DecorationImage(
                              image: AssetImage(
                                'assets/images/default_news.png',
                                // fit: BoxFit.fitHeight,
                                // height: 300,
                              ),
                            )),
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
                    // Image.asset(image??'null',fit: BoxFit.cover,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (agrimodel[index].createdAt != "null" ||
                                  agrimodel[index].createdAt != "" ||
                                  agrimodel[index].createdAt != null)
                                Text(
                                  GetTimeAgo.parse(agrimodel[index].createdAt),
                                  style: const TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                )
                              else
                                const Text(''),
                              // const Spacer(),
                              // SvgPicture.asset(
                              //   'assets/images/saved_outlied.svg',
                              //   color: Colors.white,
                              // )
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              agrimodel[index].title ?? 'notitle',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
            )
          : Container(
              width: 311.w,
              height: 100.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/default_news.png',
                  // fit: BoxFit.fitHeight,
                  // height: 300,
                ),
              )),
              child: Stack(
                children: [
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
                  // const Spacer()
                ],
              )),
    );
  }
}
