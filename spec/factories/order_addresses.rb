FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { 2000 }

  end
end

