import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:kisaan_station/src/view/lang/widgets/lang_tile.dart';

import '../../../l10n/l10n.dart';
import '../../../util/services/shared_preferences.dart';

final languageProvider =
    StateNotifierProvider<LanguageController, Locale>((ref) {
  return LanguageController(ref);
});

class LanguageController extends StateNotifier<Locale> {
  final Ref ref;

  LanguageController(this.ref) : super(Locale(UserPreferences.language));

  void setLocale() {
    final code = ref.read(chooseLang);
    if (!L10n.all.contains(Locale(code))) return;
    state = Locale(code);
    UserPreferences.setLanguage(code);
    if (code != 'te') {
      GetTimeAgo.setDefaultLocale(UserPreferences.language);
    } else {
      // GetTimeAgo.setCustomLocaleMessages('en', TeluguMessages());
    }
  }
}

// class TeluguMessages implements Messages {
//   @override
//   String prefixAgo() => '';
//
//   @override
//   String suffixAgo() => 'క్రితం';
//
//   @override
//   String secsAgo(int seconds) => '$seconds సెకండ్స్';
//
//   @override
//   String minAgo(int minutes) => 'ఒక నిమిషం';
//
//   @override
//   String minsAgo(int minutes) => '$minutes నిమిషాలు';
//
//   @override
//   String hourAgo(int minutes) => 'ఒక గంట';
//
//   @override
//   String hoursAgo(int hours) => '$hours గంటలు';
//
//   @override
//   String dayAgo(int hours) => 'ఒక రోజు';
//
//   @override
//   String daysAgo(int days) => '$days రోజులు';
//
//   @override
//   String wordSeparator() => ' ';
// }
