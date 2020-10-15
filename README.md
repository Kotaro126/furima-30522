# テーブル設計

## users テーブル

| Column      | Type     | Options     |
| ----------- | ---------| ----------- |
| nickname    | string   | null: false |
| email       | string   | null: false |
| password    | string   | null: false |
| first_name1 | string   | null: false |
| last_name1  | string   | null: false |
| first_name2 | string   | null: false |
| last_name2  | string   | null: false |
| birthday    | integer  | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type    | Options     |
| ------------ | --------| ----------- |
| item_name    | string  | null: false |
| description  | text    | null: false |
| category     | text    | null: false |
| condition    | text    | null: false |
| price        | integer | null: false |
| prefecture   | string  | null: false |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| credit_num      | integer   | null: false |
| credit_limit    | integer   | null: false |
| security_num    | integer   | null: false |
| deliver_charge  | string    | null: false |
| deliver_day     | string    | null: false |

### Association
- belongs_to :user
- has_one :item
- has_one :address

## addresses テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| postal_code | integer | null: false |
| prefecture  | string  | null: false |
| city        | string  | null: false |
| block       | string  | null: false |
| building    | string  | null: false |
| phone       | integer | null: false |

### Association
- has_one :purchase