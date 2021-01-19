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
        ALTER TABLE "tb_material_category" ADD CONSTRAINT "PK_TB_MATERIAL_CATEGORY" PRIMARY KEY (
	        "material_category_id"
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

      await db.execute(
        '''
        CREATE TABLE "tb_material" 
        (
          "material_id"	text		NOT NULL,
          "material_name"	text		NOT NULL,
          "material_category_id"	text		NOT NULL,
          "own"	boolean		NOT NULL DEFAULT FALSE,
          "description"	text		NOT NULL,
          "order_value"	int8 NOT NULL
        );
        ALTER TABLE "tb_material" ADD CONSTRAINT "PK_TB_MATERIAL" PRIMARY KEY (
          "material_id"
        );
        ''');

      await db.execute(
        '''
        INSERT INTO "tb_material"
        (material_category_id, material_id, material_name, description, order_value) 
        VALUES
        ('SPIRIT', 'VODKA', '보드카', '보드카는 동유럽 근방의 독한 술로, 맛과 향이 거의 없다는 것이 특징입니다.\n때문에 다양한 재료들과 곧잘 어울리며, 가장 인기 있는 베이스입니다.\n시중에서도 과하지 않은 값으로 구할 수 있습니다. 스미노트 등도 무난하며, 코스트코의 보드카는 최고의 가성비를 자랑합니다.', 10),
        ('SPIRIT', 'GIN', '진', '진은 강한 솔 향과 개성넘치는 풍미가 특징인 술입니다. ', 10),
        ('SPIRIT', 'TEQUILA', '데킬라', '데킬라는 멕시코를 대표하는 술입니다. 용설란이라는 다육식물로 만들며, 독특한 향을 냅니다.\n칵테일에는 주로 [블랑코] 등급이나 [레포사도] 레벨의 데킬라만을 사용합니다.\n국내에는 괜찮은 브랜드가 잘 들어오지 않으며, [호세쿠엘보] 브랜드의 데킬라가 그나마 무난합니다.', 10),
        ('SPIRIT', 'BRANDY', '브랜디', '브랜디는 과실주를 증류한 술을 통칭합니다. 포도주로 만든 코냑/아르마냑, 사과주로 만든 깔바도스 등이 있습니다. 지갑이 많이 깨질 겁니다.', 10),
        ('SPIRIT', 'BRANDY_APPLE', '사과 브랜디', '보통 깔바도스를 말합니다. 국내에서는 구하기가 참으로 힘듭니다.', 10),
        ('SPIRIT', 'WHISKEY', '위스키', '', 10),
        ('SPIRIT', 'WHISKEY_SCOTCH', '스카치 위스키', '', 10),
        ('SPIRIT', 'WHISKEY_IRISH', '아이리쉬 위스키', '', 10),
        ('SPIRIT', 'WHISKEY_RYE', '라이 위스키', '', 10),
        ('SPIRIT', 'WHISKEY_BOURBON', '버번 위스키', '', 10),
        
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