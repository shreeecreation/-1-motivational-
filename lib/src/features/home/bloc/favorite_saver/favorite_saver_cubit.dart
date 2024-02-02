import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/core/logigng.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/quotes_model.dart';
part 'favorite_saver_state.dart';
part 'favorite_saver_cubit.freezed.dart';

class FavoriteSaverCubit extends Cubit<FavoriteSaverState> {
  FavoriteSaverCubit() : super(const FavoriteSaverState.initial());
  static const String quotesKey = 'quotes';

  Future<void> addToList(QuotesModel quote) async {
    emit(const FavoriteSaverState.loading());
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      List<String>? existingQuotesJsonList = prefs.getStringList(quotesKey) ?? [];

      String newQuoteJson = jsonEncode(quote.toJson());
      if (!existingQuotesJsonList.contains(newQuoteJson)) {
        existingQuotesJsonList.add(newQuoteJson);
      }

      await prefs.setStringList(quotesKey, existingQuotesJsonList);

      emit(const FavoriteSaverState.saveList());
    } catch (e) {
      emit(const FavoriteSaverState.error());
    }
    logger.fine(FavoriteSaverState);
  }

  void removeFromList(QuotesModel quotes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      List<String>? existingQuotesJsonList = prefs.getStringList(quotesKey) ?? [];

      int indexToRemove = existingQuotesJsonList.indexWhere((quoteJson) {
        QuotesModel storedQuote = QuotesModel.fromJson(jsonDecode(quoteJson));
        return storedQuote.content == quotes.content;
      });
      if (indexToRemove != -1) {
        existingQuotesJsonList.removeAt(indexToRemove);
      }

      await prefs.setStringList(quotesKey, existingQuotesJsonList);
      if (state is _GetList) {
        final _state = state as _GetList;
        final response = existingQuotesJsonList.map((quoteJson) => QuotesModel.fromJson(jsonDecode(quoteJson))).toList();
        emit(_state.copyWith(quotesModel: response));
      }
    } catch (e) {
      emit(const FavoriteSaverState.error());
    }
  }

  void getList() async {
    emit(const FavoriteSaverState.loading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      List<String>? quotesJsonList = prefs.getStringList(quotesKey);
      if (quotesJsonList != null) {
        final quotes = quotesJsonList.map((quoteJson) => QuotesModel.fromJson(jsonDecode(quoteJson))).toList();
        emit(FavoriteSaverState.getList(quotesModel: quotes));
      }
    } catch (e) {
      emit(const FavoriteSaverState.error());
    }
  }
}
