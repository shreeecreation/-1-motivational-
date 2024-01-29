part of 'share_cubit.dart';

@freezed
class ShareState with _$ShareState {
  const factory ShareState.initial() = _Initial;
  const factory ShareState.inProgress() = _Loading;
  const factory ShareState.success({
    required String image,
  }) = _Success;

  const factory ShareState.error({String? error}) = _Error;
}
