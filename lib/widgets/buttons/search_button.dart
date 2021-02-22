import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchButton extends StatelessWidget {
  final _onClick;

  SearchButton(this._onClick);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          _onClick();
        });
  }
}
