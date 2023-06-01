import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:instaclone/state/auth/constants/constants.dart';
import 'package:instaclone/state/auth/models/auth_result.dart';
import '../../posts/typedefs/user_id.dart';

class Authenticator {
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;

  bool get isAlreadyLoggedIn => userId != null;

  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';

  String? get email => FirebaseAuth.instance.currentUser?.email;

// Logs the user out
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookLogin().logOut();
  }

// Logs the user in with Facebook in Firebase
  Future<AuthResult> loginWithFacebook() async {
    final loginResult = await FacebookLogin().logIn();
    final token = loginResult.accessToken?.token;
    if (token == null) {
      /// User has aborted the login process
      return AuthResult.aborted;
    }
    final oauthCredentials = FacebookAuthProvider.credential(token);
    try {
      await FirebaseAuth.instance.signInWithCredential(
        oauthCredentials,
      );
      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      final email = e.email;
      final credential = e.credential;

      /// If user is trying to login with different credentials, we must check
      /// if the user is trying to login with Google
      if (e.code == Constants.accountExistsWithDifferentCredential &&
          email != null &&
          credential != null) {
        final providers =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(
          email,
        );

        /// If user is trying to login with Google, link the credentials between
        /// Google and Facebook so the user is allowed to login with both
        if (providers.contains(Constants.googleCom)) {
          await loginWithGoogle();
          FirebaseAuth.instance.currentUser?.linkWithCredential(
            credential,
          );
        }
        return AuthResult.success;
      }
      return AuthResult.failure;
    }
  }

  // Login with Google
  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      Constants.emailScope,
    ]);

    final signInAccount = await googleSignIn.signIn();

    /// User is not signing in with valid acc
    if (signInAccount == null) {
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    /// Try to authenticate
    try {
      /// Auth success
      await FirebaseAuth.instance.signInWithCredential(oauthCredentials);
      return AuthResult.success;
    } catch (e) {
      /// Auth failure
      return AuthResult.failure;
    }
  }
}
