import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> platformACtionDialogList;
  CustomDialog({this.title, this.content, this.platformACtionDialogList});

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      title: PlatformText(title),
      content: content,
      actions: platformACtionDialogList,
    );
  }
}
