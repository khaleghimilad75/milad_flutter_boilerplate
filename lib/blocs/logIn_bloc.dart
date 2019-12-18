import 'dart:async';

import 'package:http/http.dart';

import '../resources/storage.dart';
import '../resources/repository.dart';

class LogInBloc {
  final _repository = Repository();

  Future<bool> logIn(String username, String password) async {
    Response _response = await _repository.logIn(username, password);
    if (_response.statusCode == 200) {
      Storage.setApiToken("Your Api Token");
      return true;
    } else
      return false;
  }
}

final logInBloc = LogInBloc();
