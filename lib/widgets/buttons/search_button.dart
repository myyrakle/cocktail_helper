import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  SearchButton();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          Navigator.pushNamed(context, "/setting");
        });
  }
}
