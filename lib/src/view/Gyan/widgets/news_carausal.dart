import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/view/Gyan/widgets/carausal_news_tile.dart';

import '../../../../global_providers.dart';

class NewsCarausal extends ConsumerStatefulWidget {
  const NewsCarausal({Key? key}) : super(key: key);

  @override
  _NewsCarausalState createState() => _NewsCarausalState();
}

class _NewsCarausalState extends ConsumerState<NewsCarausal> {
  final List<Widget> dots = [const Icon(Icons.add)];

  int activePage = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(builder: (context, ref, child) {
          final res = ref.watch(agriNewsDataProvider);
          return res.when(
              data: (agriNews) => Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount:agriNews.length>7?6:agriNews.length,
                        options: CarouselOptions(
                            autoPlay: true,
                            height: 201.h,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                activePage = index;
                              });
                            }),
                        itemBuilder: (BuildContext context, index, i) {
                          return CarausalNewsTile(
                            agrimodel: agriNews,
                            index: index,
                          );
                        },
                      ),
                      27.verticalSpace,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              List<Widget>.generate(agriNews.length>7?6:agriNews.length, (index) {
                            return Container(
                              margin: const EdgeInsets.all(3),
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: activePage == index
                                    ? primary
                                    : const Color(0xffC6C6C6),
                                shape: BoxShape.circle,
                              ),
                            );
                          })),
                    ],
                  ),
              error: (Object error, StackTrace? stackTrace) => const SizedBox(),
              loading: () => const CircularProgressIndicator());
        }),
      ],
    );
  }
}
