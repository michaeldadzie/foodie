// ignore_for_file: prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.white,
);

ThemeData dark = ThemeData(
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.black,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier(
    this.prefs,
    this._darkTheme,
  ) {
    _darkTheme = true;
    loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }

  loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs?.getBool(key) ?? true;
    notifyListeners();
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs?.setBool(key, darkTheme);
  }
}
