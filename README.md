# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|mobile_number|string|null: false, unique: true|
|profile|text||
|sales_money|bigint|default: 0|

※gem device を使用する為、追加分のみ記述

### Association
- has_one :delivery_address, dependent: :destroy
- has_one :card, dependent: :destroy
- has_one :user_addresse, dependent: :destroy
- has_many :seller_products, class_name: 'Product', :foreign_key => 'seller_id'
- has_many :buyer_products, class_name: 'Product', :foreign_key => 'buyer_id'
- has_many :sns_credentials, dependent: :destroy
- has_many :points


## delivery_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|integer|null: false, foreign_key: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postcode|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string||

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|

※gem payjp を使用する為、カード情報を直接保存しない

### Association
- belongs_to :user

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|||

​※gem active_hash で作成する​

### Association
​※記述の必要無し​

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null: false, index: true, foreign_key: true|
|buyer_id|integer|index: true, foreign_key: true, optional: true|
|name|text|null: false|
|description|text|null: false|
|category_id|integer|null: false, index: true, foreign_key: true|
|brand_id|integer|index: true, foreign_key: true, optional: true|
|state_id|integer|null: false, foreign_key: true|
|size_id|integer|foreign_key: true|
|paying_side_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|delivery_day_id|integer|null: false, foreign_key: true|
|delivery_method_id|integer|null: false, foreign_key: true|
|price|integer|null: false|
|listing_stop|boolean|null: false, default: false|
|parent_id|integer|null: false, index: true|
|child_id|integer|null: false, index: true|
|evaluation|integer||

add_index :products, [:name, :description]

*enum evaluation:を追加

### Association
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
- belongs_to_active_hash :prefecture
- belongs_to :category
- belongs_to :brand
- belongs_to_active_hash :size
- belongs_to_active_hash :state
- belongs_to_active_hash :paying_side
- belongs_to_active_hash :delivery_day
- belongs_to_active_hash :delivery_method
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images
- accepts_nested_attributes_for :brand


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, index: true, foreign_key: true|
|name|string|null: false|

### Association
- belongs_to :product


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|

### Association
- has_many :products


## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :products
- has_ancestry
- has_many :sizes, through: :category_sizes


## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|uid|string|null: false|
|provider|string|null: false|

### Association
- belongs_to :user


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :products
- has_ancestry
- has_many :categories, through: :category_sizes


## category_sizesテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, index: true, foreign_key: true|
|size_id|integer|null: false, index: true, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :size


## statesテーブル

|Column|Type|Options|
|------|----|-------|
|name|||

​※gem active_hash で作成する​

### Association
​※記述の必要無し​


## paying_sidesテーブル

|Column|Type|Options|
|------|----|-------|
|name|||

​※gem active_hash で作成する​

### Association
​※記述の必要無し​


## delivery_daysテーブル

|Column|Type|Options|
|------|----|-------|
|name|||

​※gem active_hash で作成する​

### Association
​※記述の必要無し​


## delivery_methodテーブル
|Column|Type|Options|
|------|----|-------|
|name|||
|payside|||

​※gem active_hash で作成する​

### Association
​※記述の必要無し​


## pointsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, index: true, foreign_key: true|
|history|integer|null: false|
|expiration_date|datetime|null: false|

### Association
- belongs_to :user


## user_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, index: true, foreign_key: true|
|postcode|string|
|prefecture_id|integer|foreign_key: true|
|city|string||
|block|string||
|building|string||

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture
