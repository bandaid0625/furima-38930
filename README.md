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

| Column      | Type        | Option                          |
| ----------- | ----------- | ------------------------------- |
| item_name   | string      | null: false                     |
| description | text        | null: false                     |
| category    | string      | null: false                     |
| condition   | string      | null: false                     |
| charge      | string      | null: false                     |
| ship_from   | string      | null: false                     |
| days        | string      | null: false                     |
| price       | integer     | null: false                     |
| user        | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

-----------------------------------------------------------------------------------
## orders テーブル

| Column       | Type        | Option                          |
| ------------ | ----------- | ------------------------------- |
| postal_code  | text        | null: false                     |
| prefecture   | string      | null: false                     |
| city         | string      | null: false                     |
| street_num   | string      | null: false                     |
| building     | string      | null: false                     |
| tel          | integer     | null: false                     |
| user         | references  | null: false, foreign_key: true  |
| item         | references  | null: false, foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :item