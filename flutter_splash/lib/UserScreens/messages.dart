import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Messages'),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          'My Messages',
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
