import 'package:flutter/material.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

/// Экран виджет "Настройки"
class SettingsScreen extends StatefulWidget {
  final ValueChanged<ThemeType> onThemeChange;

  const SettingsScreen({Key key, @required this.onThemeChange})
      : assert(onThemeChange != null),
        super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Темная тема',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    color: Theme.of(context).appBarTheme.textTheme.title.color,
                  ),
                ),
                CupertinoSwitch(
                  value: _isDarkTheme,
                  trackColor: Colors.grey,
                  activeColor: Colors.green,
                  onChanged: (bool value) {
                    _isDarkTheme = value;
                    widget.onThemeChange(
                        value ? ThemeType.dark : ThemeType.light);
                  },
                ),
              ],
            ),
            Divider(
              height: 32,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => print('"Смотреть туториал" pressed.'),
                  child: Text(
                    'Смотреть туториал',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20,
                      color:
                          Theme.of(context).appBarTheme.textTheme.title.color,
                    ),
                  ),
                ),
                Image.asset(
                  'res/Info.png',
                  height: 30,
                  color: Colors.green,
                  colorBlendMode: BlendMode.modulate,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
            Divider(
              height: 32,
              thickness: 2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}