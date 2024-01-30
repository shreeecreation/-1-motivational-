import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/core/repository/unsplash_repository.dart';

part 'image_state.dart';
part 'image_cubit.freezed.dart';

class ImageCubit extends Cubit<ImageState> {
  final UnsplashRepository _unsplashRepository = UnsplashRepository();
  ImageCubit() : super(const ImageState.initial());

  Future<void> getImages() async {
    emit(const ImageState.loading());
    try {
      final images = await _unsplashRepository.fetchImages();
      emit(ImageState.success(image: images));
    } catch (e) {
      emit(const ImageState.error());
    }
  }
}
