import 'package:ahoyme/data/auth/auth_notifier.dart';
import 'package:ahoyme/pages/admin/admin_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User? _user;

  Future<UserCredential> _signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

  @override
  Widget build(BuildContext context) {

    _user = context.watch<AuthNotifier>().user;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: (_user == null)
                          ? OutlinedButton(
                              child: Text('Sign in'),
                              onPressed: () async {
                                await _signInWithGoogle();
                                Navigator.pushNamed(
                                  context,
                                  AdminPage.route,
                                );
                              },
                            )
                          : OutlinedButton(
                              child: Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('${context.read<AuthNotifier>().user?.displayName}')
                                ],
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AdminPage.route,
                                );
                              },
                            ),
                    )
                  ],
                ),
                Center(
                  child: Text('home'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
