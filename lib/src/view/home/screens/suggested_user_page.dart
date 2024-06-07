import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/view/home/widget/suggested_user_tile.dart';

import '../../../constants/colors.dart';

@RoutePage()
class SuggestedUserPage extends StatefulWidget {
  const SuggestedUserPage({Key? key}) : super(key: key);

  @override
  _SuggestedUserPageState createState() => _SuggestedUserPageState();
}

class _SuggestedUserPageState extends State<SuggestedUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: brown,
              )),
          title: Text(
            "Suggested Profiles",
            style: TextStyle(
              fontSize: 20.sp,
              color: brown,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Padding(
          padding: pagePadding,
          child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) => const SuggestedUserTile(
                    isFollowing: true,
                  )),
        ));
  }
}
