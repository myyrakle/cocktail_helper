import 'package:flutter/material.dart';
import './homepage.dart';
import 'package:cocktail_helper/sqlite/manager.dart';

import 'package:provider/provider.dart';

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
      }
    );

    return MultiProvider(
      providers: [
        Provider(create: (_)=>databaseManager)
      ],
      child: materialApp,
    );
  }
}