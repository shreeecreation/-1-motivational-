part of 'save_sound_cubit.dart';

@freezed
class SaveSoundState with _$SaveSoundState {
  const factory SaveSoundState.initial() = _Initial;
  const factory SaveSoundState.saveSound({required int soundPathIndex}) = _SaveSound;
}
