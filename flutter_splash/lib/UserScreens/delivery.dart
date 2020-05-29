import 'package:flutter/material.dart';

class DeliveryAddress extends StatefulWidget {
  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Delivery Address'),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          'Delivery Address',
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
