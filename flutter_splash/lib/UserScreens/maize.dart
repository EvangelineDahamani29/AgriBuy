import 'package:flutter/material.dart';
import 'package:flutter_splash/tools/maizeStore.dart';

import 'ItemsDetails.dart';

class Maize extends StatefulWidget {
  @override
  _MaizeState createState() => _MaizeState();
}

class _MaizeState extends State<Maize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Cereal'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: storeItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (context) => ItemDetails(
                            prodImage: storeItems[index].prodImage,
                            prodName: storeItems[index].prodName,
                            prodPrice: storeItems[index].prodPrice,
                            prodRate: storeItems[index].prodRate,
                          ),
                        ),
                      );
                    },
                    child: new Card(
                      child: Stack(
                        alignment: FractionalOffset.topLeft,
                        children: <Widget>[
                          new Stack(
                            alignment: FractionalOffset.bottomCenter,
                            children: <Widget>[
                              new Container(
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new AssetImage(
                                        storeItems[index].prodImage),
                                  ),
                                ),
                              ),
                              new Container(
                                height: 35.0,
                                color: Colors.green.withAlpha(150),
                                child: new Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text(
                                        "${storeItems[index].prodName.substring(0, 3)}...",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: 16.0),
                                      ),
                                      new Text(
                                        "Ghc${storeItems[index].prodPrice}",
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                height: 30.0,
                                width: 60.0,
                                decoration: new BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: new BorderRadius.only(
                                    topRight: new Radius.circular(5.0),
                                    bottomLeft: new Radius.circular(5.0),
                                  ),
                                ),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.star,
                                      color: Colors.yellowAccent,
                                      size: 20.0,
                                    ),
                                    new Text(
                                      '${storeItems[index].prodRate}',
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              new IconButton(
                                icon: Icon(Icons.favorite_border),
                                color: Colors.black,
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
