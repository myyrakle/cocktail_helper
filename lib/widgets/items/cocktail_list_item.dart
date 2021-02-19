import 'package:flutter/material.dart';

class CocktailListItem extends StatefulWidget {
  CocktailListItem({Key key, this.material}) : super(key: key);

  final Object material;

  @override
  _CocktailListItemState createState() => _CocktailListItemState(material);
}

class _CocktailListItemState extends State<CocktailListItem> {
  final Map _material;
  bool _own = false;

  _CocktailListItemState(this._material) {
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
