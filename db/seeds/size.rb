# bundle exec rake db:seed:size を実行する

# DBを全消去
Size.delete_all

# mysqlのautoincrementを初期化 id=1からデータを作成
ActiveRecord::Base.connection.execute "ALTER TABLE `sizes` auto_increment = 1"

# **********親階層**********

adult = Size.create(name: '大人服')
women_shoes = Size.create(name: '婦人靴')
men_shoes = Size.create(name: '紳士靴')
baby = Size.create(name: 'ベビー服')
kids = Size.create(name: 'キッズ服')
kids_shoes = Size.create(name: 'キッズ靴')
snowboard = Size.create(name: 'スノーボード')
skis = Size.create(name: 'スキー板')
tire = Size.create(name: 'タイヤ/ホイール')
motorcycle = Size.create(name: 'オートバイ')
motorcycle_helmet = Size.create(name: 'ヘルメット/シールド')


# *********子階層************

# 大人服
adult.children.create([{name: 'XXS以下'}, {name: 'XS(SS)'}, {name: 'S'},{name: 'M'}, {name: 'L'}, {name: 'XL(LL)'},{name: '2XL(3L)'}, {name: '3XL(4L)'}, {name: '4XL(5L)以上'},{name: 'FREE SIZE'}])

# 婦人靴
women_shoes.children.create([{name: '20cm以下'}, {name: '20.5cm'}, {name: '21cm'}, {name: '21.5cm'}, {name: '22cm'}, {name: '22.5cm'}, {name: '23cm'}, {name: '23.5cm'}, {name: '24cm'}, {name: '24.5cm'}, {name: '25cm'}, {name: '25.5cm'}, {name: '26cm'}, {name: '26.5cm'}, {name: '27cm'}, {name: '27.5cm以上'}])

# 紳士靴
men_shoes.children.create([{name: '23.5cm以下'}, {name: '24cm'}, {name: '24.5cm'}, {name: '25cm'}, {name: '25.5cm'}, {name: '26cm'}, {name: '26.5cm'}, {name: '27cm'}, {name: '27.5cm'}, {name: '28cm'}, {name: '28.5cm'}, {name: '29m'}, {name: '29.5cm'}, {name: '30cm'}, {name: '30.5cm'}, {name: '31cm以上'}])

# ベビー服
baby.children.create([{name: '60cm'}, {name: '70cm'}, {name: '80cm'}, {name: '90cm'}, {name: '95cm'}])

# キッズ服
kids.children.create([{name: '100cm'}, {name: '110cm'}, {name: '120cm'}, {name: '130cm'}, {name: '140cm'}, {name: '150cm'}, {name: '160cm'}])

# キッズ靴
kids_shoes.children.create([{name: '10.5cm以下'}, {name: '11cm・11.5cm'}, {name: '12cm・12.5cm'}, {name: '13cm・13.5cm'}, {name: '14cm・14.5cm'}, {name: '15cm・15.5cm'}, {name: '16cm・16.5cm'}, {name: '17cm以上'}])

# スノーボード
snowboard.children.create([{name: '135cm-140cm未満'}, {name: '140cm-145cm未満'}, {name: '145cm-150cm未満'}, {name: '150cm-155cm未満'}, {name: '155cm-160cm未満'}, {name: '160cm-165cm未満'}, {name: '165cm-170cm未満'}])

# スキー板
skis.children.create([{name: '140cm〜'}, {name: '150cm〜'}, {name: '160cm〜'}, {name: '170cm〜'}, {name: 'スキーボード'}, {name: '子ども用'}, {name: 'その他'}])

# タイヤ/ホイール
tire.children.create([{name: '12インチ'}, {name: '13インチ'}, {name: '14インチ'}, {name: '15インチ'}, {name: '16インチ'}, {name: '17インチ'}, {name: '18インチ'}, {name: '19インチ'}, {name: '20インチ'}, {name: '21インチ'}, {name: '22インチ'}, {name: '23インチ'}, {name: '24インチ'}])

# オートバイ
motorcycle.children.create([{name: '50cc'}, {name: '51cc-125cc'}, {name: '126cc-250cc'}, {name: '251cc-400cc'}, {name: '401cc-750cc'}, {name: '751cc以上'}])

# ヘルメット/シールド
motorcycle_helmet.children.create([{name: 'XSサイズ以下'}, {name: 'Sサイズ'}, {name: 'Mサイズ'}, {name: 'Lサイズ'}, {name: 'XLサイズ'}, {name: 'XXLサイズ以上'}, {name: 'フリーサイズ'}, {name: '子ども用'}])