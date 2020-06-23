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
## ER図
![m-closet-app ER図](https://user-images.githubusercontent.com/64117340/84738119-4435c400-afe4-11ea-8707-989cc5483479.png)

## usersテーブル
|Column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false, pass.match(/[a-z\d]{8, }/i)|
### gem指定
devise
### Association
- has_many :items, dependent: :destroy
- has_many :stylings, dependent: :destroy

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### gem指定
ancestry
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
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :stylings, through: :item_stylings
- has_many :item_stylings,dependent: :destroy
- has_many :item_tags, dependent: :destroy
- has_many :tags, through: :item_tags, dependent: :destroy

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
|scene|string||
|text|string||
|user_id|references|null: false, foreign_key:true|
### Association
- belongs_to :user
- has_many :items, through: :item_stylings
- has_many :item_stylings

## tagsテーブル
|Column| Type|Option|
|------|-----|------|
|name|string|null: false, uniqueness: true|
### Association
- has_many :item_tags, dependent: :destroy
- has_many :tags, through: :item_tags, dependent: :destroy

## item_tagsテーブル
|Column| Type|Option|
|------|-----|------|
|item_id|references|null: false|
|tag_id|references|null: false|
### Association
- belongs_to :items
- belongs_to :tags