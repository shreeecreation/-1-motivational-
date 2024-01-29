import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:motivational/src/core/routes/routes.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/context.extension.dart';
import 'package:motivational/src/core/widgets/custom_button.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';
import 'package:motivational/src/features/auth/screens/auth_bottom_sheet.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<GetRandomQuotesCubit>().getRandomQuotes();
    context.read<PainterSaverCubit>().getPainter();
  }

  int page = 0;

  @override
  Widget build(BuildContext context) {
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
        child: ScaffoldWrapper(
          body: Stack(
            children: [
              BlocBuilder<GetRandomQuotesCubit, GetRandomQuotesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    success: (data, _, hasMoreItems) {
                      return PageView.builder(
                        onPageChanged: (value) {
                          page = value;
                          if (page == data.length - 2) {
                            context
                                .read<GetRandomQuotesCubit>()
                                .addMoreRandomQuotes();
                          }
                        },
                        scrollDirection: Axis.vertical,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return QuoteViewer(quote: data[index]);
                        },
                      );
                    },
                  );
                },
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
        ),
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
            label: 'Sound On',
            labelStyle: AppStyles.text11Px,
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
