import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('About'),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          'About',
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
