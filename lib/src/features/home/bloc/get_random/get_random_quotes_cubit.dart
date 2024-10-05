import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/core/base/internet_checker.dart';
import 'package:motivational/src/core/clients/pocket_base_client.dart';
import 'package:motivational/src/features/home/domain/model/quotes_model.dart';
part 'get_random_quotes_state.dart';
part 'get_random_quotes_cubit.freezed.dart';

class GetRandomQuotesCubit extends Cubit<GetRandomQuotesState> {
  GetRandomQuotesCubit() : super(const GetRandomQuotesState.initial());
  final pb = PocketBaseClient();

  final int _limit = 5;
  int _page = 1;
  int totalItem = 0;

  final NetworkInfo _networkInfo = NetworkInfo();
  late List<QuotesModel> _quotes = [];

  void getRandomQuotes() async {
    _page = 0;
    if (await _networkInfo.isConnected) {
      emit(const GetRandomQuotesState.loading());
      try {
        final response = await pb.client.collection('quotes').getList(
          page: 1,
          perPage: _limit,
          sort: '-created',
          query: {
            // "tags": {"\$in": ["motivational", "inspirational", "success"]},
            // 'is_published': true,
            'sort': "@random"
          },
        );
        totalItem = response.totalItems;
        List<QuotesModel> quotes = response.items.map((quoteData) => QuotesModel.fromJson(quoteData.data)).toList();
        _quotes = quotes;
        emit(GetRandomQuotesState.success(posts: quotes));
      } catch (e) { 
        emit(const GetRandomQuotesState.error());
      }
    } else {
      emit((const GetRandomQuotesState.noInternet()));
    }
  }

  void addMoreRandomQuotes() async {
    if (await _networkInfo.isConnected) {
      try {
        if (_quotes.length >= totalItem) {
          return;
        }
        final response = await pb.client.collection('quotes').getList(
          page: _page + 1,
          perPage: _limit,
          sort: '-created',
          query: {
            // "tags": {"\$in": ["motivational", "inspirational", "success"]},
            // 'is_published': true,
            'sort': "@random"
          },
        );
        List<QuotesModel> quotes = (response.items).map((quoteData) => QuotesModel.fromJson(quoteData.data)).toList();
        if (state is _Success) {
          final _state = state as _Success;
          emit(_state.copyWith(posts: [..._quotes, ...quotes]));
          _quotes = [..._quotes, ...quotes];
        }
      } catch (e) {
        emit(GetRandomQuotesState.error(error: e.toString()));
      }
    } else {
      emit(const GetRandomQuotesState.noInternet());
    }
  }
}
