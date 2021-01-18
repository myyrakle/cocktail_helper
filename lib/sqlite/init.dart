import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initializeDatabase() async {
  return await openDatabase(
    join(await getDatabasesPath(), 'cocktail.db'),

    onCreate: (db, version) async {
      await db.execute(
        '''
        CREATE TABLE "tb_material_category" 
        (
          "material_category_id"	TEXT NOT NULL,
          "material_category_name"	TEXT NOT NULL,
          "order_value"	int8 NOT NULL
        );
        ''');

      await db.execute(
        '''
        INSERT INTO "tb_material_category"
        (material_category_id, material_category_name, order_value) 
        VALUES
        ('SPIRIT', '스피릿', 10),
        ('LIQUEUR', '리큐르', 20),
        ('FRUITS', '과일', 30),
        ('SYRUP', '시럽', 40),
        ('JUICE', '주스', 50),
        ('BEVERAGES', '음료수', 60),
        ('OTHERS', '기타', 100)
        ''');
    },
    version: 1,
  );
}