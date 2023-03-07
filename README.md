# README
#テーブル設計

## users テーブル

| Column                | Type    | Option         |
| --------------------- | ------- | -------------- |
| nickname              | string  | null: false    | 
| email                 | string  | null: false    |
| encrypted_password    | string  | null: false    | ＊デフォルト
| last_name             | string  | null: false    |
| first_name            | string  | null: false    |
| first_name_kana       | string  | null: false    |
| last_name_kana        | string  | null: false    |
| birth_day             | date    | null: false    |

### Association

- has_many :items
- has_many :orders

-----------------------------------------------------------------------------------
## items テーブル

| Column         | Type        | Option                          |
| -------------- | ----------- | ------------------------------- |
| item_name      | string      | null: false                     |
| description    | text        | null: false                     |
| category_id    | integer     | null: false                     |
| condition_id   | integer     | null: false                     |
| charge_id      | integer     | null: false                     |
| prefecture_id  | integer     | null: false                     |
| days_id        | integer     | null: false                     |
| price          | integer     | null: false                     |
| user           | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :category
- belongs_to :condition
- belongs_to :charge
- belongs_to :prefecture
- belongs_to :days
-----------------------------------------------------------------------------------
## orders テーブル

| Column          | Type        | Option                          |
| --------------- | ----------- | ------------------------------- |
| user            | reference   | null: false, foreign_key        |
| item            | reference   | null: false, foreign_key        |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

-----------------------------------------------------------------------------------
## shippings テーブル

| Column          | Type        | Option                          |
| --------------- | ----------- | ------------------------------- |
| postal_code     | string      | null: false                     |
| prefecture_id   | integer     | null: false                     |
| city            | string      | null: false                     |
| street_num      | string      | null: false                     |
| building        | string      |                                 |
| tel             | string      | null: false                     |

### Association

- belongs_to :order

extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture