part of 'painter_saver_cubit.dart';

@freezed
class PainterSaverState with _$PainterSaverState {
  const factory PainterSaverState.initial() = _Initial;
  const factory PainterSaverState.loading() = _Loading;
  const factory PainterSaverState.success({required Color color}) = _Success;
  const factory PainterSaverState.error() = _Error;
  
}