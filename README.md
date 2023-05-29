# README

## users
|Column              |Type    |Options                   |
|--------------------|--------|--------------------------|
|nick_name           |string  |null: false               |
|email               |string  |null: false, unique: true |
|encrypted_password  |string  |null: false               |
|first_name          |string  |null: false               |
|last_name           |string  |null: false               |
|kana_first_name     |string  |null: false               |
|kana_last_name      |string  |null: false               |
|date_birth          |date    |null: false               |

### Association
has_many :items
has_many :orders


## items
|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|title              |string     |null: false                    |
|description_item   |text       |null: false                    |
|price              |integer    |null: false                    |
|category_id        |integer    |null: false                    |
|condition_id       |integer    |null: false                    |
|delivery_charge_id |integer    |null: false                    |
|send_area_id       |integer    |null: false                    |
|sender_day_id      |integer    |null: false                    |
|user               |references |null: false, foreign_key: true |

### Association
belongs_to :user
has_one    :order


## orders
|Column  |Type       |Options                        |
|--------|-----------|-------------------------------|
|user    |references |null: false, foreign_key: true |
|item    |references |null: false, foreign_key: true |

### Association
has_one    :address
belongs_to :user
belongs_to :item


## addresses
|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|post_code           |string     |null: false                    |
|send_municipalities |string     |null: false                    |
|send_area_id        |integer    |null: false                    |
|send_address_number |string     |null: false                    |
|tel_number          |string     |null: false                    |
|building_name       |string     |                               |
|order               |references |null: false, foreign_key: true |

### Association
belongs_to :order