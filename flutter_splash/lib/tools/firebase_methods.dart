import 'dart:async';
import 'package:flutter_splash/tools/app_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app_data.dart';
import 'app_tools.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class FirebaseMethods implements AppMethods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<String> createUserAccount(
      {String acctFullname,
      String gender,
      String phoneNumber,
      String email,
      String password}) async {
    // TODO: implement createUserAccount
    FirebaseUser user;

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        await firestore.collection(usersData).document(user.uid).setData({
          userID: user.uid,
          acctFullname: acctFullname,
          gender: gender,
          userEmail: email,
          userPassword: password,
          phoneNumber: phoneNumber
        });
        await writeDataLocally(key: userID, value: user.uid);
        await writeDataLocally(key: acctFullname, value: acctFullname);
        await writeDataLocally(key: gender, value: gender);
        await writeDataLocally(key: userEmail, value: email);
        await writeDataLocally(key: userPassword, value: password);
      }
    } on PlatformException catch (e) {
      //print(e.details);
      return errorMSG(e.details);
    }
    return user == null ? errorMSG('Error Occurred!') : successfulMSG();
  }

  @override
  Future<String> logginUser({String email, String password}) async {
    // TODO: implement logginUser
    FirebaseUser user;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      if (user != null) {
        DocumentSnapshot userInfo = await getUserInfo(user.uid);
        writeDataLocally(key: userID, value: userInfo[userID]);
        writeDataLocally(key: fullname, value: userInfo[fullname]);
        writeDataLocally(key: userEmail, value: userInfo[userEmail]);
        writeDataLocally(key: phoneNumber, value: userInfo[phoneNumber]);
        writeDataLocally(key: photoURL, value: userInfo[photoURL]);
        writeBoolDataLocally(key: loggedIn, value: true);
        print(userInfo[userEmail]);
      }
    } on PlatformException catch (e) {
      //print(e.details);
      return errorMSG(e.details);
    }

    return user == null ? errorMSG('Error Occurred!') : successfulMSG();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }

  Future<String> successfulMSG() async {
    return successful;
  }

  Future<String> errorMSG(String e) async {
    return e;
  }

  @override
  Future<bool> logOutUser() async {
    // TODO: implement logOutUser
    await auth.signOut();
    await clearDataLocally();

    return complete();
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String UserID) async {
    // TODO: implement getUserInfo
    return await firestore.collection(usersData).document(userID).get();
  }
}
