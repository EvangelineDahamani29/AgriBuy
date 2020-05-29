import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('My Favorites'),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          'My favorites',
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
