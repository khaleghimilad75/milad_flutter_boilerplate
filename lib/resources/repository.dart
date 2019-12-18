import 'dart:async';

import 'package:http/http.dart';

import 'api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<Response> logIn(String username, String password) =>
      apiProvider.logIn(username, password);

  Future<Response> fetchExampleList() => apiProvider.fetchExampleList();
}
