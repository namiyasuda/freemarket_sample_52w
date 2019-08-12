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

### Association
- gem device を使用する為、追加分のみ記述
- has_one :address, dependent: :destroy


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|postcode|string|null: false|
|prefecture_id|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string||

### Association
- belongs_to :user
