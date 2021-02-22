import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:cocktail_helper/sqlite/manager.dart';
import 'package:cocktail_helper/widgets/hamburger.dart';
import 'file:///C:/Users/sssan/Code/Flutter/cocktail_helper/cocktail_helper/lib/widgets/appbar/appbar.dart';

import 'package:cocktail_helper/widgets/items/material_list_item.dart';

class MaterialCategoryPage extends StatefulWidget {
  MaterialCategoryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MaterialCategoryPageState createState() => _MaterialCategoryPageState();
}

class _MaterialCategoryPageState extends State<MaterialCategoryPage> {
  List<Map> _materialList;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var db = context.watch<DatabaseManager>();

    //db.getMaterialList();

    return Scaffold(
      appBar: HomeAppBar(),
      drawer: HamburgerMenu(),
      body: null,
    );
  }
}
