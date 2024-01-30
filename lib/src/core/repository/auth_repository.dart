import 'package:motivational/src/core/clients/pocket_base_client.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:url_launcher/url_launcher.dart';

final class AuthRepository {
  final pb = PocketBaseClient();

  // AuthRepository._internal();

  bool get isSignedIn => pb.client.authStore.model != null;

  Future<void> signInWithGoogle() async {
   final response =  pb.client.collection('users').authWithOAuth2('google', (url) async {
        await launchUrl(url);
    });
    // pb.client.authStore.onChange.listen((event) { 
    //   event.model.
    // });

    // return response
  }
AuthRepository get authRepository => AuthRepository();
Stream<AuthStoreEvent> get onAuthChange => pb.client.authStore.onChange;
}

