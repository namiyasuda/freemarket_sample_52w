crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_mypage_path
end

crumb :logout do
  link "ログアウト", logout_user_mypage_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_user_mypage_path
  parent :mypage
end

crumb :personal_info do
  link "本人情報の登録", personal_info_user_mypage_path
  parent :mypage
end

crumb :card_show do
  link "支払い方法", card_show_user_mypage_path
  parent :mypage
end

crumb :listing_product do
  link "出品した商品 - 出品中", listing_product_user_mypage_path
  parent :mypage
end

crumb :delivery_address do
  link "発送元・お届け先住所変更", delivery_address_user_mypage_path
  parent :mypage
end

crumb :during_trade do
  link "出品した商品 - 取引中", during_trade_user_mypage_path
  parent :mypage
end

crumb :sold do
  link "出品した商品 - 売却済み", sold_user_mypage_path
  parent :mypage
end
