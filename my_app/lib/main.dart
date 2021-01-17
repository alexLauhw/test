import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';

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
  List<List<dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  loadAsset() async {
    final myData = await rootBundle.loadString('assets/data.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    data = csvTable;
    print(data);
  }

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
                    style: TextStyle(
                        color: Color.fromRGBO(55, 95, 134, 1), fontSize: 15)),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 50),
              child: Row(children: <Widget>[
                Text('▴   ' + (data.isNotEmpty ? data.toString() : '1.640'),
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
              child: Row(children: <Widget>[
                GeneralTextView(title: '高',content: '1.670'),
                GeneralTextView(title: '開',content: '1.670')
              ]),
            ),
            Container(
              child: Row(children: <Widget>[
                GeneralTextView(title: '低',content: '1.620'),
                GeneralTextView(title: '前',content: '1.620')
              ]),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              color: Color.fromRGBO(28, 36, 42, 1),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: GeneralTextView(title: '成交金額',content: '92.00K'),
                  ),
                  Expanded(
                    child: GeneralTextView(title: '成交股數',content: '56.06K'),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '交易宗數',content: '21'),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '每手股數',content: '2000'),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              color: Color.fromRGBO(28, 36, 42, 1),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '買賣差價',content: '0.010/0.010'),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '入場費',content: '3280'),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '帳面淨值',content: 'HKD 2.109'),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '每股派息',content: 'HKD 0.085'),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              color: Color.fromRGBO(28, 36, 42, 1),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '市盈率',content: '9.90'),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '周息率',content: '5.18%'),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '預測市盈',content: ''),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '預測息率',content: ''),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              color: Color.fromRGBO(28, 36, 42, 1),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '1個月高',content: '1.700'),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '52周高',content: '1.750'),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '1個月低',content: '1.550'),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '52周低',content: '1.240'),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              color: Color.fromRGBO(28, 36, 42, 1),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '14天 RSI',content: '46.732'),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '10天平均',content: '1.617'),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '市值',content: '707.82M'),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '20天平均',content: ''),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              color: Color.fromRGBO(28, 36, 42, 1),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '沽空(上午)',content: ''),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '50天平均',content: ''),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom:5),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: GeneralTextView(title: '沽空',content: ''),
                  ),
                  Flexible(
                    child: GeneralTextView(title: '350天平均',content: ''),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Container(
              height: 300
            )
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

class GeneralTextView extends StatefulWidget {
  GeneralTextView({Key key, this.title,Key key1, this.content}) : super(key: key);
  final String title;
  final String content;

  @override
  _GeneralTextView createState() => _GeneralTextView();
}

class _GeneralTextView extends State<GeneralTextView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Container(width: 10,),
        Align(alignment: Alignment.centerLeft, child: Text(widget.title, style: TextStyle(color: Color.fromRGBO(55, 95, 134, 1), fontSize: 15),),),
        Container(width: 20,),
        Align(alignment: Alignment.centerRight, child: Text(widget.content, style: TextStyle(color: Colors.white, fontSize: 15),textAlign: TextAlign.right,),)
      ]),
    );
  }
}
