FactoryBot.define do
  factory :item do
    item_name           { 'hoge' }
    item_text           { Faker::Lorem.sentence }
    category_id         { 2 }
    item_status_id      { 2 }
    delivery_charge_id  { 3 }
    prefecture_id       { 2 }
    delivery_day_id     { 2 }
    price               { '5000' }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end
    association :user
  end
end
