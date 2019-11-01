import 'package:flutter_app_architecture/data/local/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

//commit message -> updated clear-shared-prefs method, to hold user-email & password for remember-me feature.

class AppSharedPrefs{

  static final AppSharedPrefs _repo = new AppSharedPrefs();
  static AppSharedPrefs get() => _repo;

  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> addValue(PreferenceKeys preferenceKeys, String text) async {
    SharedPreferences prefs = await getSharedPrefs();
    await prefs.setString(preferenceKeys.getKey(), text);
  }

  Future<void> addBoolean(PreferenceKeys preferenceKeys, bool value) async {
    SharedPreferences prefs = await getSharedPrefs();
    await prefs.setBool(preferenceKeys.getKey(), value);
  }

  Future<void> addInt(PreferenceKeys preferenceKeys, int value) async {
    SharedPreferences prefs = await getSharedPrefs();
    await prefs.setInt(preferenceKeys.getKey(), value);
  }

  Future<String> getValue(PreferenceKeys preferenceKeys) async {
    SharedPreferences prefs = await getSharedPrefs();
    return prefs.getString(preferenceKeys.getKey());
  }

  Future<int> getInt(PreferenceKeys preferenceKeys) async {
    SharedPreferences prefs = await getSharedPrefs();
    return prefs.getInt(preferenceKeys.getKey());
  }

  Future<bool> getBoolean(PreferenceKeys preferenceKeys) async {
    SharedPreferences prefs = await getSharedPrefs();
    return prefs.getBool(preferenceKeys.getKey());
  }

  Future<bool> clearSharedPreference() async {
    SharedPreferences prefs = await getSharedPrefs();
    String email = await getValue(PreferenceKeys.USER_EMAIL);
    String password = await getValue(PreferenceKeys.USER_PASSWORD);
    await prefs.clear();
    await addValue(PreferenceKeys.USER_EMAIL, email);
    await addValue(PreferenceKeys.USER_PASSWORD, password);
    return true;
  }

}