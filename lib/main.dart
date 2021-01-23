import 'package:flutter/material.dart';

import 'package:cocktail_helper/sqlite/init.dart';
import 'package:cocktail_helper/widgets/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //var db = await openDatabase('my_db.db');
  var databaseManager = await initializeDatabase();

  runApp(App(databaseManager: databaseManager,));
}



