import 'package:flutter/material.dart';
import 'package:flutter_transfer_data_app/test_data.dart';

class IDataProvider extends InheritedWidget {
  final TestData data;

  IDataProvider({Key key, Widget child, this.data}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(IDataProvider oldWidget) {
    return data != oldWidget.data;
  }

  static IDataProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(IDataProvider);
  }
}

class DataByInheritedWidget extends StatelessWidget {
  DataByInheritedWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited传递数据'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //创建数据
            TestData testData = TestData(name: 'Tom', age: 3, description: '一只被Jerry欺负的美国蓝猫');
            //跳转页面，通过InheritedWidget传递数据
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => IDataProvider(
                      child: SubDataByInheritedWidget(),
                      data: testData,
                    )));
          },
          child: Text('Constructor传递数据'),
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class SubDataByInheritedWidget extends StatelessWidget {
  SubDataByInheritedWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取传递的数据
    var data = IDataProvider.of(context).data;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(data.name),
            Text(data.age.toString()),
            Text(data.description),
            SubSubDataByInheritedWidget(),
          ],
        ),
      ),
    );
  }
}

class SubSubDataByInheritedWidget extends StatelessWidget {
  SubSubDataByInheritedWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取传递的数据
    var data = IDataProvider.of(context).data;
    return Text(data.description);
  }
}
