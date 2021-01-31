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

  Future<List<Object>> getCocktailMethodList() async {
    return await database.rawQuery('''
      select *
      from tb_cocktail_method
    ''');
  }

  // 칵테일 레시피 전체 조회
  Future<List<Object>> getCocktailListAll(String search) async {
    return await database.rawQuery('''
      select *
      from tb_cocktail a
      where 1=1
        a.cocktail_name like '%$search%'
      order by a.cocktail_name
    ''');
  }

  // 특정 재료를 사용하는 칵테일 레시피 전체 조회
  Future<List<Object>> getCocktailListByMaterial(String materialId) async {
    return await database.rawQuery('''
      select *
      from tb_cocktail a
      where 1=1
        and exists 
        (
          select 1 
          from tb_cocktail_material b
          where 1=1
            and a.cocktail_no = b.cocktail_no
            and b.material_id = '$materialId'
        )
      order by a.cocktail_name
    ''');
  }

  // 특정 재료를 사용하는 칵테일 레시피 전체 조회
  Future<List<Object>> getCocktailListByMethod(String materialId) async {
    return await database.rawQuery('''
      select *
      from tb_cocktail a
      where 1=1
        a.cocktail_method = '$materialId'
      order by a.cocktail_name
    ''');
  }
}
