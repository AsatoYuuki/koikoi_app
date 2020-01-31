# README

## users table
|Colmun|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|email|string|null: false, unique: true|
|cellphone_number|integer|null: false, unique: true|
|profile|text||
|image|string||
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday|integer|null: false|
|post_number|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|integer||

## association

- has_many :items
- has_many :comments
- has_many :likes
- has_many :sender_reviews, class_name: 'Review', :foreign_key => 'sender_id'
- has_many :receiver_reviews, class_name: 'Review', foreign_key => 'receiver_id'


## items table
|Colmun|Type|Options|
|------|----|-------|
|name|text|null: false, index: true|
|content|text|null: false|
|price|integer|null: false|
|size|string||
|condition|string|null: false|
|send_cost|string|null: false|
|send_method|string|null: false|
|send_price|string|null: folse|
|send_bay|string|null: false|
|buyer_id|integer||
|user_id|integer|null: false,foreign_key: true|
|status|integer|default: 0|
|brand_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|

## association
- has_many :images
- has_many :likes
- has_many :comments
- belongs_to :category
- belongs_to :user
- belongs_to :brand


## categories table
|Colmun|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|

## association
- has_many :items
- has ancestry


## images table
|Colmun|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false,foreig_key:true|

## association
- belong_to :item


## brands table
|Colmun|Type|Options|
|------|----|-------|
|name|string|index: true|

## association
- has_many :items

## comments table
|Colmun|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key:true|
|item_id|integer|null: false, foreign_key: true|

## association
- belong_to :user
- belong_to :item

## likes table
|Colmun|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

## association

- belong_to :user
- belong_to :item

## reviews table 
|Colmun|Type|Options|
|------|----|-------|
|sender_id|integer|null: false, foreign_key: true|
|receiver_id|integer|null: false|

## association
- belongs_to :sender, class_name: 'User', :foreign_key => 'sender_id'
- belongs_to :receiver, class_name: 'User', :foreign_key => 'receiver_id'

