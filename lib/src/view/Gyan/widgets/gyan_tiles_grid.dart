import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';

import '../../../l10n/l10n.dart';
import 'gyan_tiles.dart';

class GyanTilesGrid extends StatelessWidget {
  const GyanTilesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KrishiGyanTiles(
              topColor: const Color(0xffFFCA6F),
              bottomColor: const Color(0xffFFA303),
              image: 'assets/images/cropinfo.svg',
              label: AppLocalizations.of(context)!.crop_info,
              ontap: () {
                context.router.push(const AgriNewsRoute());
              },
            ),
            KrishiGyanTiles(
              topColor: const Color(0xffFFCA6F),
              bottomColor: const Color(0xffFFA303),
              image: 'assets/images/govt_scheme.svg',
              label: AppLocalizations.of(context)!.govt_scheme,
              ontap: () {
                context.router.push(const AgriNewsRoute());
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KrishiGyanTiles(
              topColor: const Color(0xffE36E26),
              bottomColor: const Color(0xffFD975C),
              image: 'assets/images/farmingequip.svg',
              label: AppLocalizations.of(context)!.farming_equip,
              ontap: () {
                context.router.push(const AgriNewsRoute());
              },
            ),
            KrishiGyanTiles(
              topColor: const Color(0xffE36E26),
              bottomColor: const Color(0xffFD975C),
              image: 'assets/images/agribusiss.svg',
              label: AppLocalizations.of(context)!.agri_based_business,
              ontap: () {
                context.router.push(const AgriNewsRoute());
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KrishiGyanTiles(
              topColor: const Color(0xff563F1F),
              bottomColor: const Color(0xff7D5113),
              image: 'assets/images/AgriNewsRoute.svg',
              label: AppLocalizations.of(context)!.agri_news,
              ontap: () {
                context.router.push(const AgriNewsRoute());
              },
            ),
            KrishiGyanTiles(
              topColor: const Color(0xff563F1F),
              bottomColor: const Color(0xff7D5113),
              image: 'assets/images/jugaad.svg',
              label: AppLocalizations.of(context)!.jugaad,
              ontap: () {
                context.router.push(const AgriNewsRoute());
              },
            ),
          ],
        ),
      ],
    );
  }
}
