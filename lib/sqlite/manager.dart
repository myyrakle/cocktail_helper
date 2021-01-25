import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Database database;

  DatabaseManager(this.database);

  Future<List<Object>> getMaterialCategoryList() async {
    return await database.rawQuery('''
      select *
      from tb_material_category
      order by order_value
    ''');
  }

  Future<List<Object>> getMaterialList(String category) async {
    return await database.rawQuery('''
      select *
      from tb_material
      order by material_name
    ''');
  }

  Future<List<Object>> getCocktailMethodList(String category) async {
    return await database.rawQuery('''
      select *
      from tb_material
      order by material_name
    ''');
  }
}
