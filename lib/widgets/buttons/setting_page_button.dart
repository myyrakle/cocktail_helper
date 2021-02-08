import 'package:flutter/material.dart';

class SettingPageButton extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
          Navigator.pushNamed(context, "/setting");
        });
  }
}
