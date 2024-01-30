part of 'sound_bloc.dart';

@freezed
class SoundEvent with _$SoundEvent {
  const factory SoundEvent.started() = _Started;
  const factory SoundEvent.toggleSound() = _ToggleSound;
  const factory SoundEvent.changeSound({required String audioPath}) = _ChangeSound;
}