import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomButtom extends StatelessWidget {
  final VoidCallback onAddClick;
  final IconData iconDataMatetial;
  final IconData iconDataCupertino;
  const CustomButtom(
      {this.onAddClick, this.iconDataMatetial, this.iconDataCupertino});

  @override
  Widget build(BuildContext context) {
    return PlatformButton(
        onPressed: () => onAddClick(),
        material: (_, __) => MaterialRaisedButtonData(
              child: Icon(this.iconDataMatetial),
            ),
        cupertino: (_, __) => CupertinoButtonData(
              child: Icon(this.iconDataCupertino),
            ));
  }
}
