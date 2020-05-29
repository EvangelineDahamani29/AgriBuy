import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text('App Admin'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: new Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new SizedBox(
                height: 20.0,
              ),
              new GestureDetector(
                onTap: () {},
                child: new CircleAvatar(
                  maxRadius: 70.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.search),
                      new SizedBox(
                        height: 10.0,
                      ),
                      new Text('Search'),
                    ],
                  ),
                ),
              ),
              new CircleAvatar(
                maxRadius: 70.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(Icons.person),
                    new SizedBox(
                      height: 10.0,
                    ),
                    new Text('App Users'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new SizedBox(
                    height: 20.0,
                  ),
                  new CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.notifications),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text('App Orders'),
                      ],
                    ),
                  ),
                  new CircleAvatar(
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.message),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text('App Messages'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new SizedBox(
                        height: 20.0,
                      ),
                      new CircleAvatar(
                        maxRadius: 70.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.shop),
                            new SizedBox(
                              height: 10.0,
                            ),
                            new Text('App Products'),
                          ],
                        ),
                      ),
                      new CircleAvatar(
                        maxRadius: 70.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.add),
                            new SizedBox(
                              height: 10.0,
                            ),
                            new Text('Add Products'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new SizedBox(
                            height: 20.0,
                          ),
                          new CircleAvatar(
                            maxRadius: 70.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(Icons.history),
                                new SizedBox(
                                  height: 10.0,
                                ),
                                new Text('Order History'),
                              ],
                            ),
                          ),
                          new CircleAvatar(
                            maxRadius: 70.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(Icons.person),
                                new SizedBox(
                                  height: 10.0,
                                ),
                                new Text('Privileges'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
