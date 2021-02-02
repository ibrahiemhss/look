import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final Future<SharedPreferences> _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<String> get authToken async {
    return _sharedPreference.then((preference) {
      return preference.getString(Preferences.auth_token);
    });
  }

  Future<void> saveAuthToken(String authToken) async {
    return _sharedPreference.then((preference) {
      preference.setString(Preferences.auth_token, authToken);
    });
  }

  Future<void> removeAuthToken() async {
    return _sharedPreference.then((preference) {
      preference.remove(Preferences.auth_token);
    });
  }

  Future<bool> get isLoggedIn async {
    return _sharedPreference.then((preference) {
      return preference.getString(Preferences.auth_token) ?? false;
    });
  }

  // FCm Methods: ----------------------------------------------------------
  Future<String> get fcmToken async {
    return _sharedPreference.then((preference) {
      return preference.getString(Preferences.fcm_token);
    });
  }

  Future<void> saveFcmToken(String authToken) async {
    return _sharedPreference.then((preference) {
      preference.setString(Preferences.fcm_token, authToken);
    });
  }

  Future<void> removeFcmToken() async {
    return _sharedPreference.then((preference) {
      preference.remove(Preferences.fcm_token);
    });
  }
  // Theme:------------------------------------------------------
  Future<bool> get isDarkMode {
    return _sharedPreference.then((prefs) {
      return prefs.getBool(Preferences.is_dark_mode) ?? false;
    });
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.then((prefs) {
      return prefs.setBool(Preferences.is_dark_mode, value);
    });
  }
  // Language:---------------------------------------------------
  Future<String> get currentPageTitle {
    return _sharedPreference.then((prefs) {
      return prefs.getString(Preferences.currentPageTitle);
    });
  }

  Future<void> changePageTitle(String title) {
    return _sharedPreference.then((prefs) {
      return prefs.setString(Preferences.currentPageTitle, title);
    });
  }
  Future<void> setFirstInter(bool value) {
    return _sharedPreference.then((prefs) {
      return prefs.setBool(Preferences.first_inter, value);
    });
  }
  Future<bool> get isFirstInter {
    return _sharedPreference.then((prefs) {
      return prefs.getBool(Preferences.first_inter);
    });
  }

  // Language:---------------------------------------------------
  Future<String> get currentLanguage {
    return _sharedPreference.then((prefs) {
      return prefs.getString(Preferences.current_language);
    });
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.then((prefs) {
      return prefs.setString(Preferences.current_language, language);
    });
  }
  // Url:---------------------------------------------------
  Future<String> get currentUrl {
    return _sharedPreference.then((prefs) {
      return prefs.getString(Preferences.Url);
    });
  }

  Future<void> changeUrl(String url) {
    return _sharedPreference.then((prefs) {
      return prefs.setString(Preferences.Url, url);
    });
  }

  // Internet connection:---------------------------------------------------
  Future<bool> get isConnected {
    return _sharedPreference.then((prefs) {
      return prefs.getBool(Preferences.Connected);
    });
  }

  Future<void> setInternetStatus(bool status) {

    return _sharedPreference.then((prefs) {
      return prefs.setBool(Preferences.Connected, status);
    });
  }
}
