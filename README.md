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
| birthday              | date    | null: false    |

### Association

- has_many :items
- has_many :orders

-----------------------------------------------------------------------------------
## items テーブル

| Column         | Type        | Option                          |
| -------------- | ----------- | ------------------------------- |
| item_name      | string      | null: false                     |
| description    | text        | null: false                     |
| category_id    | string      | null: false                     |
| condition_id   | string      | null: false                     |
| charge_id      | string      | null: false                     |
| prefecture_id  | string      | null: false                     |
| days_id        | string      | null: false                     |
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
| postal_code     | text        | null: false                     |
| prefecture_id   | string      | null: false                     |
| city            | string      | null: false                     |
| street_num      | string      | null: false                     |
| building        | string      | null: false                     |
| tel             | integer     | null: false                     |
| user            | references  | null: false, foreign_key: true  |
| item            | references  | null: false, foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :item

extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture