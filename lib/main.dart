import 'package:flutter/material.dart';

import 'dart:async';

import './sqlite/init.dart';
import './widgets/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //var db = await openDatabase('my_db.db');
  var database = await initializeDatabase();

  runApp(App(database: database,));
}



