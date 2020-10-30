# テーブル設計

## users テーブル

| Column           | Type      | options     |
| ---------------- | --------- | ----------- |
| nickname         | string    | null: false |
| email            | string    | null: false |
| password         | string    | null: false |
| family_name      | string    | null: false |
| first_name       | string    | null: false |
| family_name_kana | string    | null: false |
| first_name_kana  | string    | null: false |
| birthday         | integer   | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :comments
- belongs_to_active_hash :birthday

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| explanation       | text       | null: false                    |
| category          | integer    | null: false                    |
| condition         | integer    | null: false, foreign_key: true |
| shipping_fee_type | integer    | null:false                     |
| prefecture        | integer    | null:false                     |
| delivery_time     | integer    | null:false                     |
| price             | integer    | null:false                     |
| user              | references | null:false, foreign_key:true   |

### Association

- belongs_to :user
- has_many :comments
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee_type
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_time
- belongs_to_active_hash :price

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item