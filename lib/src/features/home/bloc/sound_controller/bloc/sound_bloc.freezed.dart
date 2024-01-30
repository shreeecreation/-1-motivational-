// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sound_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SoundEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() playSound,
    required TResult Function(bool toggle) toggleSound,
    required TResult Function(String audioPath) changeSound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? playSound,
    TResult? Function(bool toggle)? toggleSound,
    TResult? Function(String audioPath)? changeSound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? playSound,
    TResult Function(bool toggle)? toggleSound,
    TResult Function(String audioPath)? changeSound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlaySound value) playSound,
    required TResult Function(_ToggleSound value) toggleSound,
    required TResult Function(_ChangeSound value) changeSound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlaySound value)? playSound,
    TResult? Function(_ToggleSound value)? toggleSound,
    TResult? Function(_ChangeSound value)? changeSound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlaySound value)? playSound,
    TResult Function(_ToggleSound value)? toggleSound,
    TResult Function(_ChangeSound value)? changeSound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoundEventCopyWith<$Res> {
  factory $SoundEventCopyWith(
          SoundEvent value, $Res Function(SoundEvent) then) =
      _$SoundEventCopyWithImpl<$Res, SoundEvent>;
}

/// @nodoc
class _$SoundEventCopyWithImpl<$Res, $Val extends SoundEvent>
    implements $SoundEventCopyWith<$Res> {
  _$SoundEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SoundEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SoundEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() playSound,
    required TResult Function(bool toggle) toggleSound,
    required TResult Function(String audioPath) changeSound,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? playSound,
    TResult? Function(bool toggle)? toggleSound,
    TResult? Function(String audioPath)? changeSound,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? playSound,
    TResult Function(bool toggle)? toggleSound,
    TResult Function(String audioPath)? changeSound,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlaySound value) playSound,
    required TResult Function(_ToggleSound value) toggleSound,
    required TResult Function(_ChangeSound value) changeSound,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlaySound value)? playSound,
    TResult? Function(_ToggleSound value)? toggleSound,
    TResult? Function(_ChangeSound value)? changeSound,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlaySound value)? playSound,
    TResult Function(_ToggleSound value)? toggleSound,
    TResult Function(_ChangeSound value)? changeSound,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SoundEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$PlaySoundImplCopyWith<$Res> {
  factory _$$PlaySoundImplCopyWith(
          _$PlaySoundImpl value, $Res Function(_$PlaySoundImpl) then) =
      __$$PlaySoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlaySoundImplCopyWithImpl<$Res>
    extends _$SoundEventCopyWithImpl<$Res, _$PlaySoundImpl>
    implements _$$PlaySoundImplCopyWith<$Res> {
  __$$PlaySoundImplCopyWithImpl(
      _$PlaySoundImpl _value, $Res Function(_$PlaySoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlaySoundImpl implements _PlaySound {
  const _$PlaySoundImpl();

  @override
  String toString() {
    return 'SoundEvent.playSound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlaySoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() playSound,
    required TResult Function(bool toggle) toggleSound,
    required TResult Function(String audioPath) changeSound,
  }) {
    return playSound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? playSound,
    TResult? Function(bool toggle)? toggleSound,
    TResult? Function(String audioPath)? changeSound,
  }) {
    return playSound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? playSound,
    TResult Function(bool toggle)? toggleSound,
    TResult Function(String audioPath)? changeSound,
    required TResult orElse(),
  }) {
    if (playSound != null) {
      return playSound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlaySound value) playSound,
    required TResult Function(_ToggleSound value) toggleSound,
    required TResult Function(_ChangeSound value) changeSound,
  }) {
    return playSound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlaySound value)? playSound,
    TResult? Function(_ToggleSound value)? toggleSound,
    TResult? Function(_ChangeSound value)? changeSound,
  }) {
    return playSound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlaySound value)? playSound,
    TResult Function(_ToggleSound value)? toggleSound,
    TResult Function(_ChangeSound value)? changeSound,
    required TResult orElse(),
  }) {
    if (playSound != null) {
      return playSound(this);
    }
    return orElse();
  }
}

abstract class _PlaySound implements SoundEvent {
  const factory _PlaySound() = _$PlaySoundImpl;
}

/// @nodoc
abstract class _$$ToggleSoundImplCopyWith<$Res> {
  factory _$$ToggleSoundImplCopyWith(
          _$ToggleSoundImpl value, $Res Function(_$ToggleSoundImpl) then) =
      __$$ToggleSoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool toggle});
}

/// @nodoc
class __$$ToggleSoundImplCopyWithImpl<$Res>
    extends _$SoundEventCopyWithImpl<$Res, _$ToggleSoundImpl>
    implements _$$ToggleSoundImplCopyWith<$Res> {
  __$$ToggleSoundImplCopyWithImpl(
      _$ToggleSoundImpl _value, $Res Function(_$ToggleSoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggle = null,
  }) {
    return _then(_$ToggleSoundImpl(
      toggle: null == toggle
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleSoundImpl implements _ToggleSound {
  const _$ToggleSoundImpl({required this.toggle});

  @override
  final bool toggle;

  @override
  String toString() {
    return 'SoundEvent.toggleSound(toggle: $toggle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSoundImpl &&
            (identical(other.toggle, toggle) || other.toggle == toggle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toggle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSoundImplCopyWith<_$ToggleSoundImpl> get copyWith =>
      __$$ToggleSoundImplCopyWithImpl<_$ToggleSoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() playSound,
    required TResult Function(bool toggle) toggleSound,
    required TResult Function(String audioPath) changeSound,
  }) {
    return toggleSound(toggle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? playSound,
    TResult? Function(bool toggle)? toggleSound,
    TResult? Function(String audioPath)? changeSound,
  }) {
    return toggleSound?.call(toggle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? playSound,
    TResult Function(bool toggle)? toggleSound,
    TResult Function(String audioPath)? changeSound,
    required TResult orElse(),
  }) {
    if (toggleSound != null) {
      return toggleSound(toggle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlaySound value) playSound,
    required TResult Function(_ToggleSound value) toggleSound,
    required TResult Function(_ChangeSound value) changeSound,
  }) {
    return toggleSound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlaySound value)? playSound,
    TResult? Function(_ToggleSound value)? toggleSound,
    TResult? Function(_ChangeSound value)? changeSound,
  }) {
    return toggleSound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlaySound value)? playSound,
    TResult Function(_ToggleSound value)? toggleSound,
    TResult Function(_ChangeSound value)? changeSound,
    required TResult orElse(),
  }) {
    if (toggleSound != null) {
      return toggleSound(this);
    }
    return orElse();
  }
}

abstract class _ToggleSound implements SoundEvent {
  const factory _ToggleSound({required final bool toggle}) = _$ToggleSoundImpl;

  bool get toggle;
  @JsonKey(ignore: true)
  _$$ToggleSoundImplCopyWith<_$ToggleSoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeSoundImplCopyWith<$Res> {
  factory _$$ChangeSoundImplCopyWith(
          _$ChangeSoundImpl value, $Res Function(_$ChangeSoundImpl) then) =
      __$$ChangeSoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String audioPath});
}

/// @nodoc
class __$$ChangeSoundImplCopyWithImpl<$Res>
    extends _$SoundEventCopyWithImpl<$Res, _$ChangeSoundImpl>
    implements _$$ChangeSoundImplCopyWith<$Res> {
  __$$ChangeSoundImplCopyWithImpl(
      _$ChangeSoundImpl _value, $Res Function(_$ChangeSoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioPath = null,
  }) {
    return _then(_$ChangeSoundImpl(
      audioPath: null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeSoundImpl implements _ChangeSound {
  const _$ChangeSoundImpl({required this.audioPath});

  @override
  final String audioPath;

  @override
  String toString() {
    return 'SoundEvent.changeSound(audioPath: $audioPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeSoundImpl &&
            (identical(other.audioPath, audioPath) ||
                other.audioPath == audioPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeSoundImplCopyWith<_$ChangeSoundImpl> get copyWith =>
      __$$ChangeSoundImplCopyWithImpl<_$ChangeSoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() playSound,
    required TResult Function(bool toggle) toggleSound,
    required TResult Function(String audioPath) changeSound,
  }) {
    return changeSound(audioPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? playSound,
    TResult? Function(bool toggle)? toggleSound,
    TResult? Function(String audioPath)? changeSound,
  }) {
    return changeSound?.call(audioPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? playSound,
    TResult Function(bool toggle)? toggleSound,
    TResult Function(String audioPath)? changeSound,
    required TResult orElse(),
  }) {
    if (changeSound != null) {
      return changeSound(audioPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_PlaySound value) playSound,
    required TResult Function(_ToggleSound value) toggleSound,
    required TResult Function(_ChangeSound value) changeSound,
  }) {
    return changeSound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_PlaySound value)? playSound,
    TResult? Function(_ToggleSound value)? toggleSound,
    TResult? Function(_ChangeSound value)? changeSound,
  }) {
    return changeSound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_PlaySound value)? playSound,
    TResult Function(_ToggleSound value)? toggleSound,
    TResult Function(_ChangeSound value)? changeSound,
    required TResult orElse(),
  }) {
    if (changeSound != null) {
      return changeSound(this);
    }
    return orElse();
  }
}

abstract class _ChangeSound implements SoundEvent {
  const factory _ChangeSound({required final String audioPath}) =
      _$ChangeSoundImpl;

  String get audioPath;
  @JsonKey(ignore: true)
  _$$ChangeSoundImplCopyWith<_$ChangeSoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SoundState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool canPlay) playSound,
    required TResult Function(String audioPath) audioChanged,
    required TResult Function(bool toggleValue) audioToggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool canPlay)? playSound,
    TResult? Function(String audioPath)? audioChanged,
    TResult? Function(bool toggleValue)? audioToggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool canPlay)? playSound,
    TResult Function(String audioPath)? audioChanged,
    TResult Function(bool toggleValue)? audioToggle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PlayAudio value) playSound,
    required TResult Function(_AudioChanged value) audioChanged,
    required TResult Function(_AudioToggled value) audioToggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PlayAudio value)? playSound,
    TResult? Function(_AudioChanged value)? audioChanged,
    TResult? Function(_AudioToggled value)? audioToggle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PlayAudio value)? playSound,
    TResult Function(_AudioChanged value)? audioChanged,
    TResult Function(_AudioToggled value)? audioToggle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoundStateCopyWith<$Res> {
  factory $SoundStateCopyWith(
          SoundState value, $Res Function(SoundState) then) =
      _$SoundStateCopyWithImpl<$Res, SoundState>;
}

/// @nodoc
class _$SoundStateCopyWithImpl<$Res, $Val extends SoundState>
    implements $SoundStateCopyWith<$Res> {
  _$SoundStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SoundStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SoundState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool canPlay) playSound,
    required TResult Function(String audioPath) audioChanged,
    required TResult Function(bool toggleValue) audioToggle,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool canPlay)? playSound,
    TResult? Function(String audioPath)? audioChanged,
    TResult? Function(bool toggleValue)? audioToggle,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool canPlay)? playSound,
    TResult Function(String audioPath)? audioChanged,
    TResult Function(bool toggleValue)? audioToggle,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PlayAudio value) playSound,
    required TResult Function(_AudioChanged value) audioChanged,
    required TResult Function(_AudioToggled value) audioToggle,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PlayAudio value)? playSound,
    TResult? Function(_AudioChanged value)? audioChanged,
    TResult? Function(_AudioToggled value)? audioToggle,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PlayAudio value)? playSound,
    TResult Function(_AudioChanged value)? audioChanged,
    TResult Function(_AudioToggled value)? audioToggle,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SoundState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$PlayAudioImplCopyWith<$Res> {
  factory _$$PlayAudioImplCopyWith(
          _$PlayAudioImpl value, $Res Function(_$PlayAudioImpl) then) =
      __$$PlayAudioImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool canPlay});
}

/// @nodoc
class __$$PlayAudioImplCopyWithImpl<$Res>
    extends _$SoundStateCopyWithImpl<$Res, _$PlayAudioImpl>
    implements _$$PlayAudioImplCopyWith<$Res> {
  __$$PlayAudioImplCopyWithImpl(
      _$PlayAudioImpl _value, $Res Function(_$PlayAudioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canPlay = null,
  }) {
    return _then(_$PlayAudioImpl(
      null == canPlay
          ? _value.canPlay
          : canPlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlayAudioImpl implements _PlayAudio {
  const _$PlayAudioImpl(this.canPlay);

  @override
  final bool canPlay;

  @override
  String toString() {
    return 'SoundState.playSound(canPlay: $canPlay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayAudioImpl &&
            (identical(other.canPlay, canPlay) || other.canPlay == canPlay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, canPlay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayAudioImplCopyWith<_$PlayAudioImpl> get copyWith =>
      __$$PlayAudioImplCopyWithImpl<_$PlayAudioImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool canPlay) playSound,
    required TResult Function(String audioPath) audioChanged,
    required TResult Function(bool toggleValue) audioToggle,
  }) {
    return playSound(canPlay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool canPlay)? playSound,
    TResult? Function(String audioPath)? audioChanged,
    TResult? Function(bool toggleValue)? audioToggle,
  }) {
    return playSound?.call(canPlay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool canPlay)? playSound,
    TResult Function(String audioPath)? audioChanged,
    TResult Function(bool toggleValue)? audioToggle,
    required TResult orElse(),
  }) {
    if (playSound != null) {
      return playSound(canPlay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PlayAudio value) playSound,
    required TResult Function(_AudioChanged value) audioChanged,
    required TResult Function(_AudioToggled value) audioToggle,
  }) {
    return playSound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PlayAudio value)? playSound,
    TResult? Function(_AudioChanged value)? audioChanged,
    TResult? Function(_AudioToggled value)? audioToggle,
  }) {
    return playSound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PlayAudio value)? playSound,
    TResult Function(_AudioChanged value)? audioChanged,
    TResult Function(_AudioToggled value)? audioToggle,
    required TResult orElse(),
  }) {
    if (playSound != null) {
      return playSound(this);
    }
    return orElse();
  }
}

abstract class _PlayAudio implements SoundState {
  const factory _PlayAudio(final bool canPlay) = _$PlayAudioImpl;

  bool get canPlay;
  @JsonKey(ignore: true)
  _$$PlayAudioImplCopyWith<_$PlayAudioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AudioChangedImplCopyWith<$Res> {
  factory _$$AudioChangedImplCopyWith(
          _$AudioChangedImpl value, $Res Function(_$AudioChangedImpl) then) =
      __$$AudioChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String audioPath});
}

/// @nodoc
class __$$AudioChangedImplCopyWithImpl<$Res>
    extends _$SoundStateCopyWithImpl<$Res, _$AudioChangedImpl>
    implements _$$AudioChangedImplCopyWith<$Res> {
  __$$AudioChangedImplCopyWithImpl(
      _$AudioChangedImpl _value, $Res Function(_$AudioChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioPath = null,
  }) {
    return _then(_$AudioChangedImpl(
      null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AudioChangedImpl implements _AudioChanged {
  const _$AudioChangedImpl(this.audioPath);

  @override
  final String audioPath;

  @override
  String toString() {
    return 'SoundState.audioChanged(audioPath: $audioPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioChangedImpl &&
            (identical(other.audioPath, audioPath) ||
                other.audioPath == audioPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioChangedImplCopyWith<_$AudioChangedImpl> get copyWith =>
      __$$AudioChangedImplCopyWithImpl<_$AudioChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool canPlay) playSound,
    required TResult Function(String audioPath) audioChanged,
    required TResult Function(bool toggleValue) audioToggle,
  }) {
    return audioChanged(audioPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool canPlay)? playSound,
    TResult? Function(String audioPath)? audioChanged,
    TResult? Function(bool toggleValue)? audioToggle,
  }) {
    return audioChanged?.call(audioPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool canPlay)? playSound,
    TResult Function(String audioPath)? audioChanged,
    TResult Function(bool toggleValue)? audioToggle,
    required TResult orElse(),
  }) {
    if (audioChanged != null) {
      return audioChanged(audioPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PlayAudio value) playSound,
    required TResult Function(_AudioChanged value) audioChanged,
    required TResult Function(_AudioToggled value) audioToggle,
  }) {
    return audioChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PlayAudio value)? playSound,
    TResult? Function(_AudioChanged value)? audioChanged,
    TResult? Function(_AudioToggled value)? audioToggle,
  }) {
    return audioChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PlayAudio value)? playSound,
    TResult Function(_AudioChanged value)? audioChanged,
    TResult Function(_AudioToggled value)? audioToggle,
    required TResult orElse(),
  }) {
    if (audioChanged != null) {
      return audioChanged(this);
    }
    return orElse();
  }
}

abstract class _AudioChanged implements SoundState {
  const factory _AudioChanged(final String audioPath) = _$AudioChangedImpl;

  String get audioPath;
  @JsonKey(ignore: true)
  _$$AudioChangedImplCopyWith<_$AudioChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AudioToggledImplCopyWith<$Res> {
  factory _$$AudioToggledImplCopyWith(
          _$AudioToggledImpl value, $Res Function(_$AudioToggledImpl) then) =
      __$$AudioToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool toggleValue});
}

/// @nodoc
class __$$AudioToggledImplCopyWithImpl<$Res>
    extends _$SoundStateCopyWithImpl<$Res, _$AudioToggledImpl>
    implements _$$AudioToggledImplCopyWith<$Res> {
  __$$AudioToggledImplCopyWithImpl(
      _$AudioToggledImpl _value, $Res Function(_$AudioToggledImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggleValue = null,
  }) {
    return _then(_$AudioToggledImpl(
      null == toggleValue
          ? _value.toggleValue
          : toggleValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AudioToggledImpl implements _AudioToggled {
  const _$AudioToggledImpl(this.toggleValue);

  @override
  final bool toggleValue;

  @override
  String toString() {
    return 'SoundState.audioToggle(toggleValue: $toggleValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioToggledImpl &&
            (identical(other.toggleValue, toggleValue) ||
                other.toggleValue == toggleValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toggleValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioToggledImplCopyWith<_$AudioToggledImpl> get copyWith =>
      __$$AudioToggledImplCopyWithImpl<_$AudioToggledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool canPlay) playSound,
    required TResult Function(String audioPath) audioChanged,
    required TResult Function(bool toggleValue) audioToggle,
  }) {
    return audioToggle(toggleValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool canPlay)? playSound,
    TResult? Function(String audioPath)? audioChanged,
    TResult? Function(bool toggleValue)? audioToggle,
  }) {
    return audioToggle?.call(toggleValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool canPlay)? playSound,
    TResult Function(String audioPath)? audioChanged,
    TResult Function(bool toggleValue)? audioToggle,
    required TResult orElse(),
  }) {
    if (audioToggle != null) {
      return audioToggle(toggleValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PlayAudio value) playSound,
    required TResult Function(_AudioChanged value) audioChanged,
    required TResult Function(_AudioToggled value) audioToggle,
  }) {
    return audioToggle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PlayAudio value)? playSound,
    TResult? Function(_AudioChanged value)? audioChanged,
    TResult? Function(_AudioToggled value)? audioToggle,
  }) {
    return audioToggle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PlayAudio value)? playSound,
    TResult Function(_AudioChanged value)? audioChanged,
    TResult Function(_AudioToggled value)? audioToggle,
    required TResult orElse(),
  }) {
    if (audioToggle != null) {
      return audioToggle(this);
    }
    return orElse();
  }
}

abstract class _AudioToggled implements SoundState {
  const factory _AudioToggled(final bool toggleValue) = _$AudioToggledImpl;

  bool get toggleValue;
  @JsonKey(ignore: true)
  _$$AudioToggledImplCopyWith<_$AudioToggledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
