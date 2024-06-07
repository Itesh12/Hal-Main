import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/languages.dart';
import 'package:kisaan_station/src/controller/lang/provider/language_provider.dart';
import 'package:kisaan_station/src/view/lang/widgets/lang_tile.dart';

import '../../../util/services/shared_preferences.dart';

@RoutePage()
class ChooseLanguagePage extends ConsumerWidget {
  const ChooseLanguagePage({Key? key, required this.fromSetting})
      : super(key: key);

  final bool fromSetting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 48.h, 20.w, 48.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: SizedBox(
                  width: 200.w,
                  child: Center(
                    child: Text(
                      'Choose your preferred Language',
                      style: textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => LanguageTile(
                    lang: appLanguages[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                  ),
                  itemCount: appLanguages.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 54.h),
                child: ElevatedButton(
                  onPressed: () {
                    if (fromSetting) {
                      ref.read(languageProvider.notifier).setLocale();
                      context.router.pop();
                    } else {
                      ref.read(languageProvider.notifier).setLocale();
                      UserPreferences.setLangSelect(select: true);
                      context.navigateTo(const WelcomeRoute());
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
