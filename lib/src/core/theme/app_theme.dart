import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivational/src/core/theme/typography.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    textTheme: GoogleFonts.rubikTextTheme(),
    useMaterial3: true,
    fontFamily: GoogleFonts.rubik().fontFamily,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary, primary: AppColors.primary),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.scaffoldBackground,
      surfaceTintColor: AppColors.scaffoldBackground,
      systemOverlayStyle: SystemUiOverlayStyle(
        // statusBarColor: AppColors.scaffoldBackground,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.dividerColor.withOpacity(.2),
      thickness: 1,
      space: 0,
    ),
    tabBarTheme: TabBarTheme(
      indicator: const BoxDecoration(
        color: AppColors.white,
      ),
      labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
      labelStyle: AppStyles.text14PxBold.textDark,
      labelColor: AppColors.textDark,
      unselectedLabelColor: AppColors.textLight,
      overlayColor: MaterialStateProperty.all(AppColors.transparent),
      unselectedLabelStyle: AppStyles.text14PxBold.textLight,
    ),
    splashColor: AppColors.white,
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w).copyWith(bottom: 20.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
      filled: true,
      hintStyle: AppStyles.text16Px.textGrey,
      fillColor: AppColors.white,
      constraints: BoxConstraints(
        minHeight: 48.h,
        maxWidth: double.infinity,
        minWidth: double.infinity,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
