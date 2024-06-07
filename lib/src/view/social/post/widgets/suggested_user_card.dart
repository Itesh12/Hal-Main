import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../../constants/networkImages.dart';
import '../../../../l10n/l10n.dart';

class SuggestedUserList extends StatelessWidget {
  const SuggestedUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.suggested_profile,
                style: textTheme.titleSmall!.copyWith(color: brown),
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    context.router.push(const SuggestedUserRoute());
                  },
                  child: Text(
                    AppLocalizations.of(context)!.see_all,
                    style: textTheme.titleSmall!.copyWith(color: primary),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => SuggestedUserCard(
                    imageUrl: urlImages[index],
                    username: 'Raghu Ram',
                    isFollowing: Random().nextBool(),
                  )),
        ),
      ],
    );
  }
}

class SuggestedUserCard extends StatelessWidget {
  const SuggestedUserCard(
      {Key? key,
      required this.imageUrl,
      required this.username,
      required this.isFollowing})
      : super(key: key);
  final String imageUrl;
  final String username;

  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        height: 180,
        width: 151,
        decoration: BoxDecoration(
            color: const Color(0xffF8F2EF),
            borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 75.h,
                    width: 75.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    username,
                    style: textTheme.labelLarge,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(83, 30)),
                    child: Text(
                      isFollowing
                          ? AppLocalizations.of(context)!.follow
                          : AppLocalizations.of(context)!.follow_back,
                      softWrap: false,
                      style:
                          textTheme.labelSmall!.copyWith(color: Colors.white),
                    ),
                  ),
                  8.verticalSpace,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.close,
                  size: 20.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
