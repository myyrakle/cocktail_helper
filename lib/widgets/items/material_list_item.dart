import 'package:flutter/material.dart';

class MaterialListItem extends StatefulWidget {
  MaterialListItem({Key key, this.material}) : super(key: key);

  final Object material;

  @override
  _MaterialListItemState createState() => _MaterialListItemState(material);
}

class _MaterialListItemState extends State<MaterialListItem> {
  final Map _material;
  bool _own = false;

  _MaterialListItemState(this._material) {
    _own = _material['own'];
  }

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
