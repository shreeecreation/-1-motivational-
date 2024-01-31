import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/core/repository/auth_repository.dart';
import 'package:pocketbase/pocketbase.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());
  final AuthRepository _authRepository = AuthRepository();

  Future<void> loginWithGoogle() async {
    emit(const AuthState.loading());
    try {
      await _authRepository.signInWithGoogle();
      emit(const AuthState.success());
    } on ClientException catch (e) {
      emit(AuthState.error('${e.originalError}'));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  // facebook
  Future<void> loginWithFacebook() async {
    emit(const AuthState.loading());
    try {
      await _authRepository.signInWithFacebook();
      emit(const AuthState.success());
    } on ClientException catch (e) {
      emit(AuthState.error('${e.originalError}'));
    }
  }

  // apple
  Future<void> loginWithApple() async {
    emit(const AuthState.loading());
    try {
      await _authRepository.signInWithApple();
      emit(const AuthState.success());
    } on ClientException catch (e) {
      emit(AuthState.error('${e.originalError}'));
    }
  }

  reset() {
    emit(const AuthState.initial());
  }

  // success
  success() {
    emit(const AuthState.success());
  }

  void logout() {
    _authRepository.signOut();
    emit(const AuthState.initial());
  }
}
