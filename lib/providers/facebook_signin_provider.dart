import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInProvider extends ChangeNotifier {
  // final facebookSignin = FacebookSignInProvider();

  // FacebookAuthCredential _user;

  // final _auth = FirebaseAuth.instance;

  Future<String> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken.token);
        await FirebaseAuth.instance.signInWithCredential(credential);
        // Once signed in, return the UserCredential
        print(result.accessToken.token);
        return result.accessToken.token;
        // return await FirebaseAuth.instance.signInWithCredential(credential);
      }
      return ""; // err
    } catch (err) {
      print(err.toString());
      throw err;
    }
  }

  Future logout() async {
    await FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }
}
