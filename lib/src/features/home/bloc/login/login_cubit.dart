import 'package:bloc/bloc.dart';
import 'package:motivational/src/core/base/base_api_state.dart';
import 'package:motivational/src/core/repository/auth_repository.dart';

class LoginCubit extends Cubit<BaseApiState> {
  LoginCubit() : super(BaseApiState.initial());

  void login() async {
    emit(BaseApiState.loading());
    try {
      final response = await AuthRepository().authRepository.signInWithGoogle();
      emit(const BaseApiState.success(null));
    } catch (e) {
      print(e.toString());
    }
  }
}
