part of 'favorite_saver_cubit.dart';

@freezed
class FavoriteSaverState with _$FavoriteSaverState {
  const factory FavoriteSaverState.initial() = _Initial;
  const factory FavoriteSaverState.loading() = _Loading;
  const factory FavoriteSaverState.saveList() = _SaveList;
  const factory FavoriteSaverState.getList({@Default([]) List<QuotesModel> quotesModel}) = _GetList;

  const factory FavoriteSaverState.error() = _Error;
  
}