import 'package:flutter/material.dart';
import 'package:flutter_transfer_data_app/transfer_data_singleton_stream.dart';

import 'test_data.dart';

class DataByGlobalSingletonStream extends StatelessWidget {
  DataByGlobalSingletonStream({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全局单例结合Stream传递参数'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //创建数据
            TestData testData = TestData(name: 'Butch', age: 6, description: '可怜的流浪猫');
            TransferDataSingletonStream().setTestData(testData);
            //跳转页面，通过构造器传递数据
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SubDataByGlobalSingletonStream()));
          },
          child: Text('全局单例结合Stream传递参数'),
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class SubDataByGlobalSingletonStream extends StatelessWidget {
  SubDataByGlobalSingletonStream({Key key}) : super(key: key);
  final streamController = TransferDataSingletonStream().streamController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全局单例结合Stream传递参数'),
      ),
      body: StreamBuilder(
        stream: streamController.stream,
        initialData: TestData(name: '', age: 0, description: ''),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(snapshot.data.name),
                Text(snapshot.data.age.toString()),
                Text(snapshot.data.description),
              ],
            ),
          );
        },
      ),
    );
  }
}
