require 'faker'
FactoryBot.define do
  factory :item do
    association :user
    title                 { 'オムライス' }
    description           { 'これは美味しい' }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_charge_id    { 2 }
    send_area_id          { 2 }
    sender_day_id         { 2 }
    price                 { 500 }
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/omuomu.png'), filename: 'omuomu.png')
    end
   

  end
end
