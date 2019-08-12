import 'package:flutter/material.dart';
import 'package:flutter_transfer_data_app/test_data.dart';

class IGenericDataProvider<T> extends InheritedWidget {
  final T data;

  IGenericDataProvider({Key key, Widget child, this.data}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(IGenericDataProvider oldWidget) {
    return data != oldWidget.data;
  }

  static T of<T>(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(IGenericDataProvider<T>().runtimeType)
            as IGenericDataProvider<T>)
        .data;
  }
}

class DataByInheritedWidgetGeneric extends StatelessWidget {
  DataByInheritedWidgetGeneric({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited 泛型传递数据'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //创建数据
            TestData testData = TestData(name: 'Spike', age: 5, description: '一只倒霉的斗牛犬');
            //跳转页面，通过InheritedWidget传递数据
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => IGenericDataProvider<TestData>(
                      child: SubDataByInheritedWidgetGeneric(),
                      data: testData,
                    )));
          },
          child: Text('Inherited 泛型传递数据'),
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class SubDataByInheritedWidgetGeneric extends StatelessWidget {
  SubDataByInheritedWidgetGeneric({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取传递的数据
    TestData data = IGenericDataProvider.of<TestData>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(data.name),
            Text(data.age.toString()),
            Text(data.description),
            SubSubDataByInheritedWidgetGeneric(),
          ],
        ),
      ),
    );
  }
}

class SubSubDataByInheritedWidgetGeneric extends StatelessWidget {
  SubSubDataByInheritedWidgetGeneric({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = IGenericDataProvider.of<TestData>(context);
    return Text(data.name);
  }
}
