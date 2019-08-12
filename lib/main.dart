import 'package:flutter/material.dart';

import 'data_by_constructor.dart';
import 'data_by_constructor_and_get_return.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据传递的几种方式'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DataByConstructor()));
            },
            child: Text('Sample 通过构造器传递数据'),
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DataByConstructorAndGetReturn()));
            },
            child: Text('Sample 通过构造器传递数据，并获取返回数据'),
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
