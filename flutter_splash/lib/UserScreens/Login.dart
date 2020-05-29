import 'package:flutter/material.dart';
import 'package:flutter_splash/UserScreens/signupScreen.dart';
import 'package:flutter_splash/tools/app_data.dart';
import 'package:flutter_splash/tools/app_methods.dart';
import 'package:flutter_splash/tools/app_tools.dart';
import 'package:flutter_splash/tools/firebase_methods.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
        title: new Text('Login'),
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
                textHint: 'Email',
                textIcon: Icons.email,
                controller: email),
            new SizedBox(
              height: 30.0,
            ),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: 'Password',
                textIcon: Icons.lock,
                controller: password),
            appButton(
              btnTxt: 'Login',
              onBtnclicked: verifyLoggin,
              btnPadding: 20.0,
              btnColor: Theme.of(context).primaryColor,
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
              child: new Text(
                "Don't have an account yet? Sign up",
                style: new TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  verifyLoggin() async {
    if (email.text == '') {
      showSnackBar('Email field cannot be empty', scaffoldKey);
      return;
    }
    if (password.text == '') {
      showSnackBar('Password field cannot be empty', scaffoldKey);
      return;
    }

    displayProgressDialog(context);
    String response = await appMethod.logginUser(
        email: email.text.toLowerCase(), password: password.text.toLowerCase());
    if (response == successful) {
      closeProgressDialog(context);
      Navigator.of(context).pop(true);
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
