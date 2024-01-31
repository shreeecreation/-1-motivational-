import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motivational/src/core/clients/pocket_base_client.dart';
import 'package:motivational/src/core/repository/auth_repository.dart';
import 'package:pocketbase/pocketbase.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.initial()) {
    if (authRepository.isSignedIn) {
      emit(UserState.success(user: pb.client.authStore.model));
    }
  }

  final pb = PocketBaseClient();
  final authRepository = AuthRepository();

  void listenForAuthChanges() {
    authRepository.onAuthChange.listen((event) {
      if (event.model != null) {
        emit(UserState.success(user: event.model));
      } else {
        emit(const UserState.initial());
      }
    });
  }

  Future<void> setUser(AuthStoreEvent user) async {
    if (user.model != null) {
      emit(UserState.success(user: user.model!));
    }
  }
}
