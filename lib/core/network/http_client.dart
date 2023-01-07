import 'package:http/http.dart';

class HttpClient {
  final Client client;

  const HttpClient(this.client);

  Future<Response> get(Uri url, {Map<String, String>? headers}) {
    return client.get(url, headers: headers);
  }
}
