import 'package:flutter/material.dart';
import 'package:cocktail_helper/widgets/pages/homepage.dart';
import 'package:cocktail_helper/widgets/pages/material_category_page.dart';
import 'package:cocktail_helper/widgets/pages/material_list_page.dart';
import 'package:cocktail_helper/widgets/pages/cocktail_list_page.dart';
import 'package:cocktail_helper/widgets/pages/cocktail_detail_page.dart';
import 'package:cocktail_helper/sqlite/manager.dart';

import 'package:provider/provider.dart';

// 기본 진입점 위젯

class MainApp extends StatelessWidget {
  MainApp({this.databaseManager});

  final DatabaseManager databaseManager;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(title: 'Flutter Demo Home Page'),
          '/material-category': (context) => MaterialCategoryPage(),
          '/material-list': (context) => MaterialListPage(),
          '/cocktail-list': (context) => CocktailListPage(),
          '/cocktail': (context) => CocktailDetailPage(),
        });

    return MultiProvider(
      providers: [Provider(create: (_) => databaseManager)],
      child: materialApp,
    );
  }
}
