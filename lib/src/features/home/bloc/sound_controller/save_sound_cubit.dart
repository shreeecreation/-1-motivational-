import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/core/logigng.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'save_sound_state.dart';
part 'save_sound_cubit.freezed.dart';

class SaveSoundCubit extends Cubit<SaveSoundState> {
  SaveSoundCubit() : super(const SaveSoundState.initial());

  void saveSound(int soundPathIndex) async {
    final _state = state as _SaveSound;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('sound', soundPathIndex);
    logger.info('Sound saved: ${soundPathIndex.toString()}');
    emit(SaveSoundState.saveSound(soundPathIndex: soundPathIndex));
  }

  Future<int> getSound() async {
    emit(const SaveSoundState.initial());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final soundPath = prefs.getInt('sound');
    emit(SaveSoundState.saveSound(soundPathIndex: soundPath ?? 0));
    return soundPath ?? 0;
  }
}
