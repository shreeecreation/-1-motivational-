import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/core/api/api_url.dart';
import 'package:motivational/src/features/home/domain/model/quotes_model.dart';
import 'package:dio/dio.dart';

part 'get_random_quotes_state.dart';
part 'get_random_quotes_cubit.freezed.dart';

class GetRandomQuotesCubit extends Cubit<GetRandomQuotesState> {
  GetRandomQuotesCubit() : super(GetRandomQuotesState.initial());
  final Dio _dio = Dio();

  int _limit = 5;
  late List<QuotesModel> _quotes = [];
  void getRandomQuotes() async {
    emit(GetRandomQuotesState.loading());
    try {
      final response = await _dio.get(ApiUrl.randomQuotes, queryParameters: {"limit": _limit});
      List<QuotesModel> quotes = (response.data as List<dynamic>).map((quoteData) => QuotesModel.fromJson(quoteData)).toList();
      _quotes = quotes;
      emit(GetRandomQuotesState.success(posts: quotes));
    } catch (e) {
      print(e);
    }
  }

  void addMoreRandomQuotes() async {
    try {
      final response = await _dio.get(ApiUrl.randomQuotes, queryParameters: {"limit": _limit});
      List<QuotesModel> quotes = (response.data as List<dynamic>).map((quoteData) => QuotesModel.fromJson(quoteData)).toList();

      if (state is _Success) {
        final _state = state as _Success;
        emit(_state.copyWith(posts: [..._quotes, ...quotes]));
        _quotes = [..._quotes, ...quotes];
      }
    } catch (e) {
      print(e);
    }
  }
}
