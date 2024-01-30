part of 'sound_bloc.dart';

@freezed
class SoundState with _$SoundState {
  const factory SoundState.initial() = _Initial;
  const factory SoundState.audioChanged(String audioPath) = _AudioChanged;
  const factory SoundState.audioToggle(bool toggleValue) = _AudioToggled;
}