part of 'toggle_favorite_cubit.dart';

@freezed
class ToggleFavoriteState with _$ToggleFavoriteState {
  const factory ToggleFavoriteState.initial() = _Initial;
  const factory ToggleFavoriteState.loading() = _Loading;
  const factory ToggleFavoriteState.toggle({required bool value}) = _Success;
}
