import 'package:flutter/material.dart';
import 'package:cocktail_helper/widgets/buttons/search_button.dart';
import 'package:cocktail_helper/widgets/buttons/setting_page_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  final TextEditingController _filter = new TextEditingController();

  Widget title = Text("칵테일 냉장고");

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: [
        SearchButton(() {
          Fluttertoast.showToast(
            msg: "테스트",
            toastLength: Toast.LENGTH_SHORT,
          );
          setState(() {
            if (title is Text) {
              title = new TextField(
                controller: _filter,
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
              );
            } else {
              title = Text("칵테일 냉장고");
            }
          });
        }),
        SettingPageButton()
      ],
    );
  }
}
