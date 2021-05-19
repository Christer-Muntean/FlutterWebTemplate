import 'package:ahoyme/data/auth/firebase_auth_repo.dart';
import 'package:ahoyme/data/auth/sign_in_listener.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthNotifier with ChangeNotifier implements SignInListener {

  AuthNotifier() {
    _firebaseAuthRepo.setFirebaseSignInListener(this);
  }

  final _firebaseAuthRepo = FirebaseAuthRepo();
  User? _user;
  User? get user => _user;

  @override
  void signedIn(User user) {
    _user = user;
    notifyListeners();
  }

  @override
  void signedOut() {
    _user = null;
    notifyListeners();
  }

  static AuthNotifier of(BuildContext context){
    return context.watch<AuthNotifier>();
  }
}