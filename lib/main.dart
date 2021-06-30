import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:todolist_application/provider/themeProvider.dart';
import 'package:todolist_application/theme/theme.dart';

import 'package:todolist_application/widgets/Dialog.dart';
import 'package:todolist_application/widgets/IconButton.dart';
import 'package:todolist_application/screens/todoList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvier>(
        create: (context) => ThemeProvier(), child: PlatformAPP()); //
  }
}

class PlatformAPP extends StatelessWidget {
  const PlatformAPP({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvier = context.watch<ThemeProvier>();
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      material: (_, __) => MaterialAppData(
          theme: materialThemeData,
          darkTheme: ThemeData.dark(),
          themeMode:
              themeProvier.isDarkTheme() ? ThemeMode.dark : ThemeMode.light),
      cupertino: (_, __) => CupertinoAppData(theme: cupertinoTheme),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvier = context.read<ThemeProvier>();
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: PlatformText("Todo List"),
          leading: Icon(context.platformIcons.bookmark),
          trailingActions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformSwitch(
                onChanged: (bool value) {
                  themeProvier.onToogleTheme(value);
                },
                value: themeProvier.isDarkTheme(),
              ),
            ),
            CustomIconButton(
              onPress: () => {_custonDialog(context)},
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
              title: 'Checking the library',
              content: PlatformText('You Like it?'),
              platformACtionDialogList: [
                PlatformDialogAction(
                  child: PlatformText('Yes'),
                  onPressed: () => Navigator.pop(context),
                ),
              ]);
        });
  }
}
