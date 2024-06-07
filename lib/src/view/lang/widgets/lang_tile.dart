import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import '../../../model/lang/language.dart';

final chooseLang = StateProvider<String>((ref) => UserPreferences.language);

class LanguageTile extends ConsumerWidget {
  const LanguageTile({
    Key? key,
    required this.lang,
  }) : super(key: key);

  final Lang lang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final String groupValue = ref.watch(chooseLang);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: lang.available ? deepOrange : const Color(0xffDADADA),
        radius: 30.r,
        child: Text(
          lang.avatar,
          style: TextStyle(
            color: white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      title: Text(
        lang.title,
        style: lang.available
            ? textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500)
            : TextStyle(fontSize: 18.sp, color: lightGrey),
      ),
      subtitle: Text(lang.lang,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: lang.available ? const Color(0xff8F8F8F) : lightGrey)),
      trailing: lang.available
          ? Radio<String>(
              value: lang.code,
              groupValue: groupValue,
              onChanged: (loc) {
                ref.read(chooseLang.notifier).state = loc!;
              },
              activeColor: lang.available ? primary : lightGrey,
            )
          : Container(
              width: 22.w,
              height: 22.h,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration:
                  const BoxDecoration(color: lightGrey, shape: BoxShape.circle),
              child: Center(
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  decoration:
                      const BoxDecoration(color: white, shape: BoxShape.circle),
                ),
              ),
            ),
    );
  }
}
