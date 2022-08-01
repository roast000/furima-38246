# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| last_name_kana     | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_one :purchaser

## items テーブル

| Column            | Type       | Options                       |
| ------            | ------     | -----------------             |
| item_name         | string     | null: false                   |
| item_text         | text       | null: false                   |
| category          | string     | null: false                   |
| item_status       | string     | null: false                   |
| delivery_charge   | string     | null: false                   |
| delivery_area     | string     | null: false                   |
| delivery_day      | string     | null: false                   |
| price             | string     | null: false                   |
| user              | references | null: false foreign_key: true |


### Association

- belongs_to :user
- has_one :purchaser
- has_many :images


## purchasers テーブル

| Column         | Type       | Options                        |
| ------------   | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures    | string     | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## images テーブル

| Column         | Type       | Options                        |
| ------------   | ---------- | ------------------------------ |
| image          | string     | null: false                    |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :items
