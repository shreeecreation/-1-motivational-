part of 'painter_saver_cubit.dart';

@freezed
class PainterSaverState with _$PainterSaverState {
  const PainterSaverState._();
  const factory PainterSaverState.mode({Color? color, String? image}) = _Mode;

  bool get isImage => this is _Mode && (this as _Mode).image != null;
}
