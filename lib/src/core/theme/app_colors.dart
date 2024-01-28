import 'package:flutter/material.dart';

abstract class AppColors {
//theme primary color
  static const Color primary = Color(0xFF09bc8a);

  //text colors
  static const Color textDark = Color(0xFF222222);
  static const Color textLightDark = Color(0xff666666);
  static const Color textLight = Color(0xFFCFCFCF);
  static const Color textGrey = Color(0xFF999999);
  static const Color shadow = Color(0xFFF4F6F9);
  static const Color textBlue = Color(0xFF3E64D2);
  static const Color lightWhite = Color(0xffD5D5F6);

  //status color
  static const Color statusRed = Color(0xFFD23E3E);
  static const Color statusLightRed = Color(0xFFF9E3E3);
  static const Color statusGreen = Color(0xFF4CD964);
  static const Color statusOrange = Color(0xFFFF9212);

  // background colors
  static const Color scaffoldBackground = Color(0xFFF5F5F7);
  static const Color fabRedBackground = Color(0xFFFD6464);
  static const Color brandBackground = Color(0xFFEBEFF9);
  static const Color brandBackgroundLight = Color(0xFFABC4F1);
  static const Color secondaryButtonBackground = Color(0xFFEBEBEB);

  //default
  static const Color border = Color(0xFFD6D6D6);
  static const Color dashBorder = Color(0xFFABC4F1);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
  static const fadedBlack = Color(0x0000000D);
  static const dividerColor = Color(0xff7472E0);
  static const Color lightPrimary = Color(0xffE9F8FF);

  static const Color softPrimary = Color(0xff150B3D);

  static const Color softBlack = Color(0xff524B6B);

  static const Color softGrey = Color(0xffD6CDFE);
  static const Color textFieldLabel = Color(0xffEFF2F6);
  static const Color greyColor = Color(0xFFDDDDDD);
  // F4F6FA
  static const Color lightGrey = Color(0XFFF4F6FA);
  static const Color yellow = Color(0xffFCC515);

  static const LinearGradient userGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.primary,
      AppColors.softPrimary,
      AppColors.primary,
    ],
  );

  static const LinearGradient appBarGradient = LinearGradient(
    colors: [
      Color(0xff32C6A8),
      Color(0xff58D876),
    ],
  );

  //shimmer color
  static Color shimmerBaseColor = Colors.grey.shade300;
  static Color shimmerHighlightColor = Colors.grey.shade100;

  // text
  static const Color softTextGrey = Color(0xff4C4C4C);
  // 929292
  static const Color ironGrey = Color(0xff929292);
}
