import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/model/quotes_model.dart';

part 'toggle_favorite_state.dart';
part 'toggle_favorite_cubit.freezed.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  ToggleFavoriteCubit() : super(const ToggleFavoriteState.toggle(value: false));
  static const String quotesKey = 'quotes';

  void containsQuote(QuotesModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      List<String>? quotesJsonList = prefs.getStringList(quotesKey);
      if (quotesJsonList != null) {
        final quotes = quotesJsonList.map((quoteJson) => QuotesModel.fromJson(jsonDecode(quoteJson))).toList();
        if (quotes.contains(model)) {
          if (state is _Success) {
            print(state);
            final _state = state as _Success;

            emit(_state.copyWith(value: true));
          } else {
            emit(const ToggleFavoriteState.toggle(value: true));
          }
        } else {
          if (state is _Success) {
            final _state = state as _Success;
            emit(_state.copyWith(value: false));
          } else {
            emit(const ToggleFavoriteState.toggle(value: false));
          }
        }
      }
    } catch (e) {}
    print(state);
  }
}
