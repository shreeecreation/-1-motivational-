import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/quotes_model.dart';
part 'favorite_saver_state.dart';
part 'favorite_saver_cubit.freezed.dart';

class FavoriteSaverCubit extends Cubit<FavoriteSaverState> {
  FavoriteSaverCubit() : super(FavoriteSaverState.initial());
  static const String quotesKey = 'quotes';

  void addToList(QuotesModel quote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      List<String>? existingQuotesJsonList = prefs.getStringList(quotesKey) ?? [];

      String quoteJson = jsonEncode(quote.toJson());

      existingQuotesJsonList.add(quoteJson);

      await prefs.setStringList(quotesKey, existingQuotesJsonList);
    } catch (e) {
      print(e.toString());
    }
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
      if (state is _Success) {
        final _state = state as _Success;
        final response = existingQuotesJsonList.map((quoteJson) => QuotesModel.fromJson(jsonDecode(quoteJson))).toList();
        emit(_state.copyWith(quotesModel: response));
      }
    } catch (e) {}
  }

  void getList() async {
    emit(FavoriteSaverState.loading());
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      List<String>? quotesJsonList = prefs.getStringList(quotesKey);

      if (quotesJsonList != null) {
        final quotes = quotesJsonList.map((quoteJson) => QuotesModel.fromJson(jsonDecode(quoteJson))).toList();

        emit(FavoriteSaverState.success(quotesModel: quotes));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
