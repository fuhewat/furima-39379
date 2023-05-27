# README

## users
|Column              |Type    |Options                   |
|--------------------|--------|--------------------------|
|nick-name           |text    |null: false               |
|email               |string  |null: false, unique: true |
|encrypted_password  |string  |null: false               |
|name                |string  |null: false               |
|kana_name           |string  |null: false               |
|date_birth          |string  |null: false               |

### Association
has_many :items
has_many :orders


## items
|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|title              |string     |null: false                    |
|description_item   |string     |null: false                    |
|image              |string     |null: false                    |
|price              |integer    |null: false                    |
|category           |string     |null: false                    |
|condition          |string     |null: false                    |
|delivery-charge    |string     |null: false                    |
|sender-area        |string     |null: false                    |
|sender-days        |text       |null: false                    |
|user               |references |null: false, foreign_key: true |

### Association
belongs_to :user
has_one    :order


## orders
|Column  |Type       |Options                        |
|--------|-----------|-------------------------------|
|user    |references |null: false, foreign_key: true |
|item    |references |null: false, foreign_key: true |
|address |references |null: false, foreign_key: true |

### Association
has_one    :address
belongs_to :user
belongs_to :item


## addresses
|Column              |Type       |Options                       |
|--------------------|-----------|-------------------------------|
|post_code           |string     |null: false                    |
|send_prefectures    |string     |null: false                    |
|send_municipalities |string     |null: false                    |
|send_address_number |string     |null: false                    |
|tel_number          |string     |null: false                    |

### Association
belongs_to :order