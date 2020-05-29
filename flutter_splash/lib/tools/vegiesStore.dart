import 'package:flutter/material.dart';

class Store {
  String prodName;
  String prodImage;
  String prodRate;
  String prodPrice;

  Store.items({this.prodImage, this.prodName, this.prodPrice, this.prodRate});
}

List<Store> storeItems = [
  Store.items(
      prodImage: 'assets/images/farm.jpg',
      prodName: 'Local Cabbages',
      prodPrice: '100.00',
      prodRate: '0.0'),
  Store.items(
    prodImage: '',
    prodName: 'Lettuce',
    prodPrice: '100.00',
    prodRate: '0.0',
  ),
  Store.items(
    prodImage: '',
    prodName: 'Carrots',
    prodPrice: '100.00',
    prodRate: '0.0',
  ),
  Store.items(
    prodImage: '',
    prodName: 'Red Cabbages',
    prodPrice: '100.00',
    prodRate: '0.0',
  ),
  Store.items(
    prodImage: '',
    prodName: 'Green Capsicum',
    prodPrice: '100.00',
    prodRate: '0.0',
  ),
  Store.items(
    prodImage: '',
    prodName: 'Green Cabbages',
    prodPrice: '100.00',
    prodRate: '0.0',
  ),
  Store.items(
    prodImage: '',
    prodName: 'Spring Onions',
    prodPrice: '100.00',
    prodRate: '0.0',
  ),
  Store.items(
    prodImage: '',
    prodName: 'Onions',
    prodPrice: '100.00',
    prodRate: '0.0',
  ),
  Store.items(
    prodImage: '',
    prodName: 'Tomatoes',
    prodPrice: '100.00',
    prodRate: '0.0',
  ),
  Store.items(
    prodImage: '',
    prodName: 'Cucumber',
    prodPrice: '100.00',
    prodRate: '0.0',
  ),
];
