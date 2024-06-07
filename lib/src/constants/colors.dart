import 'dart:math';

import 'package:flutter/material.dart';

const Color primary = Color(0xffE26B26);
MaterialColor primaryMaterial = generateMaterialColor(primary);
const Color brown = Color(0xff563F1F);
const Color lightOrange = Color(0xffFFF3D7);
const Color mediumOrange = Color(0xffFBB320);
const Color deepOrange = Color(0xffFAA326);
const Color deepYellow = Color(0xffe26b26);
const Color redError = Color(0xffE22626);
const Color green = Color(0xff18967D);
const Color white = Color(0xffFFFBF3);
const Color whitePrimary = Color(0xffFFFFFF);
const Color grey = Color(0xff878787);
const Color borderGrey = Color(0xffDFDFDF);
const Color hintTextColor = Color(0xffA19DA1);
const Color lightGrey = Color(0xffC4C4C4);
const Color blackGrey = Color(0xff695438);
const Color black = Color(0xff271A11);
const Color blackSplash = Colors.black12;
const Color itemListInActive = Color(0xffF8F9F4);
const Color itemListActive = Color(0xff563E1F);
const Color iconColor = Color(0xff200E32);


const Color orangePrimary = Color(0xff623E13);
// MaterialColor primaryMaterial = generateMaterialColor(orangePrimary);
const Color orange800 = Color(0xffF69D4B);
const Color orange600 = Color(0xffF8B678);
const Color orange400 = Color(0xffFBCEA5);
const Color orange200 = Color(0xffFDE7D2);
const Color orange100 = Color(0xffFEF3E8);

const Color redPrimary = Color(0xffC62828);
const Color red800 = Color(0xffE53935);
const Color red600 = Color(0xffEF5350);
const Color red400 = Color(0xffEF9A9A);
const Color red200 = Color(0xffFFEBEE);

const Color greenPrimary = Color(0xff518000);
const Color green800 = Color(0xff8AB620);
const Color green600 = Color(0xffC5D995);
const Color green400 = Color(0xffF1F6E5);

const Color blackPrimary = Color(0xff171717);
const Color black800 = Color(0xff555555);
const Color black600 = Color(0xff7C7C7C);
const Color black400 = Color(0xffB0B0B0);
const Color black200 = Color(0xffF8F8F8);
const Color black100 = Color(0xffFCFCFC);

const Color greyPrimary = Color(0xffF9FBFE);
const Color brownColor = Color(0xff623E13);
// const Color whitePrimary = Color(0xffFFFFFF);



MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);
