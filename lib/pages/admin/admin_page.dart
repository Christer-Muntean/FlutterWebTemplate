import 'package:ahoyme/data/auth/auth_notifier.dart';
import 'package:ahoyme/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  static const String route = '/admin';

  @override
  _AdminPageState createState() => _AdminPageState();
}

enum AuthState { signed_in, signed_out, loading }

class _AdminPageState extends State<AdminPage> {

  AuthState _authState = AuthState.loading;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _contentHandler(AuthNotifier.of(context).user);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: (_authState == AuthState.signed_in)
              ? Container(
                  child: Column(
                    children: [_header(), Text('Admin page')],
                  ),
                )
              : (_authState == AuthState.signed_out)
                  ? Text('User is signed out.\nOr Flutter web loses provider value on hot-reload: click reload in browser.')
                  : CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: OutlinedButton(
                child: Text('Sign out'),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => HomePage(),
                    ),
                    (route) => false,
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  void _contentHandler(User? user) {
    if(_authState == AuthState.signed_in || _authState == AuthState.signed_out){
      return;
    }

    if (user != null) {
      setState(() {
        _authState = AuthState.signed_in;
      });
      return;
    }

    //Timeout
    Future.delayed(const Duration(seconds: 4), () {
      if (_authState == AuthState.loading) {
        setState(() {
          _authState = AuthState.signed_out;
        });
      }
    });
  }
}
