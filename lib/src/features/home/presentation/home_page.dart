import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motivational/src/core/routes/routes.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/custom_button.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';
import 'package:motivational/src/features/home/bloc/get_random/get_random_quotes_cubit.dart';
import 'package:motivational/src/features/home/bloc/painter_saver/painter_saver_cubit.dart';
import 'package:motivational/src/features/home/bloc/share/share_cubit.dart';
import 'package:motivational/src/features/home/presentation/widgets/quote_viewer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScreenshotController screenshotController;
  @override
  void initState() {
    super.initState();
    screenshotController = ScreenshotController();
    context.read<GetRandomQuotesCubit>().getRandomQuotes();
    context.read<PainterSaverCubit>().getPainter();
  }

  int page = 0;

  @override
  Widget build(BuildContext context) {
    final backgroundElement = context.watch<PainterSaverCubit>().state;

    return BlocProvider(
      create: (context) => ShareCubit(),
      child: BlocListener<ShareCubit, ShareState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => null,
            success: (image) {
              Share.shareXFiles(
                [XFile(image)],
                subject: 'Made with Motivator App',
              );
            },
          );
        },
        child: Builder(builder: (context) {
          return ScaffoldWrapper(
            body: Stack(
              children: [
                // I changes because I just want to keep the background image static
                Screenshot(
                  controller: screenshotController,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: backgroundElement.image == null || backgroundElement.image == ''
                            ? const SizedBox.shrink()
                            : Image.file(
                                File(backgroundElement.image!),
                                fit: BoxFit.cover,
                              ),
                      ),
                      BlocBuilder<GetRandomQuotesCubit, GetRandomQuotesState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => const SizedBox.shrink(),
                            success: (data, _, hasMoreItems) {
                              return PageView.builder(
                                onPageChanged: (value) {
                                  page = value;
                                  if (page == data.length - 2) {
                                    context.read<GetRandomQuotesCubit>().addMoreRandomQuotes();
                                  }
                                },
                                scrollDirection: Axis.vertical,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return QuoteViewer(
                                    quote: data[index],
                                    screenshotController: screenshotController,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0, left: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomWidget(),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: CustomButton.iconText(
            label: '',
            labelStyle: AppStyles.text12PxMedium,
            onPressed: () {},
            icon: const Icon(CupertinoIcons.speaker_1_fill),
          ),
        ),
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColors.statusRed,
              ),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.paintPage);
                },
                icon: const Icon(
                  Icons.format_paint_outlined,
                ),
              ),
            ),
            15.horizontalSpace,
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: AppColors.statusRed,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                ),
              ),
            ),
            15.horizontalSpace,
          ],
        ),
      ],
    );
  }
}
