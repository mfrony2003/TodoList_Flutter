import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Screen extends StatefulWidget {
  const Screen();

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  double _currentValue = 0.0;
  bool _currentSwitchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformSlider(
                min: 0.0,
                max: 100.0,
                value: _currentValue,
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlatformSwitch(
          value: _currentSwitchValue,
          onChanged: (value) {
            setState(() {
              _currentSwitchValue = value;
            });
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlatformTextField(
          keyboardType: TextInputType.text,
          material: (_, __) => MaterialTextFieldData(
            decoration: InputDecoration(labelText: 'Text Field1'),
          ),
          cupertino: (_, __) => CupertinoTextFieldData(
            placeholder: 'Text Field',
          ),
        ),
      ),
    ]);
    ;
  }
}
