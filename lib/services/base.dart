import 'package:covid/services/customClient.dart';
import 'package:http/http.dart' as http;

abstract class BaseApi {
  http.Client requestClient;

  BaseApi() : requestClient = CustomClient();
}
