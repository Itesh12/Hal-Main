import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/view/Gyan/widgets/latest_news.dart';
import 'package:kisaan_station/src/view/Gyan/widgets/news_carausal.dart';

import '../../../constants/colors.dart';
import '../../../l10n/l10n.dart';

@RoutePage()
class AgriNewsPage extends ConsumerStatefulWidget {
  const AgriNewsPage({Key? key}) : super(key: key);

  @override
  _AgriNewsState createState() => _AgriNewsState();
}

class _AgriNewsState extends ConsumerState<AgriNewsPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        backgroundColor: Colors.white,
        // foregroundColor: onHome ? white : brown,
        // ignore: avoid_bool_literals_in_conditional_expressions
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.agri_news,
          style: TextStyle(
            fontSize: 20.sp,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Builder(builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(
                  right: 20.w, left: 20.w, top: 30.h, bottom: 40.h),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.top_news,
                    style: textTheme.titleMedium!
                        .copyWith(color: brown, fontWeight: FontWeight.bold),
                  ),
                  // const Spacer(),
                  // Text(
                  //   AppLocalizations.of(context)!.view_all,
                  //   style: textTheme.bodyMedium!.copyWith(color: primary),
                  // ),
                ],
              ),
            )),
            const SliverToBoxAdapter(child: NewsCarausal()),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(
                  right: 20.w, left: 20.w, top: 30.h, bottom: 40.h),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.latest_news,
                    style: textTheme.titleMedium!
                        .copyWith(color: brown, fontWeight: FontWeight.bold),
                  ),
                  // const Spacer(),
                  // Text(
                  //   AppLocalizations.of(context)!.view_all,
                  //   style: textTheme.bodyMedium!.copyWith(color: primary),
                  // ),
                ],
              ),
            )),
            const SliverToBoxAdapter(child: LatestNews()),
          ],
        );
      }),
    );
  }
}
