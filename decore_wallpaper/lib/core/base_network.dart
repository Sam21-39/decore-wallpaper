// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart';

class BaseHttp {
  static Client? client;
  static const String API_KEY =
      "563492ad6f91700001000001ecb1c45f8ef346319801ecc7c0b9e7c3";

  static const BASE_URL = "api.pexels.com/v1/";
  static Client getClient() {
    client ??= Client();
    return client as Client;
  }

  static Future<dynamic> fetchData(String path, {var queryParameter}) async {
    Uri url = Uri.https(BASE_URL, path, queryParameter);
    final response =
        await getClient().get(url, headers: {"Authorization": API_KEY});
    return json.decode(response.body);
  }
}
