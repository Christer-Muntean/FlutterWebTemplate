import 'package:flutter/material.dart';

class HoyPage extends StatefulWidget {

  static const String route = '/hoy';

  @override
  _HoyPageState createState() => _HoyPageState();
}

class _HoyPageState extends State<HoyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('hoy'),
        ),
      ),
    );
  }
}
