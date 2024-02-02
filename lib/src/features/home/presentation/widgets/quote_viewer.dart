import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motivational/core/assets/assets.gen.dart';
import 'package:motivational/src/core/repository/auth_repository.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/context.extension.dart';
import 'package:motivational/src/features/auth/screens/auth_bottom_sheet.dart';
import 'package:motivational/src/features/home/bloc/favorite_saver/favorite_saver_cubit.dart';
import 'package:motivational/src/features/home/bloc/painter_saver/painter_saver_cubit.dart';
import 'package:motivational/src/features/home/bloc/share/share_cubit.dart';
import 'package:motivational/src/features/home/domain/model/quotes_model.dart';
import 'package:screenshot/screenshot.dart';
import 'package:lottie/lottie.dart';

class QuoteViewer extends StatelessWidget {
  QuoteViewer({Key? key, required this.quote, required this.screenshotController}) : super(key: key);
  final QuotesModel quote;
  final ScreenshotController screenshotController;
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final backgroundElement = context.watch<PainterSaverCubit>().state;
    return Stack(
      children: [
        Positioned.fill(
          child: ColoredBox(
            color: backgroundElement.color!.withOpacity(backgroundElement.isImage
                ? backgroundElement.isTransparent
                    ? .0
                    : .7
                : 1),
          ),
        ),
        Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              quote.content,
                              textAlign: TextAlign.center,
                              style: AppStyles.text14PxMedium,
                            ),
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              BlocBuilder<ShareCubit, ShareState>(
                                builder: (context, state) => state.maybeWhen(
                                  orElse: SizedBox.shrink,
                                  inProgress: () {
                                    return Row(
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(6),
                                            child: Image.asset(
                                              'assets/images/logo.png',
                                              height: 20,
                                              width: 20,
                                            )),
                                        5.horizontalSpace,
                                        Text(
                                          'Motivator: Quotes for Motivation',
                                          style: AppStyles.text11PxMedium,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '- ${quote.author}',
                                style: AppStyles.text11Px,
                              ),
                            ],
                          ),
                        ],
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: _isVisible,
                        builder: (context, value, child) {
                          return Visibility(
                              visible: value,
                              child: Center(child: SizedBox(height: 150, width: 150, child: Lottie.asset(Assets.lottie.favorite, repeat: false))));
                        },
                      )
                    ],
                  ),
                ),
                BlocBuilder<ShareCubit, ShareState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => Positioned(
                        bottom: (MediaQuery.of(context).viewInsets.bottom + MediaQuery.of(context).viewPadding.bottom) +
                            (MediaQuery.of(context).size.height * 0.2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<ShareCubit>().share(screenshotController);
                              },
                              icon: const Icon(
                                Icons.ios_share,
                                size: 30,
                              ),
                            ),
                            12.horizontalSpace,
                            IconButton(
                              onPressed: () {
                                _isVisible.value = true;
                                Future.delayed(const Duration(milliseconds: 1500), () {
                                  _isVisible.value = false;
                                });

                                if (AuthRepository().authRepository.isSignedIn) {
                                  context.read<FavoriteSaverCubit>().addToList(quote);
                                  context.showSnackbar(title: "Success !", message: "Added to Favorites");
                                } else {
                                  AuthBottomSheet.show(context);
                                }
                              },
                              icon: const Icon(
                                Icons.favorite_outline,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      inProgress: SizedBox.shrink,
                    );
                  },
                ),
                const SizedBox(height: 150),
              ],
            ),
          );
        }),
      ],
    );
  }
}

bool isColorDark(Color color) {
  // Calculate the luminance of the color
  double luminance = color.computeLuminance();

  // Choose a threshold value based on your preference
  // You can experiment with different threshold values
  double threshold = 0.5;

  // Determine if the color is dark or light based on the threshold
  return luminance < threshold;
}
