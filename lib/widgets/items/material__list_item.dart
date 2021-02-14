import 'package:flutter/material.dart';

class MaterialListItem extends StatefulWidget {
  MaterialListItem({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MaterialListItemState createState() => _MaterialListItemState();
}

class _MaterialListItemState extends State<MaterialListItem> {
  bool _own = false;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
