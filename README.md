## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|encrypted_password|string|null: false|
|birthday|date|null: false|
|profile_text|text||

### Association
* has_many :reviews
* has_many :goods

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|item|string|null: false|
|review_text|text|null: false|
|price_range_id|integer|null: false|
|category_id|integer|null: false|
|evaluation_id|integer|null:false|
|user|references|null: false, foreign key: true|

### Association
* has_many :comments
* has_many :goods
* belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment_text|text|null:false|
|user|references|null: false, foreign key: true|
|review|references|null: false, foreign key: true|

### Association
* belongs_to :user
* belongs_to :review

## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign key: true|
|review|references|null: false, foreign key: true|

### Association
* belongs_to :user
* belongs_to :review