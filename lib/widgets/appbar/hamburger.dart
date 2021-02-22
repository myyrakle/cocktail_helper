import 'package:flutter/material.dart';

class HamburgerHeader extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: DrawerHeader(
        child: Column(
          children: [
            Align(alignment: Alignment.center, child: Text("Happy Alcohol!")),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class HamburgerMenu extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          HamburgerHeader(),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
