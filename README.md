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
| email                      | string             | null: false, unique: true |
| password                  | encrypted_password | null: false               |
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


## purchases

| Column     | Type        | Options                        |
|------------|-------------|--------------------------------|
| token      | references  | null: false, foreign_key: true |
| user_id    | references  | null: false, foreign_key: true |
| product_id | references  | null: false, foreign_key: true |



### Association

belongs_to :user
has_one :product


## addresses

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| address        | string     | null: false                    |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| municipalities | string     | null: false                    |
| number         | string     | null: false                    |
| building       | string     |                                |
| telephone      | string     | null: false                    |
| purchase_id    | references | null: false, foreign_key: true |

### Association

has_one :purchase