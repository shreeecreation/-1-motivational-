part of 'get_random_quotes_cubit.dart';

@freezed
class GetRandomQuotesState with _$GetRandomQuotesState {
  const factory GetRandomQuotesState.initial() = _Initial;
  const factory GetRandomQuotesState.loading() = _Loading;
  const factory GetRandomQuotesState.success({
    @Default([]) List<QuotesModel> posts,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasMoreItems,
  }) = _Success;
  const factory GetRandomQuotesState.noInternet() = _NoInternet;
  const factory GetRandomQuotesState.error({String? error}) = _Error;
}
