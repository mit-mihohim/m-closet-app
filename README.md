# README
## アプリ名: [m-closet](https://m-closet-app.herokuapp.com/)
## 概要
- 手持ちの服の写真をアップロードし、管理する事ができるアプリです。
- 写真登録時に、タグやシーズンを入力する事によって、カテゴリ分けが可能です。
- お気に入り登録が可能です。

## テストアカウント
こちらのアカウントを利用し、アプリケーションをご体験下さい。
- メールアドレス: testsan@test.com
- パスワード: 12345678 

## 制作背景
服が大好きで、つい気なったものを衝動買いしてしまったり、類似する服が何枚も手元にあったり、いつの間にかクローゼットの中はもので溢れかえってしまいました。
本来なら、活躍するはずの服たちが、”クローゼットの住人”と化してしまう。写真をとって管理する事で、全ての服に活躍の場を与えたいと思い”m-closet"を作成しました。

## 使用技術
- 開発環境
  - Ruby/Ruby on Rails/Haml/Scss/JavaScript/Jquery/Postgresql/Github/Visual Studio Code
- 本番環境
  - AWS(S3)/Heroku/Postgresq
### rails version
Rails 6.0.3.1
### ruby version
ruby 2.5.1

## アプリケーションキャプチャ・工夫したポイント
### トップページ
- ヘッダーをクリックする事で、トップページへ戻る事ができます。
#### トップページで総数やお気に入りの数を明記する事で、活躍できている服、できていない服を数字で確認する事ができます。
[![Image from Gyazo](https://i.gyazo.com/9c170e6684233a7425c7004ce6dfacca.png)](https://gyazo.com/9c170e6684233a7425c7004ce6dfacca)

### アイテム一覧
- ヘッダーナビゲーション内[All Items]をクリックする事で、一覧ページへ遷移できます。
#### 一覧表示でアイテムを確認する事ができ、クローゼットを開ける事なく持ち物を確認する事ができます。
[![Image from Gyazo](https://i.gyazo.com/67716e8cbd97007826ca218031011150.jpg)](https://gyazo.com/67716e8cbd97007826ca218031011150)

### お気に入り機能
- アイテム一覧ページの各アイテム、[Show]を押す事でアイテム詳細ページへ遷移でき、そちらでお気に入り登録する事ができます。
#### お気に入りに登録する事で、自身の好みの傾向を知る事ができます。
[![Image from Gyazo](https://i.gyazo.com/0da4d4133ac5b8a432f6cb1d265d1a2c.gif)](https://gyazo.com/0da4d4133ac5b8a432f6cb1d265d1a2c)

## 今後実装したい機能
- スタイリング機能→アイテムを組み合わせて保存する事ができる機能
- GoogleCloudAPIを利用した、自動タグ付け機能
- スマートフォン対応
- カレンダーを利用した、毎日のスタイリング登録機能
- SNSとの連携、情報取得

# DB設計
## ER図
![m-closet-app ER図 (3)](https://user-images.githubusercontent.com/64117340/85487686-06e6bd00-b608-11ea-8d89-a78073226d5c.png)

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

## favouriteテーブル
|Column| Type|Option|
|------|-----|------|
|item_id|references|null: false|
|user_id|references|null: false|
### Association
- belongs_to :items
- belongs_to :user
