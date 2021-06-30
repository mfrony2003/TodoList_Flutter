import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData iconDataMaterial;
  final IconData iconDataCupertino;
  const CustomIconButton(
      {this.onPress, this.iconDataMaterial, this.iconDataCupertino});

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      onPressed: () => onPress(),
      material: (_, __) =>
          MaterialIconButtonData(icon: Icon(this.iconDataMaterial)),
      cupertino: (_, __) =>
          CupertinoIconButtonData(icon: Icon(this.iconDataCupertino)),
    );
  }
}
