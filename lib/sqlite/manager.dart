import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Database database;

  DatabaseManager(this.database);

  Future<List<Map>> getMaterialCategoryList() async {
    return await database.rawQuery('''
      select *
      from tb_material_category
      order by order_value
    ''');
  }

  // 재료 목록 조회
  Future<List<Map>> getMaterialList(String category) async {
    return await database.rawQuery('''
      select *
      from tb_material
      order by material_name
    ''');
  }

  Future<List<Map>> getCocktailMethodList() async {
    return await database.rawQuery('''
      select *
      from tb_cocktail_method
    ''');
  }

  // 칵테일 레시피 전체 조회
  Future<List<Map>> getCocktailListAll(String search) async {
    return await database.rawQuery('''
      select *
      from tb_cocktail a
      where 1=1
        and a.cocktail_name like '%$search%'
      order by a.cocktail_name
    ''');
  }

  // 만들 수 있는 칵테일 레시피 전체 조회
  Future<List<Map>> getCocktailListAvailable(String search) async {
    return await database.rawQuery('''
      select *
      from tb_cocktail a
      where 1=1
        and 
        (
          (
            select count(1)
            from
            (
              select 
              from tb_cocktail_material b 
              where 1=1
                and a.cocktail_no = b.cocktail_no
            ) a 
            join tb_material c 
            on 1=1
              and b.material_id = c.material_id
          )
          =
          (
            select count(1) 
            from
            (
              select 
              from tb_cocktail_material b 
              where 1=1
                and a.cocktail_no = b.cocktail_no
            ) a 
            join tb_material c 
            on 1=1
              and b.material_id = c.material_id
              and c.own
          )
        ) 
        and a.cocktail_name like '%$search%'
      order by a.cocktail_name
    ''');
  }

  // 하나만 있으면 만들 수 있는 칵테일 레시피 전체 조회
  Future<List<Map>> getCocktailListNeedOne(String search) async {
    return await database.rawQuery('''
      select 
        a.cocktail_no
        , a.cocktail_name
        , a.description
        , a.cocktail_method
      from tb_cocktail a
      where 1=1
        and 
        (
          (
            select count(1) - 1
            from
            (
              select 
              from tb_cocktail_material b 
              where 1=1
                and a.cocktail_no = b.cocktail_no
            ) a 
            join tb_material c 
            on 1=1
              and b.material_id = c.material_id
          )
          =
          (
            select count(1) 
            from
            (
              select 
              from tb_cocktail_material b 
              where 1=1
                and a.cocktail_no = b.cocktail_no
            ) a 
            join tb_material c 
            on 1=1
              and b.material_id = c.material_id
              and c.own
          )
        )
      order by a.cocktail_name
    ''');
  }

  // 특정 재료를 사용하는 칵테일 레시피 전체 조회
  Future<List<Map>> getCocktailListByMaterial(String materialId) async {
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

  // 특정 방법을 사용하는 칵테일 레시피 전체 조회
  Future<List<Map>> getCocktailListByMethod(String materialId) async {
    return await database.rawQuery('''
      select *
      from tb_cocktail a
      where 1=1
        and a.cocktail_method = '$materialId'
      order by a.cocktail_name
    ''');
  }

  // 재료 소유 여부 변경
  Future<void> updateMaterialOwn(String materialId, bool own) async {
    return await database.rawQuery('''
      update tb_material
      set
        own = $own 
      where 1=1
        material_id = '$materialId'
    ''');
  }
}
