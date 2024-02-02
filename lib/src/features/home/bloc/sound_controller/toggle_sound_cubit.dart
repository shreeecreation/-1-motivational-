import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_sound_state.dart';
part 'toggle_sound_cubit.freezed.dart';

class ToggleSoundCubit extends Cubit<ToggleSoundState> {
  ToggleSoundCubit() : super(const ToggleSoundState.initial());

  bool _toggleSound = false;

  void toggleSound() async {
    emit(const ToggleSoundState.initial());
    _toggleSound = !_toggleSound;
    emit(ToggleSoundState.toggle(value: _toggleSound));
  }
}
