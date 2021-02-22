import 'package:flutter/material.dart';
import 'package:cocktail_helper/widgets/buttons/setting_page_button.dart';

class CocktailListAppBar extends StatefulWidget with PreferredSizeWidget {
  CocktailListAppBar();

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  _CocktailListAppBarState createState() => _CocktailListAppBarState();
}

class _CocktailListAppBarState extends State<CocktailListAppBar> {
  int _counter = 0;
  List<Map> _materialList;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("칵테일 냉장고"),
      actions: [SettingPageButton()],
    );
  }
}
