import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_splash/admin/admin_home.dart';
import 'package:flutter_splash/tools/app_data.dart';
import 'package:flutter_splash/tools/app_methods.dart';
import 'package:flutter_splash/tools/app_tools.dart';
import 'package:flutter_splash/tools/firebase_methods.dart';
import 'package:flutter_splash/tools/store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favorites.dart';
import 'messages.dart';
import 'cart.dart';
import 'notifications.dart';
import 'Order.dart';
import 'profileSettings.dart';
import 'delivery.dart';
import 'AboutScreen.dart';
import 'Login.dart';
import 'maize.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext context;
  String acctName = "";
  String acctEmail = "";
  String acctPhotoURL = "";

  bool isLoggedIn;
  AppMethods appMethods = new FirebaseMethods();

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  Future getCurrentUser() async {
    await clearDataLocally();
    acctName = getStringDataLocally(key: fullname);
    acctEmail = getStringDataLocally(key: userEmail);
    acctPhotoURL = getStringDataLocally(key: photoURL);
    isLoggedIn = getBoolDataLocally(key: loggedIn);

    acctName == null ? acctName = "Guest User" : acctName;
    acctEmail == null ? acctEmail = "guestuser@gmail.com" : acctEmail;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      appBar: new AppBar(
        title: new GestureDetector(
          onLongPress: OpenAdmin(),
          child: new Text('AgriBuy'),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                new CupertinoPageRoute(
                  // ignore: missing_return
                  builder: (BuildContext context) {
                    return new FavoritesScreen();
                  },
                ),
              );
            },
          ),
          new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    new CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return new MessagesScreen();
                      },
                    ),
                  );
                  new CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.black,
                    child: Text(
                      '0',
                      style: new TextStyle(color: Colors.red, fontSize: 11.0),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              itemCount: storeItems.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new Stack(
                    alignment: FractionalOffset.bottomCenter,
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(
                                  storeItems[index].prodImage)),
                        ),
                      ),
                      new Container(
                        height: 50.0,
                        color: Colors.green,
                        child: new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                child: Text(
                                  storeItems[index].prodName,
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),

                                // ignore: undefined_named_parameter
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Maize(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: new Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                new CupertinoPageRoute(
                  builder: (BuildContext context) {
                    return Cart();
                  },
                ),
              );
            },
            backgroundColor: Colors.green,
            child: new Stack(
              children: <Widget>[
                new Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          new CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: Text(
              '0',
              style: new TextStyle(fontSize: 11.0, color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(acctName),
              accountEmail: new Text(acctEmail),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Icon(Icons.person),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Icon(Icons.notifications,
                    color: Colors.white, size: 20.0),
              ),
              title: new Text('Order Notifications'),
              onTap: () {
                Navigator.of(context).push(
                  new CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return Notifications();
                    },
                  ),
                );
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Icon(Icons.history, color: Colors.white, size: 20.0),
              ),
              title: new Text('Order History'),
              onTap: () {
                Navigator.of(context).push(
                  new CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return OrderHistory();
                    },
                  ),
                );
              },
            ),
            new Divider(),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text('Profile Settings'),
              onTap: () {
                Navigator.of(context).push(
                  new CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return ProfileSettings();
                    },
                  ),
                );
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text('Delivery Address'),
              onTap: () {
                Navigator.of(context).push(
                  new CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return DeliveryAddress();
                    },
                  ),
                );
              },
            ),
            new Divider(),
            new ListTile(
              trailing: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text('About us'),
              onTap: () {
                Navigator.of(context).push(
                  new CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return AboutScreen();
                    },
                  ),
                );
              },
            ),
            new Divider(),
            new ListTile(
              trailing: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text(isLoggedIn == true ? "LogOut" : "LogIn"),
              onTap: checkIfLoggedIn(),
            ),
          ],
        ),
      ),
    );
  }

  checkIfLoggedIn() async {
    if (isLoggedIn == false) {
      bool response = await Navigator.of(context).push(
        new CupertinoPageRoute(
          builder: (BuildContext context) => new Login(),
        ),
      );
      if (response == true) getCurrentUser();
      return;
    }
    bool response = await appMethods.logOutUser();
    if (response == true) getCurrentUser();
  }

  OpenAdmin() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) => new AdminHome(),
      ),
    );
  }
}
