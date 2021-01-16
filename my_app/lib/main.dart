import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 29, 34, 0.7),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 3, bottom: 3),
                    decoration: myBoxDecoration(),
                    child: Text(
                      '00423',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Flexible(
                    child: Text(
                      '經濟日報集團',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              color: Color.fromRGBO(64, 112, 117, 0.5), // Yellow
              height: 1.0,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Text('HKD',
                    style: TextStyle(color: Color.fromRGBO(55, 95, 134, 1), fontSize: 15)),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 50),
              child: Row(children: <Widget>[
                Text('▴   1.640',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 100),
              child: Row(children: <Widget>[
                Text('+0.020(+1.23%)',
                    style: TextStyle(color: Colors.green, fontSize: 15)),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left:10),
              child: Row(children: <Widget>[
                Flexible(
                  child: Text('高',
                      style: TextStyle(color: Color.fromRGBO(55, 95, 134, 1), fontSize: 15)),
                ),
                Container(width: 20),
                Flexible(
                  child: Text('1.670',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
                Container(width: 10),
                Flexible(
                  child: Text('開',
                      style: TextStyle(color: Color.fromRGBO(55, 95, 134, 1), fontSize: 15)),
                ),
                Container(width: 20),
                Flexible(
                  child: Text('1.670',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left:10),
              child: Row(children: <Widget>[
                Flexible(
                  child: Text('低',
                      style: TextStyle(color: Color.fromRGBO(55, 95, 134, 1), fontSize: 15)),
                ),
                Container(width: 20),
                Flexible(
                  child: Text('1.620',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
                Container(width: 10),
                Flexible(
                  child: Text('前',
                      style: TextStyle(color: Color.fromRGBO(55, 95, 134, 1), fontSize: 15)),
                ),
                Container(width: 20),
                Flexible(
                  child: Text('1.620',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                )
              ]),
            ),
          ],
        )),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1.0, color: Colors.blueGrey),
      color: Color.fromRGBO(64, 112, 117, 0.5),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }
}
