import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final _prefs = EncryptedSharedPreferences();

  static const _keyTheme = 'themeApp';
  static const _dark = 'dark';
  static const _light = 'light';
  static const _system = 'system';

  ThemeMode? _themeMode2;
  ThemeMode? get getTheme => _themeMode2;

  ThemeProvider() {
    _initTheme();
  }

  void _initTheme() async {
    await _prefs.getString(_keyTheme).then((String value) {
      print('Theme from storage: $value');
      var themeMode = value.isEmpty ? _light : value;
      if (themeMode == _light) {
        _themeMode2 = ThemeMode.light;
      }
      if (themeMode == _dark) {
        _themeMode2 = ThemeMode.dark;
      }
      if (themeMode == _system) {
        _themeMode2 = ThemeMode.system;
      }
      _debugProvider();
      notifyListeners();
    });
  }

  void setDarkTheme(themeMode) async {
    _themeMode2 = themeMode;
    await _prefs.setString(_keyTheme, _dark);
    _debugProvider();
    notifyListeners();
  }

  void setLightTheme(themeMode) async {
    _themeMode2 = themeMode;
    await _prefs.setString(_keyTheme, _light);
    _debugProvider();
    notifyListeners();
  }

  void setSystemTheme(themeMode) async {
    _themeMode2 = themeMode;
    await _prefs.setString(_keyTheme, _system);
    _debugProvider();
    notifyListeners();
  }

  void _debugProvider() {
    print('Theme mode: $_themeMode2');
  }
}
