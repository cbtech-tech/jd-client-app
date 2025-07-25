import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';



class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }


  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreferences Initialized');
  }

  /// Clear all stored data
  Future<void> clearPreferencesData() async {
    await _sharedPreferences?.clear();
  }

  // -------------------------
  // TOKEN
  Future<void> setToken(String value) => _sharedPreferences!.setString('token', value);
  String? getToken() => _sharedPreferences!.getString('token');

  // -------------------------
  // USER ID
  Future<void> setUserId(String value) => _sharedPreferences!.setString('userId', value);
  String? getUserId() => _sharedPreferences!.getString('userId');

  // -------------------------
  // USERNAME
  Future<void> setUsername(String value) => _sharedPreferences!.setString('username', value);
  String? getUsername() => _sharedPreferences!.getString('username');

   // USERTYPE
  Future<void> setUsertype(String value) => _sharedPreferences!.setString('usertype', value);
  String? getUsertype() => _sharedPreferences!.getString('usertype');


  // -------------------------
  // EMAIL
  Future<void> setEmail(String value) => _sharedPreferences!.setString('email', value);
  String? getEmail() => _sharedPreferences!.getString('email');

  // -------------------------
  // IS LOGGED IN
  Future<void> setIsLoggedIn(bool value) => _sharedPreferences!.setBool('isLoggedIn', value);
  bool getIsLoggedIn() => _sharedPreferences!.getBool('isLoggedIn') ?? false;

  // -------------------------
  // THEME (light / dark / primary)
  Future<void> setThemeData(String value) => _sharedPreferences!.setString('themeData', value);
  
  String getThemeData() => _sharedPreferences?.getString('themeData') ?? 'primary';

  // -------------------------
  // LANGUAGE CODE (en, hi, fr, etc.)
  Future<void> setLanguageCode(String value) => _sharedPreferences!.setString('languageCode', value);
  String getLanguageCode() => _sharedPreferences!.getString('languageCode') ?? 'en';

  // -------------------------
  // NOTIFICATIONS ENABLED
  Future<void> setNotificationsEnabled(bool value) => _sharedPreferences!.setBool('notificationsEnabled', value);
  bool getNotificationsEnabled() => _sharedPreferences!.getBool('notificationsEnabled') ?? true;

  // -------------------------
  // ONBOARDING SHOWN
  Future<void> setOnboardingShown(bool value) => _sharedPreferences!.setBool('onboardingShown', value);
  bool getOnboardingShown() => _sharedPreferences!.getBool('onboardingShown') ?? false;

  // -------------------------
  // GENERIC SET/GET STRING
  Future<void> setString(String key, String value) => _sharedPreferences!.setString(key, value);
  String? getString(String key) => _sharedPreferences!.getString(key);

  // GENERIC SET/GET BOOL
  Future<void> setBool(String key, bool value) => _sharedPreferences!.setBool(key, value);
  bool getBool(String key) => _sharedPreferences!.getBool(key) ?? false;

  // GENERIC SET/GET INT
  Future<void> setInt(String key, int value) => _sharedPreferences!.setInt(key, value);
  int getInt(String key) => _sharedPreferences!.getInt(key) ?? 0;

/*
Future<void> saveUserModel(User user) async {
  String jsonString = jsonEncode(user.toJson());
  await _sharedPreferences?.setString('userModel', jsonString);
}

User? getUserModel() {
  String? jsonString = _sharedPreferences?.getString('userModel');
  if (jsonString == null) return null;

  try {
    Map<String, dynamic> map = jsonDecode(jsonString);
    return User.fromJson(map);
  } catch (e) {
    print("Error decoding user model: $e");
    return null;
  }
}
*/


Future<void> clearAllPreferences() async {
  await _sharedPreferences?.clear();
  print("All preferences cleared.");
}


  // GENERIC REMOVE
  Future<void> remove(String key) => _sharedPreferences!.remove(key);
}
