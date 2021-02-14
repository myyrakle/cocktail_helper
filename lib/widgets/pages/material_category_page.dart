import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:cocktail_helper/sqlite/manager.dart';
import 'package:cocktail_helper/widgets/hamburger.dart';
import 'package:cocktail_helper/widgets/appbar.dart';

import 'package:cocktail_helper/widgets/items/material_list_item.dart';

class MaterialPage extends StatefulWidget {
  MaterialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MaterialPageState createState() => _MaterialPageState();
}

class _MaterialPageState extends State<MaterialPage> {
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
