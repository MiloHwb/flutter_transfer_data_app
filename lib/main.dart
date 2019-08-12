import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data_by_constructor.dart';
import 'data_by_constructor_and_get_return.dart';
import 'data_by_inherited_widget.dart';
import 'data_by_inherited_widget_generic.dart';

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

  var time = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        var timeCurrently = DateTime.now().millisecondsSinceEpoch;
        if (timeCurrently - time > 2000) {
          time = timeCurrently;
          print('再按一次退出APP');
        } else {
          pop();
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('数据传递的几种方式'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DataByConstructor())),
              child: Text('Sample 通过构造器传递数据'),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DataByConstructorAndGetReturn())),
              child: Text('Sample 通过构造器传递数据，并获取返回数据'),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DataByInheritedWidget())),
              child: Text('Sample 通过InheritedWidget传递数据'),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DataByInheritedWidgetGeneric())),
              child: Text('Sample 通过InheritedWidget传递数据（泛型方式）'),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  void pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
