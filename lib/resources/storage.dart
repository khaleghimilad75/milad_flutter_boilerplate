


import 'package:localstorage/localstorage.dart';

class Storage{

  static Future clear() async => LocalStorage('some_key').clear();

  static Future setItemLocalStorage(key, value) async {
    final LocalStorage storage = LocalStorage('some_key');
    await storage.ready;
    storage.setItem(key, value);
  }

  static Future<String> getItemLocalStorage(key) async {
    final LocalStorage storage = LocalStorage('some_key');
    await storage.ready;
    return storage.getItem(key);
  }

  static Future setApiToken(token) async {
    await setItemLocalStorage('api_token', token);
  }

  static Future<String> getApiToken() async {
    return await getItemLocalStorage('api_token');
  }
}