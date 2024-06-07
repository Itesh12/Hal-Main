import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../l10n/l10n.dart';

class QuickButtonsRow extends StatelessWidget {
  const QuickButtonsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
        // scrollDirection: Axis.horizontal,
        children: [
          QuickButton(
              icon: "add_white",
              label: "Create\nPost",
              onTap: () {
                context.router.push(const CreatePostRoute());
              }),
          QuickButton(
            icon: "ask_expert_b",
            label: 'Contact\nSupport',
            onTap: () async {
              final Uri contactUrl = Uri(
                scheme: 'tel',
                path: "+911356170900",
              );
              await launchUrl(contactUrl);
            },
          ),
          QuickButton(
            icon: "disease_detection",
            label: "Crop\nIntelligence",
            onTap: () {
              context.pushRoute(const DiseaseDetectionRoute());
            },
          ),
          // QuickButton(
          //   icon: "mandi_bhao",
          //   label: AppLocalizations.of(context)!.mandi_bhav,
          //   onTap: () {
          //     context.pushRoute(const MandiBhavRoute());
          //   },
          // ),
//           QuickButton(icon: "community", label: "Community", onTap: () {
// context.router.push(MapRoute());
//           },),
        ],
      ),
    );
  }
}

class QuickButton extends StatelessWidget {
  const QuickButton({
    Key? key,
    required this.icon,
    this.onTap,
    required this.label,
  }) : super(key: key);

  final String icon;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        children: [
          MaterialButton(
            onPressed: onTap ?? () {},
            height: 58.w,
            minWidth: 58.w,
            shape: const CircleBorder(),
            color: brown,
            child: SvgPicture.asset(
              "assets/images/$icon.svg",
              // color: white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(label,textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
