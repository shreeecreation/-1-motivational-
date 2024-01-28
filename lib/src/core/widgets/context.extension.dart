import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/widgets/snackbar.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get size => MediaQuery.of(this).size;

  void showSnackbar({
    required String title,
    required String message,
    bool error = false,
  }) {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: SnackbarWidget(
            title: title,
            message: message,
            error: error,
          ),
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: error ? AppColors.statusLightRed : AppColors.brandBackgroundLight,
          padding: EdgeInsets.zero,
          elevation: 0,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(20),
        ),
      );
  }
}
