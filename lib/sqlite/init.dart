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
        -- 스피릿
        ('SPIRIT', 'VODKA', '보드카', '보드카는 동유럽 근방의 독한 술로, 맛과 향이 거의 없다는 것이 특징입니다.\n때문에 다양한 재료들과 곧잘 어울리며, 가장 인기 있는 베이스입니다.\n시중에서도 과하지 않은 값으로 구할 수 있습니다. 스미노트 등도 무난하며, 코스트코의 보드카는 최고의 가성비를 자랑합니다.', 10),
        ('SPIRIT', 'GIN', '진', '진은 강한 솔 향과 개성넘치는 풍미가 특징인 술입니다. ', 20),
        ('SPIRIT', 'TEQUILA', '데킬라', '데킬라는 멕시코를 대표하는 술입니다. 용설란이라는 다육식물로 만들며, 독특한 향을 냅니다.\n칵테일에는 주로 [블랑코] 등급이나 [레포사도] 레벨의 데킬라만을 사용합니다.\n국내에는 괜찮은 브랜드가 잘 들어오지 않으며, [호세쿠엘보] 브랜드의 데킬라가 그나마 무난합니다.', 30),
        ('SPIRIT', 'RUM_WHITE', '화이트 럼', '럼은 해적의 술로 유명합니다. 사탕수수로 만들어지며, 보드카와 비슷하게 맛과 향은 약한 편입니다.\n화이트럼은 숙성을 하지 않은 럼을 말합니다. 바카디 사의 화이트럼이 구하기도 쉽고 저렴한 편에 속합니다.', 40),
        ('SPIRIT', 'RUM_GOLD', '골드 럼', '골드 럼은', 40),
        ('SPIRIT', 'RUM_DART', '다크 럼', '럼', 40),
        ('SPIRIT', 'RUM_OVER_PROOF', '오버프루프 럼', '럼은 해적의 술로 유명합니다. 사탕수수로 만들어지며, 보드카와 비슷하게 맛과 향은 약한 편입니다.', 40),
        ('SPIRIT', 'BRANDY', '브랜디', '브랜디는 과실주를 증류한 술을 통칭합니다. 포도주로 만든 코냑/아르마냑, 사과주로 만든 깔바도스 등이 있습니다. 지갑이 많이 깨질 겁니다.', 50),
        ('SPIRIT', 'BRANDY_APPLE', '사과 브랜디', '보통 깔바도스를 말합니다. 국내에서는 구하기가 참으로 힘듭니다.', 51),
        ('SPIRIT', 'WHISKEY', '위스키', '', 60),
        ('SPIRIT', 'WHISKEY_SCOTCH', '스카치 위스키', '', 61),
        ('SPIRIT', 'WHISKEY_IRISH', '아이리쉬 위스키', '', 62),
        ('SPIRIT', 'WHISKEY_RYE', '라이 위스키', '', 63),
        ('SPIRIT', 'WHISKEY_BOURBON', '버번 위스키', '', 64),
        
        ('LIQUEUR', 'TRIPLE_SEC', '트리플 섹', '', 10),
        ('LIQUEUR', 'BLUE_CURACAO', '블루 큐라소', '', 20),
        ('LIQUEUR', 'CASSIS', '카시스', '', 30),
        ('LIQUEUR', 'CREME_DE_CACAO_DARK', '크렘 드 카카오 다크', '', 40),
        ('LIQUEUR', 'CREME_DE_CACAO_WHITE', '크렘 드 카카오 다크', '', 50),
        ('LIQUEUR', 'CREME_DE_MENTHE_GREEN', '크렘 드 멘트 그린', '', 60),
        ('LIQUEUR', 'CREME_DE_MENTHE_WHITE', '크렘 드 멘트 화이트', '', 70),
        ('LIQUEUR', 'MELON_LIQUEUR', '메론 리큐르', '', 70),
        ('LIQUEUR', 'PEACH_LIQUEUR', '피치 리큐르', '', 80),
        ('LIQUEUR', 'PEACH_BRANDY', '피치 브랜디', '', 90),
        ('LIQUEUR', 'CHERRY_BRANDY', '체리 브랜디', '', 100),
        ('LIQUEUR', 'AMARETTO', '아마레또', '', 110),
        ('LIQUEUR', 'APRICOT_BRANDY', '애프리컷 브랜디', '', 120),
        ('LIQUEUR', 'BANANA_LIQUEUR', '바나나 리큐르', '', 130),
        ('LIQUEUR', 'IRISH_CREAM', '아이리쉬 크림', '', 140),
        ('LIQUEUR', 'COFFEE_LIQUEUR', '커피 리큐르', '', 150),
        ('LIQUEUR', 'COCONUT_RUM', '코코넛 럼', '', 160),
        ('LIQUEUR', 'APPLE_PUCKER', '애플 퍼커', '', 170),
        ('LIQUEUR', 'PARFAIT', '파르페 아모르', '', 160),
        
        ('LIQUEUR', 'CAMPARI', '캄파리', '', 160),
        ('LIQUEUR', 'VERMOUTH_SWEET', '스위트 베르무트', '', 160),
        ('LIQUEUR', 'VERMOUTH_DRY', '드라이 베르무트', '', 160),
        ('LIQUEUR', 'DRAMBUIE', '드럼뷔', '', 160),
        ('LIQUEUR', 'GRAND_MARNIER', '그랑 마르니에', '', 160),
        ('LIQUEUR', 'BENEDICTINE', '베네딕틴', '', 160),
        ('LIQUEUR', 'GALLIANO', '갈리아노', '', 160),
        ('LIQUEUR', 'SLOE_GIN', '슬로 진', '', 160),
        ('LIQUEUR', 'SOUTHERN COMFORT', '슬로 진', '', 160),
        ('LIQUEUR', 'SHARTREUSE_GREEN', '샤르트뢰즈 그린', '', 160),
        ('LIQUEUR', 'ABSINTHE', '압생트', '', 160),
        ('LIQUEUR', 'JAGERMEISTER', '예거마이스터', '', 160),
        ('LIQUEUR', 'AGWA', '아그와', '', 160),
        ('LIQUEUR', 'X_RATED', '엑스레이티드', '', 160),
        ('LIQUEUR', 'ALIZE_BLUE', '엘리제 블루', '', 160),
        ('LIQUEUR', 'ALIZE_ROSE', '엘리제 로즈', '', 160),
        ('LIQUEUR', 'KWAI_FEH', '콰이페', '', 160),
        ('LIQUEUR', 'FIRE_BALL', '파이어볼', '', 160),
        ('LIQUEUR', 'LIMENCELLO', '리몬첼로', '', 160),
        ('LIQUEUR', 'FRANGELICO', '프랑젤리코', '', 160),
        ('LIQUEUR', 'ANGOSTURA_BITTERS', '앙고스투라 비터스', '', 160),
        
        ('FRUITS', 'LEMON', '레몬', '', 160),
        ('FRUITS', 'LIME', '라임', '', 160),
        ('FRUITS', 'CHERRY', '체리', '', 160),
        
        ('SYRUP', '시럽', 40),
        ('SYRUP', '그레나딘 시럽', 40),
        ('SYRUP', '라즈베리 시럽', 40),
        
        ('JUICE', 'LEMON_JUICE', '레몬주스', 50),
        ('JUICE', 'LIME_JUICE', '라임주스', 50),
        ('JUICE', 'ORANGE_JUICE', '오렌지주스', 50),
        ('JUICE', 'RASBERRY_JUICE', '라즈베리주스', 50),
        ('JUICE', 'RASBERRY_JUICE', '자몽주스', 50),
        ('JUICE', 'PINEAPPLE_JUICE', '파인애플주스', 50),
        ('JUICE', 'APPLE_JUICE', '사과주스', 50),
        
        ('BEVERAGES', 'WATER', '물', 60),
        ('BEVERAGES', '', '사이다', 60),
        ('BEVERAGES', '', '콜라', 60),
        ('BEVERAGES', 'MILE', '우유', 60),
        
        ('OTHERS', '기타', 100)
        ''');
    },
    version: 1,
  );
}