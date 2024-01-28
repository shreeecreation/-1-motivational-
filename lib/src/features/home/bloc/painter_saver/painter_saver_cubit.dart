import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'painter_saver_state.dart';
part 'painter_saver_cubit.freezed.dart';

class PainterSaverCubit extends Cubit<PainterSaverState> {
  PainterSaverCubit() : super(PainterSaverState.initial());

  void getPainter() async {
    Color selectedColor = Colors.white;
    emit(PainterSaverState.loading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt('selectedColor');
    if (colorValue != null) {
      selectedColor = Color(colorValue);
    }

    emit(PainterSaverState.success(color: selectedColor));
  }

  void saveColor(Color color) async {
    emit(PainterSaverState.loading());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedColor', color.value);
    print('Color saved: ${color.toString()}');

    if (state is _Success) {
      final _state = state as _Success;

      emit(_state.copyWith(color: color));
    }
  }
}
