import 'package:flutter/material.dart';
import 'package:flutter_splash/tools/app_data.dart';
import 'package:flutter_splash/tools/app_methods.dart';
import 'package:flutter_splash/tools/app_tools.dart';
import 'package:flutter_splash/tools/firebase_methods.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController repassword = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethod = new FirebaseMethods();
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Sign Up'),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: 'Full Name',
                textIcon: Icons.person,
                controller: fullname),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: 'Gender',
                controller: gender),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
              isPassword: false,
              sidePadding: 18.0,
              textHint: 'Phone number',
              textType: TextInputType.number,
            ),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
              isPassword: false,
              sidePadding: 18.0,
              textHint: 'Email',
            ),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
              isPassword: false,
              sidePadding: 18.0,
              textHint: 'Password',
            ),
          ],
        ),
      ),
    );
  }

  verifyDetails() async {
    if (fullname.text == '') {
      showSnackBar('Full name field cannot be empty', scaffoldKey);
      return;
    }
    if (gender.text == '') {
      showSnackBar('Gender field cannot be empty', scaffoldKey);
      return;
    }
    if (phone.text == '') {
      showSnackBar('Phone number field cannot be empty', scaffoldKey);
      return;
    }

    if (email.text == '') {
      showSnackBar('Email field cannot be empty', scaffoldKey);
      return;
    }

    if (password.text == '') {
      showSnackBar('Password field cannot be empty', scaffoldKey);
      return;
    }
    if (repassword.text == '') {
      showSnackBar('Confirm Password', scaffoldKey);
      return;
    }
    if (password.text != repassword.text) {
      showSnackBar("Passwords don't match", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
    String response = await appMethod.createUserAccount(
        acctFullname: fullname.text,
        gender: gender.text,
        phoneNumber: phone.text,
        email: email.text,
        password: password.text);
    if (response == successful) {
      closeProgressDialog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
