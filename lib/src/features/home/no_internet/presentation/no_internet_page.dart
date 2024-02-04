import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:motivational/core/assets/assets.gen.dart';
import 'package:motivational/src/core/routes/routes.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/custom_button.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(Assets.lottie.nointernet, repeat: false),
            Text(
              "No Internet Connection !",
              style: AppStyles.text16Px,
            ),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomButton(
                  label: 'Retry',
                  borderRadius: 20,
                  fullWidth: true,
                  isDisabled: false,
                  textColor: AppColors.white,
                  backgroundColor: AppColors.textBlue,
                  onPressed: () {
                    Get.offNamed(AppRoutes.homePage);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
