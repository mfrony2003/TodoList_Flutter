import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final materialThemeData = new ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.green.shade600),
    primaryColor: Colors.green,
    secondaryHeaderColor: Colors.green,
    canvasColor: Colors.green,
    backgroundColor: Colors.red,
    textTheme: TextTheme().copyWith(bodyText2: TextTheme().bodyText2),
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.normal,
    ));

final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white);
