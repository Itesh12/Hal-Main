import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/util/services/connectivity_service.dart';

import '../../util/services/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    bool isOnline = false;
    // bool sessionEnd = false;
    // final Ref ref;

    isOnline = await ConnectivityService().checkInternetConnection();

    final langSelected = UserPreferences.languageSelected;
    final hasRegistered = UserPreferences.hasRegistered;
    final isAuthenticated = UserPreferences.authToken.isNotEmpty;

    if (isOnline) {
      if (!langSelected) {
        debugPrint('User has not selected the language.');
        router.push(ChooseLanguageRoute(fromSetting: false));
      } else if (langSelected && isAuthenticated && hasRegistered) {
        resolver.next();
        debugPrint('User has Registered.');
      } else if (!hasRegistered) {
        debugPrint('User is not logged in..');
        router.push(const SignUpRoute());
      } else if (!isAuthenticated) {
        debugPrint('User is not logged in..');
        router.push(const SignInRoute());
      } else {
        debugPrint('User has not Registered');
        router.push(const WelcomeRoute());
      }
    } else {
      debugPrint('User is Offline..');
      router.push(const NoInternetRoute());
    }
  }
}
