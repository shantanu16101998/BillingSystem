import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Google {



  static Future<User?> getUserDetails() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      return user;
    } catch (e) {
      print('Error getting user details: $e');
      return null;
    }
  }

  static Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null) {
          print('User signed in: ${user.displayName}');
        }
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      print('User signed out');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  static bool isAuthenticated() {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      return user != null;
    } catch (e) {
      return false;
    }
  }
}
