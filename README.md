# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|mobile_number|string|null: false, unique: true|
|postcode|string||
|prefecture_id|integer||
|city|string||
|block|string||
|building|string||
|profile|text||
|sales_money|bigint|default: 0|
|point|bigint|default: 0|

### Association
- gem device を使用する為、追加分のみ記述
- has_one :delivery_address, dependent: :destroy
- has_one :card, dependent: :destroy
- belongs_to :prefecture


## delivery_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postcode|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string||

### Association
- belongs_to :user
- belongs_to :prefecture

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|

### Association
- gem payjp を使用する為、カード情報を直接保存しない
- belongs_to :user

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :users
- has_many :delivery_addresses
- has_many :products


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|name|string|null: false|
|description|text|null: false|
|brand_id|integer||
|state|string|null: false|
|size|string||
|paying_side|string|null: false|
|prefecture_id|integer|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :prefecture
- belongs_to :brand
- has_many :images, dependent: :destroy
- has_many :products_categorys
- has_many :categorys, through products_categorys


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|name|string|null: false|

### Association
- belongs_to :product


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|

### Association
- has_many :products


## products_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|category_id|integer|null: false|

### Association
- belongs_to :product
- belongs_to :category


## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :products_categorys
- has_many :products, through products_categorys
