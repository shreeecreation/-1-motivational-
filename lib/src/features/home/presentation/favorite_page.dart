import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motivational/core/assets/assets.gen.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/theme/typography.dart';
import 'package:motivational/src/core/widgets/cache_image_viewer.dart';
import 'package:motivational/src/core/widgets/context.extension.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';
import 'package:motivational/src/features/home/bloc/favorite_saver/favorite_saver_cubit.dart';
import 'package:motivational/src/features/home/domain/enum/image_type_enum.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      context.read<FavoriteSaverCubit>().getList();
      return ScaffoldWrapper(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              title: Text("Favorites"),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 20,
              ),
            ),
            BlocBuilder<FavoriteSaverCubit, FavoriteSaverState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: context.height,
                        child: Column(
                          children: [
                            SizedBox(
                                child: AppCacheImageViewer(
                              imageUrl: Assets.images.favorite.path,
                              imageTypeEnum: ImageTypeEnum.assets,
                            )),
                            20.verticalSpace,
                            Text(
                              "No favorites found !",
                              style: AppStyles.text20Px.textGrey,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  getList: (quotesModel) {
                    if (quotesModel.isEmpty) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: context.height,
                          child: Column(
                            children: [
                              SizedBox(
                                  child: AppCacheImageViewer(
                                imageUrl: Assets.images.favorite.path,
                                imageTypeEnum: ImageTypeEnum.assets,
                              )),
                              20.verticalSpace,
                              Text(
                                "No favorites found !",
                                style: AppStyles.text20Px.textGrey,
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return SliverList.builder(
                          itemCount: quotesModel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  elevation: 0.8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: context.width / 1.4,
                                          child: Text(
                                            "${quotesModel[index].content} - ${quotesModel[index].author}",
                                            style: AppStyles.text13PxMedium,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context.read<FavoriteSaverCubit>().removeFromList(quotesModel[index]);
                                            context.showSnackbar(title: 'Success !', message: "Removed from favorites");
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: AppColors.statusRed,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          });
                    }
                  },
                );
              },
            )
          ],
        ),
      );
    });
  }
}
