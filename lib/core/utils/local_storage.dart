// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TOKEN = 'token';

class LocalStorage {
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage secureStorage;

  LocalStorage({
    required this.sharedPreferences,
    required this.secureStorage,
  });

  Future<void> setToken(String token) async => kIsWeb
      ? await sharedPreferences.setString(TOKEN, token)
      : await secureStorage.write(key: TOKEN, value: token);

  Future<String?> getToken() async => kIsWeb
      ? sharedPreferences.getString(TOKEN)
      : await secureStorage.read(key: TOKEN);
}
