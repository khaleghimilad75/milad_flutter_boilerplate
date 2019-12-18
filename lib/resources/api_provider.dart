import 'dart:async';

import 'package:futter_boilerplate/resources/storage.dart';
import 'package:http/http.dart' show Client, Response;

class ApiProvider {
  Client client = Client();
  final _baseUrl = "Your WebService Address"; // Sample == "esperlos.ir/api/"

  Future<Response> post(String methodAddress, dynamic body) async {
    Response response;
    await Storage.getApiToken().then((token) async {
      body['api_token'] = token;
      response = await client
          .post(
            _baseUrl + methodAddress,
            body: body,
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
          )
          .timeout(Duration(seconds: 10))
          .catchError((response) {
            return response;
          })
          .then((response) {
            return response;
          });
    });
    return response;
  }

  Future<Response> get(String url, dynamic body) async {
    Response response;
    await Storage.getApiToken().then((token) async {
      body['api_token'] = token;
      response = await client
          .get(
            _baseUrl + url,
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
          )
          .timeout(Duration(seconds: 10))
          .catchError((response) {
            return response;
          })
          .then((response) {
            return response;
          });
    });
    return response;
  }

  Future<Response> logIn(String username, String password) async {
    if (username == "admin" && password == "1234")
      return new Response("", 200);
    else
      return new Response("", 500);

    /**
     * Example Real Connection to Web Service
     * Like Below
     */
    return post("login", {"username": username, "password": password});
  }

  Future<Response> fetchExampleList() => post("list_address", {});
}
