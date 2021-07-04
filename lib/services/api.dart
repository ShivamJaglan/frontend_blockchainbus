import 'dart:convert';
import 'dart:io';

import 'package:covid/services/base.dart';
import 'package:http/http.dart';

class Api extends BaseApi {
  Future<void> postData(File file) async {
    String url = "http://IPADDRESS:8000/data/";
    var request = new MultipartRequest("POST", Uri.parse(url));

    var multipartFile = await MultipartFile.fromPath("package", file.path);
    request.files.add(multipartFile);

    StreamedResponse response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  Future<bool> getResults() async {
    String url = "http://IPADDRESS:8000/data/";
    var response = await requestClient.get(Uri.parse(url)).catchError((error) {
      print(error);
      throw (error);
    });
    requestClient.close();
    print(response.body);
    return (json.decode(response.body)["result"]);
  }
}
