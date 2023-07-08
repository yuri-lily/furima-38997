FactoryBot.define do
  factory :item do
    name { Faker::Name.initials }
    info { Faker::Lorem.sentence }
    category_id { '2' }
    sales_status_id { '2' }
    shipping_fee_status_id { '2' }
    prefecture_id { '2' }
    scheduled_delivery_id { '2' }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/comment.png'), filename: 'test_image.jpg')
    end
  end
end
