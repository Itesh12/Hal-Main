import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData lightTheme({required bool isHindi}) {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: white,
        secondary: deepOrange,
        onSecondary: white,
        tertiary: lightOrange,
        error: redError,
        onError: redError,
        background: white,
        onBackground: brown,
        surface: primary,
        onSurface: brown,
      ),
      primaryColor: primary,
      primarySwatch: primaryMaterial,
      useMaterial3: false,
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.transparent,
      textTheme: hindiTextTheme,
      highlightColor: Colors.transparent,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: white,
            shape: const StadiumBorder(),
            minimumSize: Size(221.w, 47)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          minimumSize: Size(221.w, 47),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: brown,
        centerTitle: true,
        elevation: 0,
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          )),
    );
  }

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final hindiTextTheme = TextTheme(
    displaySmall: TextStyle(fontSize: 54.sp),
    headlineLarge: TextStyle(fontSize: 42.sp),
    headlineMedium: TextStyle(fontSize: 38.sp, fontWeight: _bold),
    headlineSmall: TextStyle(fontSize: 20.sp, fontWeight: _medium),
    titleLarge: TextStyle(fontSize: 24.sp, fontWeight: _semiBold),
    titleMedium: TextStyle(fontSize: 20.sp),
    titleSmall: TextStyle(fontSize: 16.sp, fontWeight: _semiBold),
    bodyLarge: TextStyle(fontSize: 16.sp),
    bodyMedium: TextStyle(fontSize: 14.sp),
    bodySmall: TextStyle(fontSize: 12.sp),
    labelLarge: TextStyle(fontSize: 16.sp, fontWeight: _semiBold),
    labelMedium: TextStyle(fontSize: 13.sp),
    labelSmall: TextStyle(fontSize: 11.sp, fontWeight: _bold),
  ).apply(
    fontFamily: 'Mukta',
    displayColor: brown,
    bodyColor: brown,
  );

  static final englishTextTheme = TextTheme(
    displaySmall: TextStyle(fontSize: 46.sp),
    headlineLarge: TextStyle(fontSize: 38.sp),
    headlineMedium: TextStyle(fontSize: 33.sp, fontWeight: _semiBold),
    headlineSmall: TextStyle(fontSize: 18.sp, fontWeight: _medium),
    titleLarge: TextStyle(fontSize: 20.sp, fontWeight: _semiBold),
    titleMedium: TextStyle(fontSize: 18.sp),
    titleSmall: TextStyle(fontSize: 14.sp, fontWeight: _semiBold),
    bodyLarge: TextStyle(fontSize: 12.sp),
    bodyMedium: TextStyle(fontSize: 11.sp, fontWeight: _regular),
    bodySmall: TextStyle(fontSize: 10.sp),
    labelLarge: TextStyle(fontSize: 14.sp, fontWeight: _semiBold),
    labelMedium: TextStyle(fontSize: 11.sp),
    labelSmall: TextStyle(fontSize: 10.sp, fontWeight: _bold),
  ).apply(
    fontFamily: 'Mukta',
    displayColor: brown,
    bodyColor: brown,
  );
}
