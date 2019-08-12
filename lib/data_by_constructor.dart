import 'package:flutter/material.dart';

import 'test_data.dart';

class DataByConstructor extends StatelessWidget {
  DataByConstructor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('构造器传递参数'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //创建数据
            TestData testData = TestData(name: 'Tom', age: 3, description: '一只被Jerry欺负的美国蓝猫');
            //跳转页面，通过构造器传递数据
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SubDataByConstructor(data: testData)));
          },
          child: Text('Constructor传递数据'),
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class SubDataByConstructor extends StatelessWidget {
  final TestData data;

  //通过构造器接收参数
  SubDataByConstructor({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('构造器显示参数'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(data.name),
            Text(data.age.toString()),
            Text(data.description),
          ],
        ),
      ),
    );
  }
}
