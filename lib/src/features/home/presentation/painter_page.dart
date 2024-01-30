import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motivational/src/core/theme/app_colors.dart';
import 'package:motivational/src/core/theme/app_styles.dart';
import 'package:motivational/src/core/widgets/cache_image_viewer.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';
import 'package:motivational/src/features/home/bloc/image/image_cubit.dart';
import 'package:motivational/src/features/home/bloc/painter_saver/painter_saver_cubit.dart';
import 'package:motivational/src/features/home/domain/enum/image_type_enum.dart';

import '../domain/constant/painter_constant.dart';

class PainterPage extends StatelessWidget {
  const PainterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text("Choose background"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Plain",
              style: AppStyles.text20PxMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PainterConstatnt.painterConstant.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        context.read<PainterSaverCubit>().saveColor(PainterConstatnt.painterConstant[index]);
                      },
                      child: Card(
                        elevation: 0.8,
                        color: PainterConstatnt.painterConstant[index],
                        child: const SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Images', style: AppStyles.text20PxMedium),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ImageCubit, ImageState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: Container.new,
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    success: (images) {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: images.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return GestureDetector(
                              onTap: () async {
                                final image = await ImagePicker().pickImage(source: ImageSource.gallery);

                                if (image != null) {
                                  context.read<PainterSaverCubit>().setLocalImage(image.path);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Card(
                                elevation: 0.8,
                                child: Icon(Icons.add),
                              ),
                            );
                          }
                          if (index == 1) {
                            return GestureDetector(
                              onTap: () async {
                                final image = await ImagePicker().pickImage(source: ImageSource.gallery);

                                if (image != null) {
                                  context.read<PainterSaverCubit>().setLocalImage(image.path);
                                }
                              },
                              child: GestureDetector(
                                onTap: () {
                                  context.read<PainterSaverCubit>().setLocalImage('');
                                  Navigator.pop(context);
                                },
                                child: const Card(
                                  elevation: 0.8,
                                  color: AppColors.transparent,
                                  child: Center(child: Text("Remove")),
                                ),
                              ),
                            );
                          }
                          final image = images[index - 2];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              context.read<PainterSaverCubit>().selectImage(image);
                            },
                            child: Card(
                                elevation: 0.8,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    child: AppCacheImageViewer(imageUrl: image, imageTypeEnum: ImageTypeEnum.network))),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
