import 'package:flutter/material.dart';

class Store {
  String prodName;
  String prodImage;
  double prodRate;
  double prodPrice;

  Store.items({this.prodImage, this.prodName, this.prodPrice, this.prodRate});
}

List<Store> storeItems = [
  Store.items(
      prodImage: 'assets/images/farm.jpg',
      prodName: 'Local maize',
      prodPrice: 100.00,
      prodRate: 0.0),
  Store.items(
    prodImage: '',
    prodName: 'Foreign Maize',
    prodPrice: 100.00,
    prodRate: 0.0,
  ),
  Store.items(
    prodImage: '',
    prodName: 'Wheat',
    prodPrice: 100.00,
    prodRate: 0.0,
  ),
  Store.items(
    prodImage: '',
    prodName: 'Sorghum',
    prodPrice: 100.00,
    prodRate: 0.0,
  ),
  Store.items(
    prodImage: '',
    prodName: 'Rice',
    prodPrice: 100.00,
    prodRate: 0.0,
  ),
  Store.items(
    prodImage: '',
    prodName: 'Oats',
    prodPrice: 100.00,
    prodRate: 0.0,
  ),
];
