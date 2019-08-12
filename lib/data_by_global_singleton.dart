import 'package:flutter/material.dart';
import 'package:flutter_transfer_data_app/test_data.dart';

import 'transfer_data_singleton.dart';

class DataByGlobalSingleton extends StatelessWidget {
  DataByGlobalSingleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全局单例传递数据'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //创建数据
            TestData testData = TestData(name: 'Tyke', age: 1, description: '斯派克的狗儿子');
            TransferDataSingleton().testData = testData;
            //跳转页面
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SubDataByGlobalSingleton()));
          },
          child: Text('全局单例传递数据'),
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class SubDataByGlobalSingleton extends StatelessWidget {
  SubDataByGlobalSingleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = TransferDataSingleton().testData;
    return Scaffold(
      appBar: AppBar(
        title: Text('全局单例传递数据'),
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
