import 'package:http/http.dart' as http;

class CustomClient extends http.BaseClient {
  http.Client _client;

  CustomClient() : _client = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    return await _client.send(request);
  }
}
