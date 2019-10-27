# bundle exec rake db:seed:category_size を実行する

CategorySize.delete_all

# 大人靴
CategorySize.create([{size_id: 1, category_id: 2},{size_id: 1, category_id: 21},{size_id: 1, category_id: 43},{size_id: 1, category_id: 56},{size_id: 1, category_id: 62},{size_id: 1, category_id: 78},{size_id: 1, category_id: 174},{size_id: 1, category_id: 175},{size_id: 1, category_id: 176},{size_id: 1, category_id: 179},{size_id: 1, category_id: 180},{size_id: 1, category_id: 181},{size_id: 1, category_id: 201},{size_id: 1, category_id: 214},{size_id: 1, category_id: 238},{size_id: 1, category_id: 270},{size_id: 1, category_id: 331},{size_id: 1, category_id: 332},{size_id: 1, category_id: 340},{size_id: 1, category_id: 1048},{size_id: 1, category_id: 1049},{size_id: 1, category_id: 1060},{size_id: 1, category_id: 1061}])

# 女性靴
CategorySize.create([{size_id: 2, category_id: 67}, {size_id: 2, category_id: 1046}, {size_id: 2, category_id: 1057}])

# 男性靴
CategorySize.create([{size_id: 3, category_id: 248}, {size_id: 3, category_id: 1045}, {size_id: 3, category_id: 1056}])

# ベビー服
CategorySize.create([{size_id: 4, category_id: 346}, {size_id: 4, category_id: 358}, {size_id: 4, category_id: 367}])

# キッズ服
CategorySize.create([{size_id: 5, category_id: 376}, {size_id: 5, category_id: 395}, {size_id: 5, category_id: 410}, {size_id: 5, category_id: 1050}, {size_id: 5, category_id: 1062}])

# キッズ靴
CategorySize.create([{size_id: 6, category_id: 419}, {size_id: 6, category_id: 1047}, {size_id: 6, category_id: 1058}])

# スノーボード
CategorySize.create([{size_id: 7, category_id: 1043}])

# スキー板
CategorySize.create([{size_id: 8, category_id: 1055}])

# タイヤ・ホイール
CategorySize.create([{size_id: 9, category_id: 1204}])

# オートバイ
CategorySize.create([{size_id: 10, category_id: 1237}])

# ヘルメット
CategorySize.create([{size_id: 11, category_id: 1256}])