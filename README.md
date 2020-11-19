# テーブル設計

## users テーブル

| Column             | Type      | options     |
| ----------------   | --------- | ----------- |
| nickname           | string    | null: false |
| email              | string    | null: false |
| encrypted_password | string    | null: false |
| family_name        | string    | null: false |
| first_name         | string    | null: false |
| family_name_kana   | string    | null: false |
| first_name_kana    | string    | null: false |
| birthday           | date      | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| shipping_fee_type_id | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| delivery_time_id     | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee_type
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_time

## purchase_infos テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one : purchase_info