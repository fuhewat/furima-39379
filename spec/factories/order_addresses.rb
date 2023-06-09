FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    send_area_id { 2 }
    send_municipalities { '台東区' }
    send_address_number { '浅草1-1' }
    building_name { 'ハイツ' }
    tel_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    item_id { 3 }
  end
end
