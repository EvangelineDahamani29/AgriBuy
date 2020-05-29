import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppMethods {
  Future<String> logginUser({String email, String password});
  Future<String> createUserAccount(
      {String acctFullname,
      String gender,
      String phoneNumber,
      String email,
      String password});
  Future<bool> logOutUser();

  Future<DocumentSnapshot> getUserInfo(String UserID);
}
