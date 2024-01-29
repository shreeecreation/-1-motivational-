import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:motivational/src/core/cache/manager.dart';
import 'package:motivational/src/features/home/domain/constant/painter_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'painter_saver_state.dart';
part 'painter_saver_cubit.freezed.dart';

class PainterSaverCubit extends Cubit<PainterSaverState> {
  PainterSaverCubit()
      : super(PainterSaverState.mode(
          color: PainterConstatnt.painterConstant.first,
        ));

  final Logger logger = Logger('PainterSaverCubit');

  Future<void> getPainter() async {
    Color defaultColor = PainterConstatnt.painterConstant.first;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final selectedColor = prefs.getInt('selectedColor');
    final selectedImage = prefs.getString('selectedImage');

    if (selectedColor != null) {
      emit(
        PainterSaverState.mode(
          color: Color(selectedColor),
          image: selectedImage,
        ),
      );
    } else {
      emit(PainterSaverState.mode(color: defaultColor, image: selectedImage));
    }
  }

  void saveColor(Color color) async {
    final _state = state as _Mode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedColor', color.value);
    logger.info('Color saved: ${color.toString()}');

    emit(PainterSaverState.mode(color: color, image: _state.image));
  }

  Future<void> selectImage(String image) async {
    final _state = state as _Mode;
    final _localImage = await AppCacheManager.manager.getSingleFile(image);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedImage', _localImage.path);
    emit(PainterSaverState.mode(image: _localImage.path, color: _state.color));
  }

  Future<void> setLocalImage(String image) async {
    final _state = state as _Mode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedImage', image);
    emit(PainterSaverState.mode(image: image, color: _state.color));
  }
}
