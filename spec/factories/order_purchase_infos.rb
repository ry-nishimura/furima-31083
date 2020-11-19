FactoryBot.define do
  factory :order_purchase_info do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { '15' }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '柳ビル123' }
    phone_number { '09012345678' }
  end
end