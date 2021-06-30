import 'package:flutter/material.dart';
import 'package:todolist_application/model/thememodel.dart';

class ThemeProvier with ChangeNotifier {
  ThemeModel _themeModel = new ThemeModel(false);

  bool isDarkTheme() {
    return _themeModel.isDark();
  }

  void onToogleTheme(bool val) {
    _themeModel.toogle(val);
    notifyListeners();
  }
}
