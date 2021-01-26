import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:cocktail_helper/sqlite/manager.dart';

Future<DatabaseManager> initializeDatabase() async {
  var path = join(await getDatabasesPath(), 'cocktail.db');
  //join(await getDatabasesPath(), 'cocktail.db')
  deleteDatabase(path);
  var database = await openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute('''
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

      await db.execute('''
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

      await db.execute('''
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

      await db.execute('''
        INSERT INTO "tb_material"
        (material_category_id, material_id, material_name, description, order_value) 
        VALUES
        ('SPIRIT', 'VODKA', '보드카', '보드카는 동유럽 근방의 독한 술로, 맛과 향이 거의 없다는 것이 특징입니다. 다양한 재료들과 곧잘 어울리며, 가장 인기 있는 베이스입니다. 시중에서도 과하지 않은 값으로 구할 수 있습니다. 스미노트 등도 무난하며, 코스트코의 보드카는 최고의 가성비를 자랑합니다.', 10),
        ('SPIRIT', 'GIN', '진', '진은 강한 솔 향과 개성넘치는 풍미가 특징인 술입니다. ', 20),
        ('SPIRIT', 'TEQUILA', '데킬라', '데킬라는 멕시코를 대표하는 술입니다. 용설란이라는 다육식물로 만들며, 독특한 향을 냅니다. 칵테일에는 주로 [블랑코] 등급이나 [레포사도] 레벨의 데킬라만을 사용합니다. 국내에는 괜찮은 브랜드가 잘 들어오지 않으며, [호세쿠엘보] 브랜드의 데킬라가 그나마 무난합니다.', 30),
        ('SPIRIT', 'RUM_WHITE', '화이트 럼', '럼은 해적의 술로 유명합니다. 사탕수수로 만들어지며, 보드카와 비슷하게 맛과 향은 약한 편입니다. 화이트럼은 숙성을 하지 않은 럼을 말합니다. 바카디 사의 화이트럼이 구하기도 쉽고 저렴한 편에 속합니다.', 40),
        ('SPIRIT', 'RUM_GOLD', '골드 럼', '골드 럼은 럼을 오크통에 약간 숙성시켜 노리끼리한 색깔을 가진 친구입니다.', 40),
        ('SPIRIT', 'RUM_DART', '다크 럼', '다크 럼은 럼을 오크통에 장기간 숙성시켜 어두운 색을 띠는 럼입니다. 아주 비싸지죠.', 40),
        ('SPIRIT', 'RUM_OVER_PROOF', '오버프루프 럼', '보통 75가 넘는 특수한 럼입니다. 불쇼를 할때 자주 쓰죠. 식도와 위장의 위치를 알고 싶다면 그냥 마셔봐도 좋아요.', 40),
        ('SPIRIT', 'BRANDY', '브랜디', '브랜디는 과실주를 증류한 술을 통칭합니다. 보통 그냥 브랜디라 하면 포도주로 만든 브랜디를 말해요. 코냑/아르마냑 등이 있죠. 지갑이 많이 깨질 거에요.', 50),
        ('SPIRIT', 'BRANDY_APPLE', '사과 브랜디', '보통 깔바도스를 말합니다. 국내에서는 구하기가 참으로 힘듭니다.', 51),
        ('SPIRIT', 'WHISKEY', '위스키', '위스키는 보리 등의 곡물을 증류해 오크통에 숙성한 술을 통칭합니다.', 60),
        ('SPIRIT', 'WHISKEY_SCOTCH', '스카치 위스키', '스카치 위스키! 위스키 하면 스코틀랜드죠. 품질도 안정되어있고, 시중에서도 아주 쉽게 구할 수 있습니다. 저렴한 것도 많아요. 블랙 보틀, 페이머스 그라우스, 벨즈...', 61),
        ('SPIRIT', 'WHISKEY_IRISH', '아이리쉬 위스키', '아이리쉬 위스키는 아일랜드에서 생산된 위스키입니다. 아일랜드는 위스키의 원조라고 하죠. 편의점에서도 보이는 JAMESON이 대표적입니다.', 62),
        ('SPIRIT', 'WHISKEY_BOURBON', '버번 위스키', '버번 위스키는 미국에서 옥수수로 생산된 위스키들을 말합니다. 시중에 잘 보이진 않으나, 주류전문점에 가면 괜찮은 것들이 꽤 많아요.', 63),
        ('SPIRIT', 'WHISKEY_RYE', '라이 위스키', '라이 위스키는 호밀로 만들어진 미국산 위스키입니다. 국내에선 보기가 쉽지 않을 거에요.', 64),
        
        ('LIQUEUR', 'TRIPLE_SEC', '트리플 섹', '트리플 섹은 오렌지 껍질로 만든 리큐르입니다. 아주 달고 도수도 40도 정도로 높아요. 볼스, 디카이퍼 등의 제품이 저렴하고, 가장 고급으로 치는건 코앵트로입니다.', 10),
        ('LIQUEUR', 'BLUE_CURACAO', '블루 큐라소', '트리플 섹에 파란색 색깔만 넣은 리큐르에요. 볼스나 디카이퍼 등으로 구하면 됩니다.', 20),
        ('LIQUEUR', 'CASSIS', '카시스', '카시스는 블랙 커런트라는 베리로 만든 리큐르입니다. 특유의 풋내가 개성적이에요.', 30),
        ('LIQUEUR', 'CREME_DE_CACAO_DARK', '크렘 드 카카오 다크', '카카오를 첨부한 초콜릿맛 술입니다. 달달해요.', 40),
        ('LIQUEUR', 'CREME_DE_CACAO_WHITE', '크렘 드 카카오 화이트', '카카오를 첨부한 초콜릿맛 술입니다. 달달해요.', 50),
        ('LIQUEUR', 'CREME_DE_MENTHE_GREEN', '크렘 드 멘트 그린', '민트가 첨가된 치약맛 술입니다. 달면서도 치약의 풍미가 산뜻하게 올라와요.', 60),
        ('LIQUEUR', 'CREME_DE_MENTHE_WHITE', '크렘 드 멘트 화이트', '민트가 첨가된 치약맛 술입니다. 달면서도 치약의 풍미가 산뜻하게 올라와요.', 70),
        ('LIQUEUR', 'MELON_LIQUEUR', '메론 리큐르', '메론맛..이라고는 하지만 감기약 먹을때 먹던 시럽맛이 강합니다. 미도리가 대표적인 제품이죠.', 70),
        ('LIQUEUR', 'PEACH_SCHNAPPS', '피치 시냅스', '피치 시냅스는 투명하고 달콤한 복숭아맛 리큐르입니다. 디카이퍼의 피치 트리가 대표적이죠.', 80),
        ('LIQUEUR', 'PEACH_BRANDY', '피치 브랜디', '피치 브랜디는 달콤한 복숭아맛 리큐르입니다. 피치 시냅스와의 차이점을 꼽는다면 색이 살짝 있다는 것 정도겠네요.', 90),
        ('LIQUEUR', 'CHERRY_BRANDY', '체리 브랜디', '체리 브랜디는 체리맛의 산뜻하고 달콤한 리큐르입니다.', 100),
        ('LIQUEUR', 'AMARETTO', '아마레또', '아마레또는 아몬드와 살구씨 등을 이용해 만든 달콤한 리큐르입니다. 향이 참 독특해서 호불호가 갈릴 수 있어요. 제품 중에서는 디사론노를 고급으로 칩니다.', 110),
        ('LIQUEUR', 'APRICOT_BRANDY', '애프리컷 브랜디', '애프리컷 브랜디는 살구로 만든 리큐르입니다. 아마레또와 엄청 다른건 아니라서, 적당히 대체해서 쓸 수도 있다네요.', 120),
        ('LIQUEUR', 'BANANA_LIQUEUR', '바나나 리큐르', '바나나맛 리큐르입니다. 그렇게 자주 쓰진 않아요.', 130),
        ('LIQUEUR', 'IRISH_CREAM', '베일리스(아이리시 크림)', '베일리스는 아이리쉬 위스키에 초콜릿과 크림 등을 넣어 만든 독특한 리큐르입니다. 아주 걸쭉하고 달콤하죠. 우유에만 타먹어도 아주 맛있어요. 원조는 베일리스라는 제품인데, 코스트코의 PB 상품이 가성비는 끝내줍니다.', 140),
        ('LIQUEUR', 'IRISH_CREAM_STRAWBERRY', '베일리스 스트로베리', '베일리스의 딸기맛 버전입니다.', 141),
        ('LIQUEUR', 'COFFEE_LIQUEUR', '커피 리큐르', '강한 단맛의 커피맛 리큐르입니다. 깔루아가 대표적이죠.', 150),
        ('LIQUEUR', 'COCONUT_RUM', '코코넛 럼', '코코넛의 강렬한 향과 단맛이 특징인 리큐르입니다. 가장 흔히 구할 수 있는 제품은 말리부 럼이에요.', 160),
        ('LIQUEUR', 'APPLE_PUCKER', '애플 퍼커', '사과맛의 달콤한 리큐르입니다.', 170),
        ('LIQUEUR', 'PARFAIT', '파르페 아모르', '오렌지와 바닐라 등이 첨가된 보라색 리큐르입니다.', 180),
        ('LIQUEUR', 'CAMPARI', '캄파리', '캄파리는 이탈리아의 약주입니다. 씁쓸하고 독특한 맛을 내죠.', 190),
        ('LIQUEUR', 'VERMOUTH_SWEET', '스위트 베르무트', '베르무트는 이탈리아의 주정강화 와인으로, 독특한 향을 냅니다.', 200),
        ('LIQUEUR', 'VERMOUTH_DRY', '드라이 베르무트', '베르무트는 이탈리아의 주정강화 와인으로, 독특한 향을 냅니다.', 210),
        ('LIQUEUR', 'DRAMBUIE', '드럼부이', '드럼부이는 스카치 위스키에 꿀 등을 첨가한 고급 리큐르입니다.', 220),
        ('LIQUEUR', 'GRAND_MARNIER', '그랑 마르니에', '그랑 마르니에는 코냑을 기반으로 만든 오렌지맛 리큐르입니다.', 230),
        ('LIQUEUR', 'BENEDICTINE', '베네딕틴', '베네딕틴은 브랜디를 기반으로 만든 독특한 프랑스 리큐르입니다.', 240),
        ('LIQUEUR', 'GALLIANO', '갈리아노', '갈리아노는 아니스, 생각, 시트러스, 바닐라 등의 다양한 재료로 만든 이탈리아 약주입니다. 약간 누런 색이 특징입니다.', 250),
        ('LIQUEUR', 'SLOE_GIN', '슬로 진', '슬로 진은 진에 슬로베리라는 자두 종류를 넣어 만든 리큐르입니다. 새콤달콤한 맛이 특징입니다.', 260),
        ('LIQUEUR', 'SOUTHERN COMFORT', '서던 컴포트', '서던 컴포트는 버번 위스키에 다양한 재료를 첨가해 만든 리큐르입니다. 달콤하고 향긋하다네요.', 270),
        ('LIQUEUR', 'SHARTREUSE_GREEN', '샤르트뢰즈 그린', '샤르트뢰즈는 가장 비밀스럽고 존재감이 큰 리큐르 중 하나입니다. 131개의 재료가 들어가고, 한때는 엘릭서로 취급하기도 했다네요.', 280),
        ('LIQUEUR', 'ABSINTHE', '압생트', '압생트는 강렬한 향의 녹색 술입니다. 환각제 논란도 있었고, 짝퉁도 많고, 참 다사다난한 술이죠.', 290),
        ('LIQUEUR', 'JAGERMEISTER', '예거마이스터', '예거마이스터는 독일의 약주입니다. 걸쭉한 단맛에, 특유의 독특한 향이 특징입니다.', 300),
        ('LIQUEUR', 'AGWA', '아그와', '아그와는 네덜란드의 옅은 녹색의 허브 리큐르입니다. 코카잎, 녹차, 라벤더, 오이 등이 들어간다고 하네요.', 310),
        ('LIQUEUR', 'X_RATED', '엑스레이티드', '엑스레이티드는 분홍빛의 달콤한 리큐르입니다.', 320),
        ('LIQUEUR', 'ALIZE_BLUE', '엘리제 블루', '엘리제는 코냑과 보드카를 기반으로 만든 리큐르입니다. 블루는 패션프루츠, 체리, 생강 등이 첨가됐어요.', 330),
        ('LIQUEUR', 'ALIZE_ROSE', '엘리제 로즈', '엘리제는 코냑과 보드카를 기반으로 만든 리큐르입니다. 로즈는 패션프루츠, 딸기 등이 첨가됐어요.', 340),
        ('LIQUEUR', 'KWAI_FEH', '콰이페', '콰이페는 리치라는 열매로 만든 달콤한 리큐르입니다.', 350),
        ('LIQUEUR', 'FIRE_BALL', '파이어볼', '파이어볼은 버번 위스키에 계피 등을 첨가한 독특한 리큐르입니다.', 360),
        ('LIQUEUR', 'LIMONCELLO', '리몬첼로', '리몬첼로는 이탈리아의 새콤달콤한 레몬맛 리큐르입니다.', 370),
        ('LIQUEUR', 'FRANGELICO', '프랑젤리코', '프랑젤리코는 이탈리아의 헤이즐넛 리큐르입니다.', 380),
        ('LIQUEUR', 'ANGOSTURA_BITTERS', '앙고스투라 비터스', '앙고스투라 비터스는 아로마향과 쓴맛이 특징인 칵테일용 조미료입니다. 일부 칵테일에 몇 방울씩만 넣어 맛을 돋우는 역할을 합니다.', 390),
        
        ('FRUITS', 'LEMON', '레몬', '상큼한 레몬', 10),
        ('FRUITS', 'LIME', '라임', '향긋한 라임', 20),
        ('FRUITS', 'ORANGE', '오렌지', '달콤한 오렌지', 30),
        ('FRUITS', 'CHERRY', '체리', '새콤한 체리', 40),
        ('FRUITS', 'BANANA', '바나나', '부드러운 바나나', 50),
        ('FRUITS', 'STRAWBERRY', '딸기', '산뜻한 딸기', 60),
        ('FRUITS', 'OLIVE', '올리브', '올리브 병조림을 사용하면 됩니다.', 60),
        
        ('SYRUP', 'SYRUP', '시럽', '시럽은 그냥 설탕물입니다. 구매해서 사용해도 좋지만, 그냥 물과 설탕을 부피 1:1로 섞어서 끓이면 쉽게 만들어집니다. 이것저것 첨가해도 좋고요.', 10),
        ('SYRUP', 'GRENADINE_SYRUP', '그레나딘 시럽', '그레나딘 시럽은 짙은 적색의 석류맛 시럽입니다. 색을 낼때 주로 사용합니다.', 20),
        ('SYRUP', 'RASPBERRY_SYRUP', '라즈베리 시럽', '라즈베리 시럽은 라즈베리가 첨가된 산뜻한 맛의 시럽입니다. 그렇게 자주 쓰지는 않습니다.', 30),
        ('SYRUP', 'HONEY', '꿀', '꿀꿀', 40),  
        ('SYRUP', 'ORANGE_FLOWER_WATER', '오렌지 플라워 워터', '오렌지 플라워 워터는 비터오렌지라는 나무의 꽃을 증류해 만든 독특한 향유입니다. 칵테일에는 주로 라모스 진피즈에 사용합니다.', 50),  
        
        ('JUICE', 'LEMON_JUICE', '레몬주스', '레몬주스는 레몬을 직접 짜서 사용해도 좋지만, 별도로 파는 레몬주스 제품이 사용이 용이합니다. Lazy가 저렴하고 흔해서 무난합니다.', 10),
        ('JUICE', 'LIME_JUICE', '라임주스', '라임주스는 라임을 직접 짜서 사용해도 좋지만, 별도로 파는 라임주스 제품이 사용이 용이합니다. 지룩스를 추천합니다.', 20),
        ('JUICE', 'ORANGE_JUICE', '오렌지주스', '오렌지로 만든 주스죠.', 30),
        ('JUICE', 'CRANBERRY_JUICE', '크렌베리주스', '크렌베리로 만든 주스입니다. 새콤하고 살짝 떫은 맛이 특징이죠.', 40),
        ('JUICE', 'GRAPEFRUIT_JUICE', '자몽주스', '자몽 주스!', 50),
        ('JUICE', 'PINEAPPLE_JUICE', '파인애플주스', '파인애플 주스!', 60),
        ('JUICE', 'APPLE_JUICE', '사과주스', '사과 주스!!!', 70),
        ('JUICE', 'TOMATO_JUICE', '토마토주스', '토마토 주스!!!!', 80),
        
        ('BEVERAGES', 'WATER', '물', '물은 아무거나 쓰면 됩니다.', 10),
        ('BEVERAGES', 'WATER_SPARKLING', '탄산수', '탄산수도 아무거나 쓰면 됩니다.', 20),
        ('BEVERAGES', 'TONIC', '토닉워터', '토닉 워터는 캐나다 드라이 토닉워터를 추천합니다. 없으면 진로 써도 되고요.', 30),
        ('BEVERAGES', 'GINGER_ALE', '진저에일', '진저에일은 생강맛이 나는 탄산입니다. 소화제로 좋다고 하네요.', 40),
        ('BEVERAGES', 'CIDER', '사이다', '사이다는 아무거나 써도 되지만, 특색이 없는 제품일수록 잘 섞일 거에요.', 50),
        ('BEVERAGES', 'COLA', '콜라', '콜라는 취향껏', 60),
        ('BEVERAGES', 'MILK', '우유', '우유 좋아', 70),
        ('BEVERAGES', 'COCONUT_MILK', '코코넛 밀크', '코코넛 밀크는 코코넛을 쥐어짠 즙인데, 트로피컬 칵테일에 주로 사용됩니다. 동남아 음식에도 쓰고요.', 80),
        ('BEVERAGES', 'ESPRESSO', '에스프레소', '별로 건강에는 좋지 않겠지만, 일부 레시피에 사용됩니다.', 100),
        ('BEVERAGES', 'RED_BULL', '레드불', '날개를 펼쳐줘요!', 110),
        ('OTHERS', 'CREAM', '크림', '크림은 주변에 파는 휘핑크림 아무거나 집어와서 사용해도 좋습니다. 레시피에 따라 우유로 대체할 수도 있고요.', 120), 
        ('OTHERS', 'EGG', '계란', '날달걀은 꼭 신선할 걸 씁시다!', 130),
        ('OTHERS', 'EGG_WHITE', '계란 흰자', '대부분의 레시피는 흰자만을 쓰는 편입니다. 흰자만 잘 골라내서 쓰고, 노른자는 비빔밥에 쓰면 됩니다.', 140), 
        ('OTHERS', 'EGG_YOLK', '계란 노른자', '계란에서 노른자만 골라내서 잘 쓰면 됩니다.', 150),
        ('OTHERS', 'SALT', '소금', '소금은 아무거나', 160), 
        ('OTHERS', 'SUGAR', '설탕', '설탕은 아무거나', 170),  
        ('OTHERS', 'SUGAR_LUMP', '각설탕', '일부 칵테일에 사용합니다. 그냥 설탕으로 대체해도 되고요.', 171),  
        ('OTHERS', 'CACAO_POWDER', '카카오 파우더', '아주 일부 레시피에만 사용됩니다.', 180)
        ''');

      await db.execute('''
        CREATE TABLE "tb_cocktail_method" (
          "cocktail_method"	text		NOT NULL,
          "method_text"	text		NULL,
          "description"	text		NULL
        );
        ALTER TABLE "tb_cocktail_method" ADD CONSTRAINT "PK_TB_COCKTAIL_METHOD" PRIMARY KEY (
          "cocktail_method"
        );
        ''');

      await db.execute('''
        INSERT INTO "tb_cocktail_method"
        (
          "cocktail_method",
          "method_text",
          "description"
        )
        VALUES
        ('BUILD', '빌드', '잔 안에 재료들을 그냥 부어서 완성하는 기법입니다.'),
        ('SHAKING', '셰이커', '셰이커에다가 재료를 넣고 흔드는 기법입니다. 탄산이 들어있는건 꼭 흔들고 난 다음에 넣을것!'),
        ('STIR', '스터', '스푼으로 저어서 만드는 기법입니다.'),
        ('FLOAT', '플로트', '재료를 순서대로 띄워서 층을 만드는 기법입니다.'),
        ('BLENDING', '블렌드', '믹서기에 재료를 넣고 갈아버리는 기법입니다.'),
        ('THROWING', '쓰로잉', '셰이커 두개에 재료를 따라놓고 번갈아가며 높이 붓는 독특한 기법입니다.');
        ''');

      await db.execute('''
        CREATE TABLE "tb_cocktail" (
          "cocktail_no"	int8		NOT NULL,
          "cocktail_name"	text		NULL,
          "description"	text		NULL,
          "cocktail_method"	text		NULL,
          "is_non_alcohol"	bool		NULL
        );
        
        CREATE TABLE "tb_cocktail_material" (
          "cocktail_no"	int8		NOT NULL,
          "material_id"	text		NOT NULL,
          "optional"	bool		NULL,
          "amount"	text		NULL
        );
        
        ALTER TABLE "tb_cocktail" ADD CONSTRAINT "PK_TB_COCKTAIL" PRIMARY KEY (
          "cocktail_no"
        );
        
        ALTER TABLE "tb_cocktail_material" ADD CONSTRAINT "PK_TB_COCKTAIL_MATERIAL" PRIMARY KEY (
          "cocktail_no",
          "material_id"
        );
        ''');

      await db.execute('''
        INSERT INTO "tb_cocktail"
        (
          "cocktail_no",
          "cocktail_name",
          "cocktail_method",
          "description",  
          "is_non_alcohol"
        )
        VALUES
        (
           1, 
           '진 토닉', 
           'BUILD', 
           '진의 상쾌한 향과 토닉의 시원한 맛이 어우러진 완벽한 한 잔입니다. 취향대로 레몬이나 라임주스를 첨가해주면 좋습니다.', 
           0
        );
        
        INSERT INTO "tb_cocktail_material"
        ("cocktail_no", "material_id", "optional", "amount")
        VALUES
        (
           1, 
           'GIN', 
           0, 
           '1'
        ),
        (
           1, 
           'TONIC', 
           0, 
           '2~3'
        );
        
        INSERT INTO "tb_cocktail"
        (
          "cocktail_no",
          "cocktail_name",
          "cocktail_method",
          "description",  
          "is_non_alcohol"
        )
        VALUES
        (
           2, 
           '마티니', 
           'STIR', 
           '칵테일의 왕이라 불리는 마티니입니다. 그래도 대단한 맛은 기대하지 않는 게 좋을 거에요. 진과 베르뭇을 넣어서 젓고, 올리브 한개를 넣어주면 됩니다.', 
           0
        );
        
        INSERT INTO "tb_cocktail_material"
        ("cocktail_no", "material_id", "optional", "amount")
        VALUES
        (2, 'GIN', 0, '45ml'),
        (2, 'VERMOUTH_DRY', 0, '15ml'),
        (2, 'OLIVE', 0, '1개');
        
        INSERT INTO "tb_cocktail"
        (
          "cocktail_no",
          "cocktail_name",
          "cocktail_method",
          "description",  
          "is_non_alcohol"
        )
        VALUES
        (
           3, 
           '화이트 레이디', 
           'SHAKING', 
           '새콤하고 향긋한 한 잔입니다.', 
           0
        );
        
        INSERT INTO "tb_cocktail_material"
        ("cocktail_no", "material_id", "optional", "amount")
        VALUES
        (3, 'GIN', 0, '45ml'),
        (3, 'CREAM', 0, '15ml'),
        (3, 'GRENADINE_SYRUP', 0, '10ml'),
        (3, 'EGG_WHITE', 0, '1개');
        
        
        ''');
    },
    version: 1,
  );

  return DatabaseManager(database);
}
