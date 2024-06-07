import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/view/Gyan/widgets/latest_news_tiles.dart';

import '../../../../global_providers.dart';

class LatestNews extends ConsumerStatefulWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends ConsumerState<LatestNews> {
  // final List<TopNewsModel> _topnews= [
  //   const TopNewsModel(
  //       isSaved: false,
  //       newsTitle: '2022 focusses on makingIture smart, modern PM Modi',
  //       uploadTime: '3 hrs ago',
  //       image: 'assets/images/agrinews.png'
  //   ), const TopNewsModel(
  //       isSaved: false,
  //       newsTitle: 'Budget 2022 focusses on makingIture smart, modern: PM Modi',
  //       uploadTime: '3 hrs ago',
  //       image: 'assets/images/agrinews.png'
  //   ), const TopNewsModel(
  //       isSaved: false,
  //       newsTitle: 'Budget 2022 focusses on makingIture smart, modern: PM Modi',
  //       uploadTime: '3 hrs ago',
  //       image: 'assets/images/agrinews.png'
  //   ), const TopNewsModel(
  //       isSaved: false,
  //       newsTitle: 'Budget 2022 focusses on makingIture smart, modern: PM Modi',
  //       uploadTime: '3 hrs ago',
  //       image: 'assets/images/wlcm_screen/farmer.png'
  //   ),
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final res = ref.watch(agriNewsDataProvider);
      return res.when(
          data: (agriNews) => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: agriNews.length,
              itemBuilder: (context, index) {
                return LatestNewsTile(
                  agrimodel: agriNews,
                  index: index,
                );
              }),
          error: (e, s) => const SizedBox(),
          loading: () => const SizedBox());
      // return ListView.builder(
      //   physics: const NeverScrollableScrollPhysics(),
      //   shrinkWrap: true,
      //     itemCount: _topnews.length,
      //     itemBuilder: (context,index){
      //   return LatestNewsTile(image: _topnews[index].image,newsTitle: _topnews[index].newsTitle,uploadTime:  _topnews[index].uploadTime,isSaved: _topnews[index].isSaved ,);
      // });
    });
  }
}
