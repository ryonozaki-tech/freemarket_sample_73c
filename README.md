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

## ER図
![DB設計](https://user-images.githubusercontent.com/62594253/80512101-f8897580-89b7-11ea-9714-9aa2f90067cf.jpeg)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e-mail|string|null: false, unique: true, default: ""|
|encrypted_password|string|null: false, default: ""|
|birthday|date|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
### Association
has_one :address, dependent: :destroy
has_one :card, dependent: :destroy
has_many :buyer_items, class_name: 'Item'
has_many :seller_items, class_name: 'Item'

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|street|string|null:false|
|apartment|string||
|phone_number|string||
|user_id|references|foreign_key: true, null: false|
### Association
belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|foreign_key: true, null: false|
### Association
belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|discription|text|null: false|
|condition_id|integer|null: false|
|burden_id|integer|null: false|
|prefecture_id|integer|null: false|
|duration_id|integer|null: false|
|seller_id|references|foreign_key: { to_table: :users }, null: false|
|buyer_id|references|foreign_key: { to_table: :users }, null: false|
|category_id|references|foreign_key: true, null: false|
### Association
belongs_to :buyer, class_name: 'User'
belongs_to :seller, class_name: 'User'
belongs_to :category
has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_image|string|null: false|
|item|references|foreign_key: true, null: false|
### Association
belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true, null: false|
### Association
has_many :items
