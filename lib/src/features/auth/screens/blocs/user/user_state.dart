part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const UserState._();

  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.error() = _Error;
  const factory UserState.success({
    required RecordModel user,
  }) = _Success;

  bool get isLoggedIn => this is _Success;
}
