# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------------------   |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル (商品情報)

| Column                 | Type       | Options                       |
| ----------------       | ------     | -----------------             |
| item_name              | string     | null: false                   |
| item_text              | text       | null: false                   |
| category_id            | integer    | null: false                   |
| item_status_id         | integer    | null: false                   |
| delivery_charge_id     | integer    | null: false                   |
| prefecture_id          | integer    | null: false                   |
| delivery_day           | integer    | null: false                   |
| price                  | integer    | null: false                   |
| user                   | references | null: false foreign_key: true |


### Association

- belongs_to :user
- has_one :order
- has_many :images

## order テーブル (購入者情報)

| Column         | Type       | Options                           |
| ----------     | ------     | --------------------------------- |
| user           | references | null: false foreign_key: true     |
| item           | references | null: false foreign_key: true     |


### Association

- belongs_to :user
- belongs_to :item
- has_one :order_address


## orders_address テーブル (発送先情報)

| Column         | Type       | Options                        |
| ------------   | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | 　　　　　　                     |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order


## images テーブル

| Column         | Type       | Options                        |
| ------------   | ---------- | ------------------------------ |
| image          | string     | null: false                    |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :items
