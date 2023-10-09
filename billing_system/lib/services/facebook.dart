import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Facebook {
  static Future<void> loginWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      print("Logged in! User ID: ${accessToken.userId}");
    } else {
      print("Facebook login failed");
    }
  }
}
