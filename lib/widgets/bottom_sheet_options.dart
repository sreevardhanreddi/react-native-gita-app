import 'package:flutter/material.dart';
import 'package:gita_app/provider/app_provider.dart';
import 'package:gita_app/utils/theme_data.dart';
import 'package:provider/provider.dart';

class BottomSheetOptions extends StatefulWidget {
  BottomSheetOptions({Key key}) : super(key: key);

  @override
  _BottomSheetOptionsState createState() => _BottomSheetOptionsState();
}

class _BottomSheetOptionsState extends State<BottomSheetOptions> {
  double _fontScale = 3;
  List<bool> _themeSelection = [true, false, false];
  String _font = 'Roboto';

  @override
  void didChangeDependencies() {
    final appProvider = Provider.of<AppProvider>(context);
    setState(() {
      _fontScale = appProvider.fontScale;
      _themeSelection = appProvider.themeSelectionList;
    });

    super.didChangeDependencies();
  }

  void _changeFontScale(double value) {
    setState(() {
      _fontScale = value;
    });
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.setFontScale(value);
  }

  void _onChangeTheme(int index) async {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < _themeSelection.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          _themeSelection[buttonIndex] = true;
        } else {
          _themeSelection[buttonIndex] = false;
        }
      }
    });
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    await appProvider.setTheme(index);
  }

  void _onChangeFont(String value) async {
    setState(() {
      _font = value;
    });
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    await appProvider.setFont(value);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      height: height / 2,
      padding: EdgeInsets.symmetric(
        horizontal: height / 30,
        vertical: height / 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text('Font Size'),
            ),
            Container(
              padding: EdgeInsets.only(
                top: height / 30,
              ),
              child: Slider(
                value: appProvider.fontScale,
                onChanged: _changeFontScale,
                min: 1,
                max: 10,
                divisions: 1000,
                label: "${appProvider.fontScale.toStringAsFixed(1)}",
              ),
            ),
            Container(
              child: Text('Theme'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height / 80,
              ),
            ),
            Container(
              child: ToggleButtons(
                children: <Widget>[
                  Icon(Icons.brightness_5),
                  Icon(Icons.brightness_6),
                  Icon(Icons.brightness_3),
                ],
                onPressed: _onChangeTheme,
                isSelected: _themeSelection,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height / 40,
              ),
            ),
            Container(
              child: Text('Font Family'),
            ),
            Container(
              padding: EdgeInsets.only(top: height / 30),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Container(
                    child: Center(
                      child: Text('Font'),
                    ),
                  ),
                  value: appProvider.font,
                  onChanged: _onChangeFont,
                  items:
                      <String>['Roboto', 'Raleway', 'Muli'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
