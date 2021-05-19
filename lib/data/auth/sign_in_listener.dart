import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInListener {
  void signedOut();
  void signedIn(User user);
}