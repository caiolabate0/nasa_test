import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = Provider<LocalStorage>(
  (ref) => SharedPreferencesLocalStorage.create(),
);

abstract class LocalStorage {
  Future<void> setBool(String key, bool value);
  Future<void> setDouble(String key, double value);
  Future<void> setInt(String key, int value);
  Future<void> setString(String key, String value);

  Future<bool?> getBool(String key);
  Future<double?> getDouble(String key);
  Future<int?> getInt(String key);
  Future<String?> getString(String key);

  Future<void> deleteKey(String key);
}

class SharedPreferencesLocalStorage extends LocalStorage {
  /// Function that returns an instance of [SharedPreferences]
  final Future<SharedPreferences> Function() prefs;

  SharedPreferencesLocalStorage({required this.prefs});

  factory SharedPreferencesLocalStorage.create() {
    return SharedPreferencesLocalStorage(
        prefs: () => SharedPreferences.getInstance());
  }

  /// Reads a value from [SharedPreferences], throwing an exception if it's not a
  /// [bool].
  @override
  Future<bool?> getBool(String key) async {
    return prefs().then((v) => v.getBool(key));
  }

  /// Reads a value from [SharedPreferences], throwing an exception if it's not a
  /// [double].
  @override
  Future<double?> getDouble(String key) async {
    return prefs().then((v) => v.getDouble(key));
  }

  /// Reads a value from [SharedPreferences], throwing an exception if it's not a
  /// [int].
  @override
  Future<int?> getInt(String key) async {
    return prefs().then((v) => v.getInt(key));
  }

  /// Reads a value from [SharedPreferences], throwing an exception if it's not a
  /// [String].
  @override
  Future<String?> getString(String key) async {
    return prefs().then((v) => v.getString(key));
  }

  /// Saves a [bool] [value] to [SharedPreferences] in the background.
  @override
  Future<void> setBool(String key, bool value) async {
    prefs().then((v) => v.setBool(key, value));
  }

  /// Saves a [double] [value] to [SharedPreferences] in the background.
  @override
  Future<void> setDouble(String key, double value) async {
    prefs().then((v) => v.setDouble(key, value));
  }

  /// Saves a [int] [value] to [SharedPreferences] in the background.
  @override
  Future<void> setInt(String key, int value) async {
    await prefs().then((v) => v.setInt(key, value));
  }

  /// Saves a [String] [value] to [SharedPreferences] in the background.
  @override
  Future<void> setString(String key, String value) async {
    await prefs().then((v) => v.setString(key, value));
  }

  @override
  Future<void> deleteKey(String key) async {
    final instance = await prefs();
    await instance.remove(key);
  }
}
