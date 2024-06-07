import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kisaan_station/src/view/Gyan/screens/agri_news_detailed.dart';

import '../../../model/agriNews/top_news_model.dart';

@RoutePage()
class InshotLikeDisplayPage extends StatefulWidget {
  const InshotLikeDisplayPage(
      {Key? key, required this.agrimodel, required this.index})
      : super(key: key);

  final List<TopNewsModel> agrimodel;
  final int index;

  @override
  _InshotLikePageViewState createState() => _InshotLikePageViewState();
}

class _InshotLikePageViewState extends State<InshotLikeDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: widget.index),
          scrollDirection: Axis.vertical,
          itemCount: widget.agrimodel.length,
          itemBuilder: (context, index) => AgriDetailedNewsPage(
                agrimodel: widget.agrimodel,
                index: index,
              )),

      //other children
    );
  }
}
