import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:cocktail_helper/sqlite/manager.dart';
import 'package:cocktail_helper/widgets/hamburger.dart';
import 'file:///C:/Users/sssan/Code/Flutter/cocktail_helper/cocktail_helper/lib/widgets/appbar/appbar.dart';

import 'package:cocktail_helper/widgets/items/material_list_item.dart';

class CocktailListPage extends StatefulWidget {
  CocktailListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CocktailListPageState createState() => _CocktailListPageState();
}

class _CocktailListPageState extends State<CocktailListPage> {
  int _counter = 0;
  List<Map> _materialList;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var db = context.watch<DatabaseManager>();

    var arg = ModalRoute.of(context).settings.arguments;
    //db.getMaterialList();

    return Scaffold(
      appBar: HomeAppBar(),
      drawer: HamburgerMenu(),
      body: null,
    );
  }
}
