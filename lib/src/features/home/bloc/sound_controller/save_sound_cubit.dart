import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_sound_state.dart';
part 'save_sound_cubit.freezed.dart';

class SaveSoundCubit extends Cubit<SaveSoundState> {
  SaveSoundCubit() : super(SaveSoundState.initial());
}
