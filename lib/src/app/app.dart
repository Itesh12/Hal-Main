import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/theme/app_theme.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/controller/lang/provider/language_provider.dart';

import '../l10n/l10n.dart';
import 'router/router.dart';

class App extends ConsumerWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp.router(
            builder: (context, child) {
              final isHindi =
                  Localizations.localeOf(context).languageCode == "hi";

              //add this line
              // ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: Theme(
                    data: AppTheme.lightTheme(isHindi: isHindi),
                    child: ScrollConfiguration(
                        behavior: MyBehavior(), child: child!)),
              );
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: primary),
            routerDelegate: AutoRouterDelegate(
              _appRouter,
              navigatorObservers: () => [AppRouteObserver()],
            ),
            routeInformationProvider: _appRouter.routeInfoProvider(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',
            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English, no country code
              Locale('hi'), // Hindi, country code
              Locale('te')  // Telugu
            ],
            locale: locale,
            // localeResolutionCallback:
            //     (userLocale, Iterable<Locale> supportedLocales) {
            //   // for (var locale in supportedLocales) {
            //   //   if (locale.languageCode == userLocale.languageCode &&
            //   //     locale.countryCode == userLocale.countryCode) {
            //   //     return userLocale;
            //   //   }
            //   // }
            //   return supportedLocales.last;
            // },

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
          );
        });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
