import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motivational/core/assets/assets.gen.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/theme/app_theme.dart';
import 'package:motivational/src/core/theme/typography.dart';
import 'package:motivational/src/core/widgets/cache_image_viewer.dart';
import 'package:motivational/src/core/widgets/context.extension.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';
import 'package:motivational/src/features/home/bloc/favorite_saver/favorite_saver_cubit.dart';
import 'package:motivational/src/features/home/domain/enum/image_type_enum.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    context.read<FavoriteSaverCubit>().getList();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchText = _searchController.text.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text("Favorites"),
            floating: true,
            bottom: AppBar(
              automaticallyImplyLeading: false,
              title: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search favorites...',
                  hintStyle: AppStyles.text13PxMedium.textGrey,
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 20.verticalSpace,
          ),
          BlocBuilder<FavoriteSaverCubit, FavoriteSaverState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return _buildEmptyState(context);
                },
                getList: (quotesModel) {
                  final filteredQuotes = quotesModel.where((quote) {
                    return quote.content.toLowerCase().contains(_searchText) || quote.author.toLowerCase().contains(_searchText);
                  }).toList();

                  if (filteredQuotes.isEmpty) {
                    return _buildEmptyState(context);
                  } else {
                    return SliverList.builder(
                      itemCount: filteredQuotes.length,
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
                                      "${filteredQuotes[index].content} - ${filteredQuotes[index].author}",
                                      style: AppStyles.text13PxMedium,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<FavoriteSaverCubit>().removeFromList(filteredQuotes[index]);
                                      context.showSnackbar(
                                        title: 'Success!',
                                        message: "Removed from favorites",
                                      );
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: AppColors.statusRed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppCacheImageViewer(
              imageUrl: Assets.images.favorite.path,
              imageTypeEnum: ImageTypeEnum.assets,
            ),
            20.verticalSpace,
            Text(
              "No favorites found!",
              style: AppStyles.text20Px.textGrey,
            ),
          ],
        ),
      ),
    );
  }
}
