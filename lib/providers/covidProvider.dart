import 'dart:io';

import 'package:covid/services/api.dart';
import 'package:flutter/cupertino.dart';

class CovidProvider with ChangeNotifier {
  late bool _result;
  bool get result => _result;
  Future<void> postData(File file) async {
    await Api().postData(file).catchError((error) {
      print(error);
      print("Could not post data");
      throw (error);
    });
  }

  Future<void> getResults() async {
    _result = await Api().getResults().catchError((error) {
      print(error);
      print("Could not get results");
      throw (error);
    });
  }
}
