class ThemeModel {
  bool _isDark;
  ThemeModel(this._isDark);
  isDark() => this._isDark;
  toogle(val) => this._isDark = val;
}
