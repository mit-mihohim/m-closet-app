# README
make closet in your hand
## "m-closet"
1. upload images of your clothes
2. images will be automatically labeled *aiming to achieve auto-label
3. at user's page you can check total count of items, favourite items and "Not much items"
4. by visualizing numbers of items, telling how much waste items they have
5. also by eye-sight all items, easy to tell the favourite type od clothes and will help gathering new items
# production
Heroku
# rails version
Rails 6.0.3.1
# ruby version
ruby 2.5.1

# DB設計
## usersテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false, pass.match(/[a-z\d]{8, }/i)|
### Association
- has_many :items, dependent: :destroy
- has_many :stylings, dependent: :destroy

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### gem指定
gem ancestry
### Association
- has_many :items
- has_ancestry

## itemsテーブル
|Column|Type|Option|
|------|----|------|
|image|string|null: false|
|season|integer|null: false, default: 0|
|color|integer|null: false, default: 0|
|text|string||
|category_id|references|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :stylings, through: :item_stylings
- has_many :item_stylings,dependent: :destroy

## item_stylingsテーブル
|Column|Type|Option|
|------|----|------|
|styling_id|integer|null: false|
|item_id|integer|null: false|
## Association
- belongs_to :items
- belongs_to :stylings

## stylingsテーブル
|Column|Type|Option|
|------|----|------|
|title|string|null: false|
|season|integer|null: false, default 0|
|text|string||
|user_id|references|null: false, foreign_key:true|
### Association
- belongs_to :user
- has_many :items, through: :item_stylings
- has_many :item_stylings
