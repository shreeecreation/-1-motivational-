import 'package:motivational/src/core/clients/pocket_base_client.dart';
import 'package:url_launcher/url_launcher.dart';

final class AuthRepository {
  final pb = PocketBaseClient();

  bool get isSignedIn => pb.client.authStore.model != null;

  Future<void> signInWithGoogle() async {
    pb.client.collection('users').authWithOAuth2('google', (url) async {
      try {
        await launchUrl(url);
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
