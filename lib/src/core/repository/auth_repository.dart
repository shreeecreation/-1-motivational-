import 'package:http/http.dart' as http;

import 'package:get/route_manager.dart';
import 'package:motivational/src/core/cache/manager.dart';
import 'package:motivational/src/core/clients/pocket_base_client.dart';
import 'package:motivational/src/core/widgets/in_app_web_view.dart';
import 'package:pocketbase/pocketbase.dart';

final class AuthRepository {
  final pb = PocketBaseClient();

  // AuthRepository._internal();

  bool get isSignedIn => pb.client.authStore.model != null;

  Future<RecordAuth> signInWithGoogle() async {
    try {
      final response =
          await pb.client.collection('users').authWithOAuth2('google', (url) {
        Get.to(() => AppWebViewer(url: url));
      }, scopes: [
        'profile',
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ]);

      await _updateUserProfile(response);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<RecordAuth> signInWithFacebook() async {
    try {
      final response =
          await pb.client.collection('users').authWithOAuth2('facebook', (url) {
        Get.to(() => AppWebViewer(url: url));
      });

      await _updateUserProfile(response);

      return response;
    } on ClientException catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> _updateUserProfile(RecordAuth response) async {
    if (!response.meta['isNew']) {
      return;
    }
    final avatar =
        await AppCacheManager.manager.getSingleFile(response.meta['avatarUrl']);

    await pb.client.collection('users').update(response.record!.id, body: {
      'name': response.meta['name'],
    }, files: [
      http.MultipartFile.fromBytes(
        'avatar',
        avatar.readAsBytesSync(),
        filename: avatar.path.split('/').last,
      ),
    ]);
  }

  // apple
  Future<RecordAuth> signInWithApple() async {
    try {
      final response =
          await pb.client.collection('users').authWithOAuth2('apple', (url) {
        Get.to(() => AppWebViewer(url: url));
      });

      return response;
    } catch (e) {
      rethrow;
    }
  }

  void signOut() => pb.client.authStore.clear();

  AuthRepository get authRepository => AuthRepository();
  Stream<AuthStoreEvent> get onAuthChange => pb.client.authStore.onChange;
}
