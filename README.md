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
- has_many :user
- has_many :delivery_address
- has_many :product


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|name|string|null: false|
|description|text|null: false|
|state|string|null: false|
|size|string||
|paying_side|string|null: false|
|prefecture_id|integer|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :prefecture
- has_many :images


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|name|string|null: false|

### Association
- belongs_to :product