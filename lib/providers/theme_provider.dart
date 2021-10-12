import 'dart:developer';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final _prefs = EncryptedSharedPreferences();

  static const _keyTheme = 'themeApp';
  static const _dark = 'dark';
  static const _light = 'light';
  static const _system = 'system';

  ThemeMode? _themeMode;
  ThemeMode? get getTheme => _themeMode;

  ThemeProvider() {
    _initTheme();
  }

  void _initTheme() async {
    await _prefs.getString(_keyTheme).then((String value) {
      log('Theme from storage: $value');
      var themeMode = value.isEmpty ? _light : value;
      if (themeMode == _light) {
        _themeMode = ThemeMode.light;
      }
      if (themeMode == _dark) {
        _themeMode = ThemeMode.dark;
      }
      if (themeMode == _system) {
        _themeMode = ThemeMode.system;
      }
      _debugProvider();
      notifyListeners();
    });
  }

  void setDarkTheme(themeMode) async {
    _themeMode = themeMode;
    await _prefs.setString(_keyTheme, _dark);
    _debugProvider();
    notifyListeners();
  }

  void setLightTheme(themeMode) async {
    _themeMode = themeMode;
    await _prefs.setString(_keyTheme, _light);
    _debugProvider();
    notifyListeners();
  }

  void setSystemTheme(themeMode) async {
    _themeMode = themeMode;
    await _prefs.setString(_keyTheme, _system);
    _debugProvider();
    notifyListeners();
  }

  void _debugProvider() {
    log('Theme mode: $_themeMode');
  }
}
