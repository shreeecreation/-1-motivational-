part of 'image_cubit.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.initial() = _Initial;
  const factory ImageState.loading() = _Loading;
  const factory ImageState.success({
    required List<String> image,
  }) = _Success;
  const factory ImageState.error({String? error}) = _Error;
}
