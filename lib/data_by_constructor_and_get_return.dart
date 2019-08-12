import 'package:flutter/material.dart';

import 'back_data.dart';
import 'test_data.dart';

class DataByConstructorAndGetReturn extends StatefulWidget {
  DataByConstructorAndGetReturn({Key key}) : super(key: key);

  @override
  _DataByConstructorAndGetReturnState createState() {
    return _DataByConstructorAndGetReturnState();
  }
}

class _DataByConstructorAndGetReturnState extends State<DataByConstructorAndGetReturn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('构造器传递参数'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                //创建数据
                _jumpForResult(context);
              },
              child: Text('Constructor传递数据'),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
            ),
            _backData == null ? CircularProgressIndicator() : Text(_backData.sendBack),
          ],
        ),
      ),
    );
  }

  BackData _backData;

  void _jumpForResult(BuildContext context) async {
    //创建数据
    TestData testData = TestData(name: 'Jerry', age: 2, description: '一只经常欺负Tom的小老鼠');
    //跳转页面，通过构造器传递数据
    _backData = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SubDataByConstructorAndReturn(data: testData)));

    setState(() {});
  }
}

class SubDataByConstructorAndReturn extends StatelessWidget {
  final TestData data;

  //通过构造器接收参数
  SubDataByConstructorAndReturn({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('返回监听');
        Navigator.pop(context, BackData(name: 'Jerry', sendBack: '你好，我是Jerry'));

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('构造器显示参数并且返回数据'),
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
      ),
    );
  }
}
