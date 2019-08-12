import 'package:flutter_transfer_data_app/test_data.dart';

class TransferDataSingleton {
  static final TransferDataSingleton _instance = TransferDataSingleton._();

  factory TransferDataSingleton() {
    return _instance;
  }

  TestData testData;

  //私有化构造
  TransferDataSingleton._();
}
