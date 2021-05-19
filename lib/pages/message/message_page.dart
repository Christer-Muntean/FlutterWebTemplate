import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {

  static const String route = '/message';

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('message'),
        ),
      ),
    );
  }
}
