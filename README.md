# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users

| Column                    | Type               | Options                   |
|---------------------------|--------------------|---------------------------|
| nickname                  | string             | null: false               |
| email                     | string             | null: false, unique: true |
| encrypted_password        | string             | null: false               |
| birthday                  | date               | null: false               |
| first_name                | string             | null: false               |
| last_name                 | string             | null: false               |
| first_name_kana           | string             | null: false               |
| last_name_kana            | string             | null: false               |

### Association

has_many : products
has_many : purchases


## products

| Column       | Type        | Options                        |
|--------------|-------------|--------------------------------|
| name         | string      | null: false                    |
| explanation  | text        | null: false                    |
| category_id  | integer     | null: false                    |
| status_id    | integer     | null: false                    |
| postage_id   | integer     | null: false                    |
| region_id    | integer     | null: false                    |
| date_id      | integer     | null: false                    |
| price        | integer     | null: false                    |
| user         | references  | null: false, foreign_key: true |


### Association

belongs_to :user
has_one :purchase


## purchases

| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| user       | references  | null: false, foreign_key: true |
| product    | references  | null: false, foreign_key: true |



### Association

belongs_to :user
belongs_to :product
has_one :address


## addresses

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| post_code      | string     | null: false                    |
| region_id      | integer    | null: false                    |
| municipality   | string     | null: false                    |
| number         | string     | null: false                    |
| building       | string     |                                |
| telephone      | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

belongs_to :purchase