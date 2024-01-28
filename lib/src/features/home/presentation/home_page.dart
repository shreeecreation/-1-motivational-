import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motivational/src/core/routes/routes.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/context.extension.dart';
import 'package:motivational/src/core/widgets/custom_button.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';
import 'package:motivational/src/features/home/bloc/favorite_saver/favorite_saver_cubit.dart';
import 'package:motivational/src/features/home/bloc/get_random/get_random_quotes_cubit.dart';
import 'package:motivational/src/features/home/bloc/painter_saver/painter_saver_cubit.dart';

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
    return ScaffoldWrapper(
      body: Stack(
        children: [
          BlocBuilder<PainterSaverCubit, PainterSaverState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: SizedBox.shrink,
                  loading: () => const Center(child: CircularProgressIndicator()),
                  success: (data) {
                    return Container(
                      color: data,
                    );
                  });
            },
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
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: context.height / 3.5,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      data[index].content,
                                      textAlign: TextAlign.center,
                                      style: AppStyles.text14PxMedium,
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [Text("- " + data[index].author), 20.horizontalSpace],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.ios_share,
                                    size: 35,
                                    color: AppColors.black,
                                  ),
                                ),
                                12.horizontalSpace,
                                IconButton(
                                  onPressed: () {
                                    context.read<FavoriteSaverCubit>().addToList(data[index]);
                                    context.showSnackbar(title: "Success !", message: "Added to Favorites");
                                  },
                                  icon: const Icon(
                                    Icons.favorite_outline,
                                    size: 35,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 150)
                          ],
                        ),
                      );
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
          decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: CustomButton.iconText(
              label: 'Sound On   ',
              labelStyle: AppStyles.text11Px,
              textColor: AppColors.black,
              onPressed: () {},
              icon: const Icon(CupertinoIcons.speaker_1_fill)),
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
                  color: AppColors.white,
                ),
              ),
            ),
            15.horizontalSpace,
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColors.statusRed,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: AppColors.white,
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
