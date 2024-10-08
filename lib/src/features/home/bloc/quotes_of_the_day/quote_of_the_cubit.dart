import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/core/base/internet_checker.dart';
import 'package:motivational/src/core/clients/pocket_base_client.dart';
import 'package:motivational/src/features/home/domain/model/quotes_model.dart';

part 'quote_of_the_cubit.freezed.dart';

@freezed
class QuoteOfTheDayState with _$QuoteOfTheDayState {
  const factory QuoteOfTheDayState.initial() = _Initial;
  const factory QuoteOfTheDayState.loading() = _Loading;
  const factory QuoteOfTheDayState.success({
    required QuotesModel quoteOfTheDay,
  }) = _Success;
  const factory QuoteOfTheDayState.noInternet() = _NoInternet;
  const factory QuoteOfTheDayState.error({String? error}) = _Error;
}

class QuoteOfTheCubit extends Cubit<QuoteOfTheDayState> {
  QuoteOfTheCubit() : super(const QuoteOfTheDayState.initial());

  final pb = PocketBaseClient();
  final NetworkInfo _networkInfo = NetworkInfo();

  void getQuoteOfTheDay() async {
    emit(const QuoteOfTheDayState.loading());
    if (await _networkInfo.isConnected) {
      try {
        pb.client.collection('quotesoftheday').getOne("1oo7c8bzll04ugy").then((response) {
          final quoteOfTheDay = QuotesModel.fromJson(response.data);
          emit(QuoteOfTheDayState.success(quoteOfTheDay: quoteOfTheDay));
        });
      } catch (e) {
        emit(const QuoteOfTheDayState.error());
      }
    } else {
      emit(const QuoteOfTheDayState.noInternet());
    }
  }
}
