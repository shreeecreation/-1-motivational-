import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';


extension TypographyExtension on TextStyle {
  //colors
  TextStyle get primary => copyWith(color: AppColors.primary);

  TextStyle get textDark => copyWith(color: AppColors.textDark);

  TextStyle get textBlue => copyWith(color: AppColors.textBlue);

  TextStyle get textLight => copyWith(color: AppColors.textLight);

  TextStyle get textGrey => copyWith(color: AppColors.textGrey);

  TextStyle get statusRed => copyWith(color: AppColors.statusRed);

  TextStyle get statusGreen => copyWith(color: AppColors.statusGreen);

  TextStyle get statusLightRed => copyWith(color: AppColors.statusLightRed);

  TextStyle get softTextGrey => copyWith(color: AppColors.softTextGrey);

  TextStyle get ironGrey => copyWith(color: AppColors.ironGrey);

  TextStyle get brandBackground => copyWith(color: AppColors.brandBackground);
  TextStyle get brandBackgroundLight =>
      copyWith(color: AppColors.brandBackgroundLight);

  TextStyle get white => copyWith(color: AppColors.white);

  TextStyle get black => copyWith(color: AppColors.black);

  TextStyle get lightWhiteColor => copyWith(color: AppColors.lightWhite);

  TextStyle get lightPrimary => copyWith(color: AppColors.lightPrimary);

  TextStyle get softPrimary => copyWith(color: AppColors.softPrimary);

  //line height
  TextStyle lineHeight(double px) =>
      copyWith(height: AppStyles.calculateHeight(px, fontSize!));

  // letter spacing
  TextStyle spacing(double em) =>
      copyWith(height: AppStyles.calculateSpacing(em));
}