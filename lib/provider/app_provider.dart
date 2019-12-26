import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gita_app/utils/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  AppProvider() {}

  double fontScale = 1;
  String font = 'Roboto';
  List<bool> themeSelectionList =
      List.generate(appThemes.length, (int index) => false);

  ThemeData selectedTheme = ThemeData();
  int selectedChapter = 0;

  void setFontScale(double value) async {
    fontScale = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontScale', value);
    notifyListeners();
  }

  Future<void> setTheme(int index) async {
    selectedTheme = appThemes[index];
    themeSelectionList = List.generate(appThemes.length, (int index) => false);
    themeSelectionList[index] = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', index);
    notifyListeners();
  }

  Future<void> setFont(String value) async {
    font = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('font', value);
    notifyListeners();
  }

  Future<void> setAppDataFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fontScale = prefs.getDouble('fontScale') ?? 1;
    themeSelectionList[prefs.getInt('theme') ?? 0] = true;
    selectedTheme = appThemes[prefs.getInt('theme') ?? 0];
    font = prefs.getString('font') ?? 'Roboto';
    notifyListeners();
  }

  set setSelectedChapter(int value) {
    selectedChapter = value;
  }
}
