import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:todolist_application/screen.dart';

final materialThemeData = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.blue,
    appBarTheme: AppBarTheme(color: Colors.blue.shade600),
    primaryColor: Colors.blue,
    secondaryHeaderColor: Colors.blue,
    canvasColor: Colors.blue,
    backgroundColor: Colors.red,
    textTheme: TextTheme().copyWith(bodyText2: TextTheme().bodyText2));

final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      material: (_, __) => MaterialAppData(theme: materialThemeData),
      cupertino: (_, __) => CupertinoAppData(theme: cupertinoTheme),
      home: MyHomePage(),
    ); //
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: PlatformText('Review'),
          leading: Icon(context.platformIcons.book),
          trailingActions: <Widget>[
            PlatformIconButton(
              materialIcon: Icon(Icons.add),
              cupertinoIcon: Icon(
                CupertinoIcons.add,
                size: 28.0,
              ),
            ),
            PlatformIconButton(
              materialIcon: Icon(Icons.info),
              cupertinoIcon: Icon(
                CupertinoIcons.info,
                size: 28.0,
              ),
            ),
          ],
          material: (_, __) => MaterialAppBarData(),
          cupertino: (_, __) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
            leading: PlatformButton(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        body: Center(
          child: Screen(),
        ));
  }
}
