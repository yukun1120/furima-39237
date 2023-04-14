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

## user

| Column                    | Type     | Options     |
|---------------------------|----------|-------------|
| nickname                  | string   | null: false |
| mail                      | string   | null: false |
| password                  | string   | null: false |
| password_confirmation     | string   | null: false |
| dd                        | integer  | null: false |
| mm                        | integer  | null: false |
| yyyy                      | integer  | null: false |
| first_name                | string   | null: false |
| last_name                 | string   | null: false |
| first_name_kana           | string   | null: false |
| last_name_kana            | string   | null: false |

### Association

has_many : products
has_many : purchases


## product

| Column       | Type        | Options                        |
|--------------|-------------|--------------------------------|
| name         | string      | null: false                    |
| image        | string      | null: false                    |
| explanation  | text        | null: false                    |
| status       | string      | null: false                    |
| postage      | string      | null: false                    |
| region       | string      | null: false                    |
| date         | string      | null: false                    |
| price        | integer     | null: false                    |
| user_id      | references  | null: false, foreign_key: true |


### Association

belongs_to :user
has_one :purchase


## purchase

| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| token      | string      | null: false, foreign_key: true |
| user_id    | string      | null: false, foreign_key: true |
| product_id | string      | null: false, foreign_key: true |



### Association

belongs_to :user
has_one :product


## address

| Column         | Type        | Options                        |
|----------------|-------------|--------------------------------|
| address        | string      | null: false                    |
| post_code      | integer     | null: false                    |
| prefecture     | string      | null: false                    |
| municipalities | string      | null: false                    |
| number         | integer     | null: false                    |
| building       | string      | null: false                    |
| telephone      | integer     | null: false                   |

### Association

has_one :purchase