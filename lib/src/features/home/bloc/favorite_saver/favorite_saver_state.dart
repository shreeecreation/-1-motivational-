part of 'favorite_saver_cubit.dart';

@freezed
class FavoriteSaverState with _$FavoriteSaverState {
  const factory FavoriteSaverState.initial() = _Initial;
  const factory FavoriteSaverState.loading() = _Loading;
  const factory FavoriteSaverState.success({@Default([]) List<QuotesModel> quotesModel}) = _Success;
  const factory FavoriteSaverState.error() = _Error;
  
}