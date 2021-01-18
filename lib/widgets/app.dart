import 'package:flutter/material.dart';
import './homepage.dart';

import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({this.database});

  final Database database;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );

    return Provider(
      create: (_) => database,
      child: materialApp,
    );
  }
}