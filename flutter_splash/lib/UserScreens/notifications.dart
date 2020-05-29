import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Notifications'),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          'Notifications Area',
          style: new TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
