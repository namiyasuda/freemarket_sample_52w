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
