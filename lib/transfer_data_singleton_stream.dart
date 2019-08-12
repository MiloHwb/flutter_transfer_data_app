import 'dart:async';

import 'test_data.dart';


class TransferDataSingletonStream {
  TransferDataSingletonStream._();

  static final TransferDataSingletonStream _instance = TransferDataSingletonStream._();

  factory TransferDataSingletonStream() {
    return _instance;
  }

  StreamController streamController;

  void setTestData(TestData data) {
    streamController = StreamController<TestData>();
    streamController.sink.add(data);
  }
}
