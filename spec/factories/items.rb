FactoryBot.define do
  factory :item do
    name              { Faker::Name.name }
    image             { Faker::Lorem.sentence }
    description       { Faker::Lorem.sentence }
    category_id       { '2' }
    condition_id      { '2' }
    prefecture_id     { '2' }
    deliver_charge_id { '2' }
    deliver_day_id    { '2' }
    price             { '300' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
