import 'package:ahoyme/data/auth/sign_in_listener.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo {

  void setFirebaseSignInListener(SignInListener signInListener) {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('Signed out');
        signInListener.signedOut();
      } else {
        print('Signed in');
        signInListener.signedIn(user);
      }
    });
  }
}