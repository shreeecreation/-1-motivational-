// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'painter_saver_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PainterSaverState {
  Color? get color => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color? color, String? image) mode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Color? color, String? image)? mode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color? color, String? image)? mode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Mode value) mode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Mode value)? mode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Mode value)? mode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PainterSaverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PainterSaverStateCopyWith<PainterSaverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PainterSaverStateCopyWith<$Res> {
  factory $PainterSaverStateCopyWith(
          PainterSaverState value, $Res Function(PainterSaverState) then) =
      _$PainterSaverStateCopyWithImpl<$Res, PainterSaverState>;
  @useResult
  $Res call({Color? color, String? image});
}

/// @nodoc
class _$PainterSaverStateCopyWithImpl<$Res, $Val extends PainterSaverState>
    implements $PainterSaverStateCopyWith<$Res> {
  _$PainterSaverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PainterSaverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModeImplCopyWith<$Res>
    implements $PainterSaverStateCopyWith<$Res> {
  factory _$$ModeImplCopyWith(
          _$ModeImpl value, $Res Function(_$ModeImpl) then) =
      __$$ModeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color? color, String? image});
}

/// @nodoc
class __$$ModeImplCopyWithImpl<$Res>
    extends _$PainterSaverStateCopyWithImpl<$Res, _$ModeImpl>
    implements _$$ModeImplCopyWith<$Res> {
  __$$ModeImplCopyWithImpl(_$ModeImpl _value, $Res Function(_$ModeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PainterSaverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? image = freezed,
  }) {
    return _then(_$ModeImpl(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ModeImpl extends _Mode {
  const _$ModeImpl({this.color, this.image}) : super._();

  @override
  final Color? color;
  @override
  final String? image;

  @override
  String toString() {
    return 'PainterSaverState.mode(color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModeImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, image);

  /// Create a copy of PainterSaverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModeImplCopyWith<_$ModeImpl> get copyWith =>
      __$$ModeImplCopyWithImpl<_$ModeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Color? color, String? image) mode,
  }) {
    return mode(color, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Color? color, String? image)? mode,
  }) {
    return mode?.call(color, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Color? color, String? image)? mode,
    required TResult orElse(),
  }) {
    if (mode != null) {
      return mode(color, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Mode value) mode,
  }) {
    return mode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Mode value)? mode,
  }) {
    return mode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Mode value)? mode,
    required TResult orElse(),
  }) {
    if (mode != null) {
      return mode(this);
    }
    return orElse();
  }
}

abstract class _Mode extends PainterSaverState {
  const factory _Mode({final Color? color, final String? image}) = _$ModeImpl;
  const _Mode._() : super._();

  @override
  Color? get color;
  @override
  String? get image;

  /// Create a copy of PainterSaverState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModeImplCopyWith<_$ModeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
