import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:todolist_application/widgets/Dialog.dart';
import 'package:todolist_application/widgets/IconButton.dart';
import 'package:todolist_application/screens/todoList.dart';

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
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: PlatformText('Todo List'),
          leading: Icon(context.platformIcons.home),
          trailingActions: <Widget>[
            CustomIconButton(
              onPress: () {
                _custonDialog(context);
              },
              iconDataCupertino: CupertinoIcons.add,
              iconDataMaterial: Icons.add,
            ),
            CustomIconButton(
              onPress: () => {},
              iconDataCupertino: CupertinoIcons.info,
              iconDataMaterial: Icons.info,
            ),
          ],
        ),
        body: Center(
          //child: Screen(),
          child: TodoList(),
        ));
  }

  Future<PlatformAlertDialog> _custonDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
              title: 'This is a test',
              content: PlatformText('Hellow'),
              platformACtionDialogList: [
                PlatformDialogAction(
                  child: PlatformText('Ok'),
                  onPressed: () => Navigator.pop(context),
                ),
              ]);
        });
  }
}
