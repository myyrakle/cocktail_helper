import 'package:flutter/material.dart';
import 'package:cocktail_helper/widgets/buttons/setting_page_button.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  HomeAppBar();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("칵테일 냉장고"),
      actions: [SettingPageButton()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
