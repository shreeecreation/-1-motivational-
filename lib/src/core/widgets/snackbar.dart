import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motivational/src/core/theme/app_styles.dart';

import '../theme/app_colors.dart';

class SnackbarWidget extends StatelessWidget {
  const SnackbarWidget({
    super.key,
    required this.title,
    required this.message,
    this.error = false,
  });

  final String title;
  final String message;
  final bool error;

  Color get bgColor => error ? AppColors.statusRed : AppColors.primary;

  Color get textColor => AppColors.white;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 10.w,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(10)),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: bgColor.withOpacity(.6),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.text14PxMedium.copyWith(color: textColor),
                    ),
                    10.verticalSpace,
                    Text(
                      message,
                      style: AppStyles.text14Px.copyWith(color: textColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
