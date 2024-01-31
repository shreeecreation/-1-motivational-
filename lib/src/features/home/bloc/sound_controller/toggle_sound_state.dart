part of 'toggle_sound_cubit.dart';

@freezed
class ToggleSoundState with _$ToggleSoundState {
  const factory ToggleSoundState.initial() = _Initial;
  const factory ToggleSoundState.toggle({required bool value}) = _Toggle;
}
