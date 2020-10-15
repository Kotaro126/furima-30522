# テーブル設計

## users テーブル

| Column          | Type     | Options     |
| --------------- | ---------| ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| first_name_kana | string   | null: false |
| last_name_kana  | string   | null: false |
| birthday        | date     | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type        | Options                        |
| ---------------| ------------| -------------------------------|
| item_name      | string      | null: false                    |
| description    | text        | null: false                    |
| category_id    | integer     | null: false                    |
| condition_id   | integer     | null: false                    |
| prefecture_id  | integer     | null: false                    |
| price          | integer     | null: false                    |
| deliver_charge | string      | null: false                    |
| deliver_days   | string      | null: false                    |
| user           | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type        | Options                        |
| ------- | ----------- | ------------------------------ |
| user    | references  | null: false, foreign_key: true |
| item    | references  | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| block          | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |
| address        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase