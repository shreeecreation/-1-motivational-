import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sound_event.dart';
part 'sound_state.dart';
part 'sound_bloc.freezed.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {
  SoundBloc() : super(_Initial()) {
    on<_ToggleSound>(toggleSound);
    on<_ChangeSound>(changeSound);
  }
  bool _toggleSound = false;

  FutureOr<void> toggleSound(_ToggleSound event, Emitter<SoundState> emit) {
    _toggleSound = !_toggleSound;
    emit(SoundState.audioToggle(_toggleSound));
  }

  FutureOr<void> changeSound(_ChangeSound event, Emitter<SoundState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('current_audio', event.audioPath);
    emit(SoundState.audioChanged(event.audioPath));
  }
}
